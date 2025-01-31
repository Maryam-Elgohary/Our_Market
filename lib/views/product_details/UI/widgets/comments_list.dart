import 'package:flutter/material.dart';
import 'package:our_market/core/components/custom_circle_pro_indicator.dart';
import 'package:our_market/core/models/product_model.dart';
import 'package:our_market/views/product_details/UI/widgets/user_comments.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CommentsList extends StatelessWidget {
  const CommentsList({
    super.key,
    required this.productModel,
  });
  final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: Supabase.instance.client
            .from("comments_table")
            .stream(primaryKey: ['id'])
            .eq("for_product", productModel.productId!)
            .order("created_at"),
        builder: (_, snapshot) {
          List<Map<String, dynamic>>? data = snapshot.data;
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CustomCircleProIndicator(),
            );
          } else if (snapshot.hasData) {
            return ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => UserComment(
                      commentData: data?[index],
                    ),
                separatorBuilder: (context, index) => const Divider(),
                itemCount: data?.length ?? 0);
          } else if (!snapshot.hasData) {
            return const Center(
              child: Text("No Comments Yet"),
            );
          } else {
            return const Center(
              child: Text("Something went wrong, please try again."),
            );
          }
        });
  }
}
