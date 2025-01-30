import 'package:flutter/material.dart';
import 'package:our_market/views/product_details/UI/widgets/user_comments.dart';

class CommentsList extends StatelessWidget {
  const CommentsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) => const UserComment(),
        separatorBuilder: (context, index) => const Divider(),
        itemCount: 10);
  }
}
