import 'package:flutter/material.dart';
import 'package:senacomerce/view2/product/components/product_loading_card.dart';
import 'package:senacomerce/view2/product/components/product_loading_card.dart';

class ProductLoadingGrid2 extends StatelessWidget {
  const ProductLoadingGrid2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 2/3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10
      ),
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.all(10),
      itemCount: 6,
      itemBuilder: (context, index) => const ProductLoadingCard2(),
    );
  }
}