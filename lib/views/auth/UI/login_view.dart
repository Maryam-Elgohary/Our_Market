import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:our_market/core/app_colors.dart';
import 'package:our_market/core/components/custom_circle_pro_indicator.dart';
import 'package:our_market/core/functions/navigate_to.dart';
import 'package:our_market/core/functions/show_msg.dart';
import 'package:our_market/views/auth/UI/forget_view.dart';
import 'package:our_market/views/auth/UI/signup_view.dart';
import 'package:our_market/views/auth/UI/widgets/custom_row_with_arrow.dart';
import 'package:our_market/views/auth/UI/widgets/custom_text_btn.dart';
import 'package:our_market/views/auth/UI/widgets/custom_text_field.dart';
import 'package:our_market/views/auth/logic/cubit/authentication_cubit.dart';
import 'package:our_market/views/nav_bar/UI/main_home_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticationCubit, AuthenticationState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => MainHomeView()));
        }
        if (state is LoginError) {
          showMsg(context, state.message);
        }
      },
      builder: (context, state) {
        AuthenticationCubit cubit = context.read<AuthenticationCubit>();
        return Scaffold(
            body: state is LoginLoading
                ? CustomCircleProIndicator()
                : SafeArea(
                    child: SingleChildScrollView(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 24,
                          ),
                          const Text(
                            "Welcome to our market",
                            style: TextStyle(
                                fontSize: 28, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          Card(
                            color: AppColors.kWhiteColor,
                            margin: const EdgeInsets.all(24),
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(16))),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                children: [
                                  CustomTextFormField(
                                    controller: emailController,
                                    labelText: "Email",
                                    keyboardType: TextInputType.emailAddress,
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  CustomTextFormField(
                                    controller: passwordController,
                                    labelText: "Password",
                                    keyboardType: TextInputType.visiblePassword,
                                    isSecured: true,
                                    suffIcon: IconButton(
                                      onPressed: () {},
                                      icon: const Icon(Icons.visibility_off),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      CustomTextButton(
                                        text: 'Forget Password?',
                                        onTap: () {
                                          naviagteTo(
                                              context, const ForgetView());
                                        },
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  CustomRowWithArrowBtn(
                                    text: 'Login',
                                    onTap: () {
                                      if (_formKey.currentState!.validate()) {
                                        cubit.login(
                                            email: emailController.text,
                                            password: passwordController.text);
                                      }
                                    },
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  CustomRowWithArrowBtn(
                                    text: 'Login with Google',
                                    onTap: () {
                                      naviagteTo(context, MainHomeView());
                                    },
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Don't have an account?",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      CustomTextButton(
                                        text: "Sign Up",
                                        onTap: () {
                                          naviagteTo(
                                              context, const SignupView());
                                        },
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )));
      },
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
