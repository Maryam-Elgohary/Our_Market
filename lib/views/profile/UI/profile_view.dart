import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:our_market/core/app_colors.dart';
import 'package:our_market/core/components/custom_circle_pro_indicator.dart';
import 'package:our_market/core/functions/navigate_to.dart';
import 'package:our_market/core/functions/navigate_without_back.dart';
import 'package:our_market/views/auth/UI/login_view.dart';
import 'package:our_market/views/auth/logic/cubit/authentication_cubit.dart';
import 'package:our_market/views/profile/UI/my_orders.dart';
import 'package:our_market/views/profile/UI/widgets/custom_row_btn.dart';
import 'package:our_market/views/profile/UI/widgets/edit_name_view.dart';
import 'package:our_market/views/profile/models/user_model.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticationCubit, AuthenticationState>(
      listener: (context, state) {
        if (state is LogoutSuccess) {
          navigateWithoutBack(context, const LoginView());
        }
      },
      builder: (context, state) {
        UserDataModel? user = context.read<AuthenticationCubit>().userDataModel;
        return state is LogoutLoading
            ? const CustomCircleProIndicator()
            : Center(
                child: SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.75,
                  child: Card(
                    color: AppColors.kWhiteColor,
                    margin: const EdgeInsets.all(24),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16))),
                    child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            const CircleAvatar(
                              radius: 55,
                              backgroundColor: AppColors.kPrimaryColor,
                              foregroundColor: AppColors.kWhiteColor,
                              child: Icon(
                                Icons.person,
                                size: 40,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              user?.name ?? "name",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 10),
                            Text(user?.email ?? "email"),
                            const SizedBox(height: 10),
                            CustomRowBtn(
                                icon: Icons.person,
                                text: "Edit Name",
                                onTap: () {
                                  naviagteTo(context, const EditNameView());
                                }),
                            const SizedBox(height: 10),
                            CustomRowBtn(
                                icon: Icons.shopping_basket,
                                text: "My Orders",
                                onTap: () {
                                  naviagteTo(context, const MyOrdersView());
                                }),
                            const SizedBox(height: 10),
                            CustomRowBtn(
                                icon: Icons.logout,
                                text: "Log Out",
                                onTap: () async {
                                  await context
                                      .read<AuthenticationCubit>()
                                      .signOut();
                                })
                          ],
                        )),
                  ),
                ),
              );
      },
    );
  }
}
