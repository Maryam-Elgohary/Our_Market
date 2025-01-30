import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:our_market/views/profile/models/user_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit() : super(AuthenticationInitial());

  SupabaseClient client = Supabase.instance.client;

  Future<void> login({required String email, required String password}) async {
    emit(LoginLoading());
    try {
      final result = await client.auth
          .signInWithPassword(password: password, email: email);
      if (result.user != null) {
        // User is signed in, now fetch their data
        await getUserData();
        emit(LoginSuccess());
      } else {
        log("Login failed: no user returned.");
        emit(LoginError("Login failed"));
      }
    } on AuthException catch (e) {
      log(e.toString());
      emit(LoginError(e.message));
    } catch (e) {
      log(e.toString());
      emit(LoginError(e.toString()));
    }
  }

  GoogleSignInAccount? googleUser;
  Future<AuthResponse> googleSignIn() async {
    emit(GoogleSignInLoading());

    const webClientId =
        '821287914646-k41dsjdl2hhn1ju7rs68998vco27estn.apps.googleusercontent.com';

    final GoogleSignIn googleSignIn = GoogleSignIn(
      serverClientId: webClientId,
    );
    googleUser = await googleSignIn.signIn();
    if (googleUser == null) {
      return AuthResponse();
    }
    final googleAuth = await googleUser!.authentication;
    final accessToken = googleAuth.accessToken;
    final idToken = googleAuth.idToken;

    if (accessToken == null || idToken == null) {
      emit(GoogleSignInError());
      return AuthResponse();
    }

    AuthResponse response = await client.auth.signInWithIdToken(
      provider: OAuthProvider.google,
      idToken: idToken,
      accessToken: accessToken,
    );
    final userId = response.user?.id;
    if (userId == null) {
      throw Exception("User ID is null after sign-up");
    }
    await addUserData(
        userId: userId,
        name: googleUser!.displayName!,
        email: googleUser!.email);
    await getUserData();
    emit(GoogleSignInSuccess());
    return response;
  }

  Future<void> resetPasswords({required String email}) async {
    emit(PasswordResetLoading());
    try {
      await client.auth.resetPasswordForEmail(email);
      emit(PasswordResetSuccess());
    } catch (e) {
      log(e.toString());
      emit(PasswordResetError());
    }
  }

  Future<void> signOut() async {
    emit(LoginLoading());
    try {
      await client.auth.signOut();
      emit(LogoutSuccess());
    } catch (e) {
      log(e.toString());
      emit(LogoutError());
    }
  }

  Future<void> register({
    required String name,
    required String email,
    required String password,
  }) async {
    emit(SignUpLoading());
    try {
      // Sign up the user and get the response
      final authResponse = await client.auth
          .signUp(password: password, email: email, data: {'full_name': name});

      // Get the user ID from the response
      final userId = authResponse.user?.id;
      if (userId == null) {
        throw Exception("User ID is null after sign-up");
      }

      // Add user data using the userId
      await addUserData(userId: userId, name: name, email: email);
      await getUserData();
      emit(SignUpSuccess());
    } on AuthException catch (e) {
      log(e.toString());
      emit(SignUpError(e.message));
    } catch (e) {
      log(e.toString());
      emit(SignUpError(e.toString()));
    }
  }

//insert ==> add only
//upsert ==> add or update
  Future<void> addUserData({
    required String userId,
    required String name,
    required String email,
  }) async {
    emit(UserDataAddedLoading());
    try {
      await client
          .from('users')
          .upsert({'id': userId, 'name': name, 'email': email});
      emit(UserDataAddedSuccess());
    } catch (e) {
      log(e.toString());
      emit(UserDataAddedError());
    }
  }

  UserDataModel? userDataModel;
  Future<void> getUserData() async {
    emit(GetUserDataLoading());
    try {
      final userId = client.auth.currentUser!.id;
      final data = await client.from("users").select().eq('id', userId);
      log(data.toString());
      if (data.isNotEmpty) {
        userDataModel = UserDataModel(
          email: data[0]['email'],
          name: data[0]['name'],
          userId: data[0]['id'],
        );
        emit(GetUserDataSuccess());
      }
    } catch (e) {
      log(e.toString());
      emit(GetUserDataError());
    }
  }
}
