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
            .from("coments_table")
            .stream(primaryKey: ['id'])
            .eq("for_product", productModel.productId!)
            .order("created_at"),
        builder: (_, snapshot) {
          SupabaseStreamEvent? data = snapshot.data;
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CustomCircleProIndicator(),
            );
          } else if (snapshot.hasData) {
            return ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => const UserComment(),
                separatorBuilder: (context, index) => const Divider(),
                itemCount: 10);
          } else if (!snapshot.hasData) {
            return Center(
              child: Text("No Comments Yet"),
            );
          } else {
            return Center(
              child: Text("Something went wrong, please try again."),
            );
          }
        });
  }
}
