import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:our_market/core/app_colors.dart';
import 'package:our_market/views/auth/UI/login_view.dart';
import 'package:our_market/views/auth/logic/cubit/authentication_cubit.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://adfznwtttqzsiuzjvyun.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImFkZnpud3R0dHF6c2l1emp2eXVuIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzgwNTczMDYsImV4cCI6MjA1MzYzMzMwNn0.M9tetd94urVsetYBWQPD3byC488acxo9C7W_fJqxhBM',
  );
  runApp(const OurMarket());
}

class OurMarket extends StatelessWidget {
  const OurMarket({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthenticationCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Our Market',
        theme: ThemeData(
          scaffoldBackgroundColor: AppColors.kScaffoldColor,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: LoginView(),
      ),
    );
  }
}
