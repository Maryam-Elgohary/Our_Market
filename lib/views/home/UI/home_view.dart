import 'package:flutter/material.dart';
import 'package:our_market/core/components/custom_search_field.dart';
import 'package:our_market/views/home/UI/widgets/categories_list.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: [
          const CustomSearchField(),
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
          const Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(16))),
            child: Column(
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(16),
                          bottomRight: Radius.circular(16),
                          bottomLeft: Radius.circular(16)),
                      child: Image(
                          image: NetworkImage(
                              "https://img.freepik.com/premium-psd/kitchen-product-podium-display-background_1101917-13418.jpg?w=900")),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
