import 'package:flutter/material.dart';
import 'package:our_market/core/components/custom_search_field.dart';
import 'package:our_market/core/components/prodcts_list.dart';
import 'package:our_market/core/functions/navigate_to.dart';
import 'package:our_market/views/home/UI/search_view.dart';
import 'package:our_market/views/home/UI/widgets/categories_list.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: [
          CustomSearchField(
            onPressed: () => naviagteTo(context, const SearchView()),
          ),
          const SizedBox(
            height: 20,
          ),
          Image.asset("assets/buy.jpg"),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "Popular Categories",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 20,
          ),
          const CategoriesList(),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "Recently Products",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 20,
          ),
          const ProductsList()
        ],
      ),
    );
  }
}
