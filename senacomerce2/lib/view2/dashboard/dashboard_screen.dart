import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:get/get.dart';
import 'package:senacomerce/controller/dashboard_controller.dart';
import 'package:senacomerce/view2/category/category_screen.dart';
import 'package:senacomerce/view2/home/home_screen.dart';
import 'package:senacomerce/view2/product/product_screen.dart';

import '../account/account_screen.dart';
import '../home/home_screen.dart';
import '../product/product_screen.dart';

class DashboardScreen2 extends StatefulWidget {
  const DashboardScreen2({Key? key}) : super(key: key);

  @override
  State<DashboardScreen2> createState() => _DashboardScreen2State();
}

class _DashboardScreen2State extends State<DashboardScreen2> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(
      builder: (controller) => Scaffold(
        backgroundColor: Colors.grey.shade100,
        body: SafeArea(
          child: IndexedStack(
            index: controller.tabIndex,
            children: const [
              HomeScreen2(),
              ProductScreen2(),
              CategoryScreen2(),
              AccountScreen()
            ],
          ),
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                  top: BorderSide(
                      color: Theme.of(context).colorScheme.secondary,
                      width: 0.7
                  )
              )
          ),
          child: SnakeNavigationBar.color(
            behaviour: SnakeBarBehaviour.floating,
            snakeShape: SnakeShape.circle,
            padding: const EdgeInsets.symmetric(vertical: 5),
            unselectedLabelStyle: const TextStyle(fontSize: 11),
            snakeViewColor: Colors.green,
            unselectedItemColor: Colors.green,
            showUnselectedLabels: true,
            currentIndex: controller.tabIndex,
            onTap: (val){
              controller.updateIndex(val);
            },
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Inicio'),
              BottomNavigationBarItem(icon: Icon(Icons.category), label: 'Categoria'),
              BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'Menu'),
              BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: 'Perfil')
            ],
          ),
        ),
      ),
    );
  }
}




