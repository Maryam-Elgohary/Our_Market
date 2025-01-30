import 'package:flutter/material.dart';
import 'package:our_market/core/components/prodcts_list.dart';
import 'package:our_market/core/functions/build_appbar.dart';

class MyOrdersView extends StatelessWidget {
  const MyOrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCustomAppBar(context, "My Orders"),
      body: const ProductsList(
        shrinkWrap: false,
        physics: BouncingScrollPhysics(),
      ),
    );
  }
}
