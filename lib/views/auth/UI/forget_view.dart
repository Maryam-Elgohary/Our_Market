import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:our_market/core/app_colors.dart';
import 'package:our_market/core/components/custom_circle_pro_indicator.dart';
import 'package:our_market/core/functions/show_msg.dart';
import 'package:our_market/views/auth/UI/widgets/custom_elevated_btn.dart';
import 'package:our_market/views/auth/UI/widgets/custom_text_field.dart';
import 'package:our_market/views/auth/logic/cubit/authentication_cubit.dart';

class ForgetView extends StatefulWidget {
  const ForgetView({super.key});

  @override
  State<ForgetView> createState() => _ForgetViewState();
}

class _ForgetViewState extends State<ForgetView> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticationCubit, AuthenticationState>(
      listener: (context, state) {
        if (state is PasswordResetSuccess) {
          Navigator.pop(context);
          showMsg(context, "Email was sent");
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: state is PasswordResetLoading
              ? const CustomCircleProIndicator()
              : SafeArea(
                  child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 24,
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Enter your email to reset password",
                          style: TextStyle(
                              fontSize: 28, fontWeight: FontWeight.bold),
                        ),
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
                              CustomEBtn(
                                text: 'Submit',
                                onTap: () {
                                  if (formKey.currentState!.validate()) {
                                    context
                                        .read<AuthenticationCubit>()
                                        .resetPasswords(
                                            email: emailController.text);
                                  }
                                },
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                )),
        );
      },
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }
}
