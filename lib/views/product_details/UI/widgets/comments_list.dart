import 'package:flutter/material.dart';
import 'package:our_market/views/product_details/UI/product_details_view.dart';
import 'package:our_market/views/product_details/UI/widgets/user_comments.dart';

class CommentsList extends StatelessWidget {
  const CommentsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) => UserComment(),
        separatorBuilder: (context, index) => Divider(),
        itemCount: 10);
  }
}
