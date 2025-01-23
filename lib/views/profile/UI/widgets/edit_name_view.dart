import 'package:flutter/material.dart';
import 'package:our_market/core/functions/build_appbar.dart';
import 'package:our_market/views/auth/UI/widgets/custom_elevated_btn.dart';
import 'package:our_market/views/auth/UI/widgets/custom_text_field.dart';

class EditNameView extends StatelessWidget {
  const EditNameView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCustomAppBar(context, "Edit Name"),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            CustomTextFormField(
              labelText: "Enter Name",
              keyboardType: TextInputType.name,
            ),
            const SizedBox(height: 20),
            CustomEBtn(
              text: "Update",
              onTap: () {},
            )
          ],
        ),
      ),
    );
  }
}
