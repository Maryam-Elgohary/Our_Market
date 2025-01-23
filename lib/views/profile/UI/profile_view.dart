import 'package:flutter/material.dart';
import 'package:our_market/core/app_colors.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Card(
      color: AppColors.kWhiteColor,
      margin: EdgeInsets.all(24),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16))),
      child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              CircleAvatar(
                radius: 55,
                backgroundColor: AppColors.kPrimaryColor,
                foregroundColor: AppColors.kWhiteColor,
                child: Icon(
                  Icons.person,
                  size: 40,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Maryam Elgohary",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text("maryamelgohary4@gmail.com"),
              SizedBox(height: 10),
              Card(
                color: AppColors.kPrimaryColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16))),
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.person,
                        color: AppColors.kWhiteColor,
                      ),
                      Text(
                        "Edit Name",
                        style: TextStyle(
                            fontSize: 20, color: AppColors.kWhiteColor),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: AppColors.kWhiteColor,
                      ),
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }
}
