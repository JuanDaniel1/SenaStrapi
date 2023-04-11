import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:senacomerce/component/main_header.dart';
import 'package:senacomerce/controller/controllers.dart';
import 'package:senacomerce/view2/home/components/popular_category/popular_category.dart';
import 'package:senacomerce/view2/home/components/popular_product/popular_product.dart';
import 'package:senacomerce/view2/home/components/popular_product/popular_product_loading.dart';
import 'package:senacomerce/view2/home/components/section_title.dart';

import 'components/carousel_slider/carousel_slider_view.dart';
import 'components/popular_category/popular_category_loading.dart';
import 'components/carousel_slider/carousel_loading.dart';

class HomeScreen2 extends StatelessWidget {
  const HomeScreen2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
          children: [
            MainHeader(),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    Obx(() {
                      if (homeController.bannerList.isNotEmpty) {
                        return CarouselSliderView2(
                            bannerList: homeController.bannerList);
                      } else {
                        return const CarouselLoading2();
                      }
                    }),
                    const SectionTitle(title: "Categoria Popular"),
                    Obx(() {
                      if (homeController.popularCategoryList.isNotEmpty) {
                        return PopularCategory(
                            categories: homeController.popularCategoryList);
                      } else {
                        return const PopularCategoryLoading();
                      }
                    }),
                    const SectionTitle(title: "Producto Popular"),
                    Obx(() {
                      if (homeController.popularProductList.isNotEmpty) {
                        return PopularProduct(
                            popularProducts: homeController.popularProductList);
                      } else {
                        return const PopularProductLoading();
                      }
                    }),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}