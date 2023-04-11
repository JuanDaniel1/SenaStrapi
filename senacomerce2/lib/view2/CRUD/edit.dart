
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:senacomerce/route/app_route.dart';
import 'package:senacomerce/model/product.dart';
import 'package:senacomerce/view2/CRUD/create.dart';
import 'package:senacomerce/view2/dashboard/dashboard_screen.dart';

import '../../customisation/text_field.dart';
import '../../view/dashboard/dashboard_binding.dart';
import '../../view/dashboard/dashboard_screen.dart';

class EditMoto extends StatefulWidget {

  final product;
  const EditMoto({super.key, required this.product});

  @override
  State<EditMoto> createState() => _EditMotoState();
}

class _EditMotoState extends State<EditMoto> {

  void editUser({
    required Product product,
    required String name,
    required String description,
    required String images,
    required double price


  }) async {
    @override

    const String url = "http://localhost:4410/api/products/";

    final Map<String, String> dataHeader = {
      'Access-Control-Allow-Methods': '[GET, POST, PUT, DELETE, HEAD, OPTIONS]',
      'Content-Type': 'application/json; charset=UTF-8',
    };
    final Map<String, dynamic> dataBody = {
      "name": name,
      "description": description,
      "images": images,
      "price": price

    };
    final response = await http.put(
      Uri.parse(url + product.id.toString()),
      headers: dataHeader,
      body: json.encode({'data': dataBody}),
    );

    if (response.statusCode == 200) {
      print(response.reasonPhrase);
      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>DashboardScreen2()));
      GetPage(
          name: AppRoute.dashboard,
          page: () => const DashboardScreen(),
          binding: DashboardBinding2()

      );
    } else {
      print(response.statusCode);
      print(response.reasonPhrase);
    }
  }
  @override
  Widget build(BuildContext context) {
    TextEditingController nameController =
    TextEditingController(text: product.name);
    TextEditingController descriptionController =
    TextEditingController(text: product.description);
    TextEditingController imagesController =
    TextEditingController(text: product.images);
    TextEditingController priceController =
    TextEditingController(text: product.price.toString());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[800],
        elevation: 0.0,
        title: const Text('Editar Producto'),
      ),
      body:
      SingleChildScrollView(
          child:Stack(
            children: [
              Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/Fondo.jpg'),fit: BoxFit.cover
                      ),
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: <Color>[
                            Color(0xFFE8EAF6),
                            Color(0xFF7986CB)
                          ]
                      )
                  ),
                  child:Center(
                    child:Padding(
                        padding: const EdgeInsets.only(
                            top: 100,
                            bottom: 100,
                            left: 18,
                            right: 18
                        ),
                        child:Center(
                          child:Container(
                            height: 500,
                            width: 400,

                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: <Color>[
                                  Color(0xFFAED581),
                                  Color(0XFF33691E)])
                            ),
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Padding(padding: EdgeInsets.all(40),
                                    child: Text(
                                      'Editar',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 40,
                                          fontWeight: FontWeight.bold
                                      ),
                                    ),),
                                  Container(
                                    width: 300,
                                    decoration: const BoxDecoration(
                                        boxShadow: []
                                    ),
                                    child: Textfield(
                                        controller: nameController,
                                        onChanged: (val) {

                                          nameController.value =
                                              nameController.value.copyWith(text: val);
                                          // namecontroller.value =
                                          // namecontroller.value.copyWith(text: val);
                                        },
                                        textDirection: TextDirection.ltr,
                                        hinText: 'Nombre',
                                        hintStyle: const TextStyle(
                                            fontSize: 20.0,
                                            color: Colors.redAccent
                                        ),
                                        icon: const Icon(
                                          Icons.production_quantity_limits,
                                          color: Colors.redAccent,
                                        )
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    width: 300,
                                    decoration: const BoxDecoration(boxShadow: []),
                                    child: Textfield(
                                      controller: descriptionController,
                                      onChanged: (val) {

                                        descriptionController.value =
                                            descriptionController.value.copyWith(text: val);
                                        // emailController.value =
                                        // emailController.value.copyWith(text: val);
                                      },
                                      textDirection: TextDirection.ltr,
                                      hinText: 'Descripcion',
                                      hintStyle: const TextStyle(
                                          fontSize: 20.0,
                                          color: Colors.redAccent
                                      ),
                                      icon: const Icon(
                                        Icons.text_fields,
                                        color: Colors.redAccent,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    width: 300,
                                    decoration: const BoxDecoration(boxShadow: []),
                                    child: Textfield(
                                      controller: imagesController,
                                      onChanged: (val) {

                                        imagesController.value =
                                            imagesController.value.copyWith(text: val);
                                        // emailController.value =
                                        // emailController.value.copyWith(text: val);
                                      },
                                      textDirection: TextDirection.ltr,
                                      hinText: 'URL',
                                      hintStyle: const TextStyle(
                                          fontSize: 20.0,
                                          color: Colors.redAccent
                                      ),
                                      icon: const Icon(
                                        Icons.image,
                                        color: Colors.redAccent,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    width: 300,
                                    decoration: const BoxDecoration(boxShadow: []),
                                    child: Textfield(
                                      controller: priceController,
                                      onChanged: (val) {

                                        priceController.value =
                                            priceController.value.copyWith(text: val);
                                        // emailController.value =
                                        // emailController.value.copyWith(text: val);
                                      },
                                      textDirection: TextDirection.ltr,
                                      hinText: 'Price',
                                      hintStyle: const TextStyle(
                                          fontSize: 20.0,
                                          color: Colors.redAccent
                                      ),
                                      icon: const Icon(
                                        Icons.monetization_on,
                                        color: Colors.redAccent,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),

                                  SizedBox(
                                    width: 100,
                                    child: TextButton(
                                      style: TextButton.styleFrom(
                                          backgroundColor: Colors.green
                                      ),
                                      onPressed: () {
                                        double price = double.parse(priceController.text);
                                        editUser(
                                          product: widget.product,
                                          name: nameController.text,
                                          description: descriptionController.text,
                                          images: imagesController.text,
                                          price: price,



                                        );

                                      },
                                      child: const Text('Save'),
                                    ),
                                  )
                                ],
                              ),
                            ),

                          ),

                        )

                    ),


                  )

              )

            ],
          )



      ),
    );
  }
}
