import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:our_market/core/app_colors.dart';
import 'package:our_market/core/functions/my_observer.dart';
import 'package:our_market/core/functions/sensitive_data.dart';
import 'package:our_market/views/auth/UI/login_view.dart';
import 'package:our_market/views/auth/logic/cubit/authentication_cubit.dart';
import 'package:our_market/views/nav_bar/UI/main_home_view.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://adfznwtttqzsiuzjvyun.supabase.co',
    anonKey: anonKey,
  );
  Bloc.observer = MyObserver();

  runApp(const OurMarket());
}

class OurMarket extends StatelessWidget {
  const OurMarket({super.key});

  @override
  Widget build(BuildContext context) {
    SupabaseClient client = Supabase.instance.client;

    return BlocProvider(
      create: (context) => AuthenticationCubit()..getUserData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Our Market',
        theme: ThemeData(
          scaffoldBackgroundColor: AppColors.kScaffoldColor,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: client.auth.currentUser != null
            ? MainHomeView()
            : const LoginView(),
      ),
    );
  }
}


// 