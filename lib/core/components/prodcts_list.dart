import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:our_market/core/components/custom_circle_pro_indicator.dart';
import 'package:our_market/core/components/product_card.dart';
import 'package:our_market/core/cubit/home_cubit.dart';
import 'package:our_market/core/functions/show_msg.dart';
import 'package:our_market/core/models/product_model.dart';

class ProductsList extends StatelessWidget {
  const ProductsList(
      {super.key,
      this.shrinkWrap,
      this.physics,
      this.query,
      this.category,
      this.isFavoriteView = false,
      this.isMyOrdersView = false});
  final bool? shrinkWrap;
  final ScrollPhysics? physics;
  final String? query;
  final String? category;
  final bool isFavoriteView;
  final bool isMyOrdersView;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          HomeCubit()..getProducts(query: query, category: category),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {
          if (state is BuyProductSuccess) {
            showMsg(context, "Payment Success, check your orders");
          }
        },
        builder: (context, state) {
          HomeCubit homeCubit = context.read<HomeCubit>();
          List<ProductModel> products = query != null
              ? context.read<HomeCubit>().searchResults
              : category != null
                  ? context.read<HomeCubit>().categoryProducts
                  : isFavoriteView
                      ? homeCubit.favoriteProductList
                      : isMyOrdersView
                          ? homeCubit.userOrders
                          : context.read<HomeCubit>().products;
          return state is GetDataLoading
              ? const CustomCircleProIndicator()
              : ListView.builder(
                  shrinkWrap: shrinkWrap ?? true,
                  physics: physics ?? const NeverScrollableScrollPhysics(),
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    return ProductCard(
                      onPaymentSuccess: () {
                        homeCubit.buyProduct(
                            productId: products[index].productId!);
                      },
                      isFavorite:
                          homeCubit.checkIsFavorite(products[index].productId!),
                      product: products[index],
                      onTap: () {
                        bool isFavorite = homeCubit
                            .checkIsFavorite(products[index].productId!);
                        isFavorite
                            ? homeCubit
                                .removeFavorite(products[index].productId!)
                            : homeCubit
                                .addToFavorite(products[index].productId!);
                      },
                    );
                  });
        },
      ),
    );
  }
}
