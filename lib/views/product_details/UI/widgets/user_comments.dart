import 'package:flutter/material.dart';

class UserComment extends StatelessWidget {
  const UserComment({
    super.key,
    required this.commentData,
  });
  final Map<String, dynamic>? commentData;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              commentData?["user_name"] ?? "User Name",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        Row(
          children: [
            Text(commentData?["comment"] ?? "comment"),
          ],
        ),
        commentData?["reply"] != null
            ? Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "Reply",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(commentData!["reply"]),
                    ],
                  )
                ],
              )
            : Container()
      ],
    );
  }
}
