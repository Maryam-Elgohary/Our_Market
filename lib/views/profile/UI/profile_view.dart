import 'package:flutter/material.dart';
import 'package:our_market/core/app_colors.dart';
import 'package:our_market/core/functions/navigate_to.dart';
import 'package:our_market/views/profile/UI/my_orders.dart';
import 'package:our_market/views/profile/UI/widgets/custom_row_btn.dart';
import 'package:our_market/views/profile/UI/widgets/edit_name_view.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.7,
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
                const Text(
                  "Maryam Elgohary",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                const Text("maryamelgohary4@gmail.com"),
                const SizedBox(height: 10),
                CustomRowBtn(
                    icon: Icons.person,
                    text: "Edit Name",
                    onTap: () {
                      naviagteTo(context, EditNameView());
                    }),
                const SizedBox(height: 10),
                CustomRowBtn(
                    icon: Icons.shopping_basket,
                    text: "My Orders",
                    onTap: () {
                      naviagteTo(context, MyOrdersView());
                    }),
                const SizedBox(height: 10),
                CustomRowBtn(icon: Icons.logout, text: "Log Out", onTap: () {})
              ],
            )),
      ),
    );
  }
}
