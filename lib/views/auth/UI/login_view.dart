import 'package:flutter/material.dart';
import 'package:our_market/core/app_colors.dart';
import 'package:our_market/core/functions/navigate_to.dart';
import 'package:our_market/views/auth/UI/forget_view.dart';
import 'package:our_market/views/auth/UI/widgets/custom_row_with_arrow.dart';
import 'package:our_market/views/auth/UI/widgets/custom_text_btn.dart';
import 'package:our_market/views/auth/UI/widgets/custom_text_field.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 24,
          ),
          const Text(
            "Welcome to our market",
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 24,
          ),
          Card(
            color: AppColors.kWhiteColor,
            margin: const EdgeInsets.all(24),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(16))),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  const CustomTextFormField(
                    labelText: "Email",
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextFormField(
                    labelText: "Password",
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
                          naviagteTo(context, const ForgetView());
                        },
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomRowWithArrowBtn(
                    text: 'Login',
                    onTap: () {},
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomRowWithArrowBtn(
                    text: 'Login with Google',
                    onTap: () {},
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account?",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      CustomTextButton(
                        text: "Sign Up",
                        onTap: () {},
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    )));
  }
}
