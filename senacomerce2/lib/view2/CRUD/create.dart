
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:senacomerce/main.dart';
import 'package:senacomerce/view/dashboard/dashboard_binding.dart';
import 'package:senacomerce/view2/dashboard/dashboard_screen.dart';
import 'package:http/http.dart' as http;
import 'package:senacomerce/view2/product/product_screen.dart';

import 'dart:convert';
import 'dart:async';

import '../../customisation/text_field.dart';
import '../../model/product.dart';
import 'package:image_picker/image_picker.dart';

import '../../view/dashboard/dashboard_screen.dart';
import 'package:senacomerce/route/app_route.dart';

class CreateUser extends StatefulWidget {




  CreateUser({Key? key});


  @override
  State<CreateUser> createState() => _CreateUserState();
}
Product product = Product(id: 0, description: '', name: '', images: '', price: 0);



class _CreateUserState extends State<CreateUser> {


  final TextEditingController _descriptionController =
  TextEditingController(text: product.description);
  final TextEditingController _nameController =
  TextEditingController(text: product.name);
  final TextEditingController _imagesController =
  TextEditingController(text: product.images);
  final TextEditingController _priceController =
  TextEditingController(text: product.price.toString());




  @override

  void dispose(){
    super.dispose();
    _descriptionController.dispose();
    _nameController.dispose();
    _imagesController.dispose();
    _priceController.dispose();
  }

  Future save() async {
    const String url = "http://localhost:4410/api/products/";

    final Map<String, String> dataHeader = {
      'Content-Type': 'application/json; charset=UTF-8',
    };

    final Map<String, dynamic> dataBody = {
      "name": _nameController.text,
      "description": _descriptionController.text,
      "images": _imagesController.text,
      "price": _priceController.text

    };
    await http.post(
      Uri.parse(url),
      headers: dataHeader,
      body: json.encode({'data': dataBody}),
    );
    Navigator.pop(context);
      GetPage(
          name: AppRoute.dashboard,
          page: () => const DashboardScreen(),
          binding: DashboardBinding2()

      );


  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[800],
        elevation: 0.0,
        title: const Text('Agregar Producto'),
      ),
      body: SingleChildScrollView(
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
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 100,
                          bottom: 100,
                          left: 18,
                          right: 18
                      ),
                      child: Container(
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
                                Padding(padding: EdgeInsets.all(40),
                                  child: Text(
                                    'Agregar',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 40,
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),),
                                Container(
                                  width: 300,
                                  decoration: const BoxDecoration(boxShadow: []),
                                  child: Textfield(
                                    controller: _nameController,

                                    textDirection: TextDirection.ltr,
                                    hinText: 'Nombre',
                                    hintStyle: const TextStyle(
                                      fontSize: 20.0,
                                      color: Colors.redAccent,
                                    ),
                                    icon: const Icon(
                                      Icons.production_quantity_limits,
                                      color: Colors.redAccent,
                                    ),


                                  ),
                                ),
                                const SizedBox(height: 10,),
                                Container(
                                  width: 300,
                                  decoration: const BoxDecoration(boxShadow: []),
                                  child: Textfield(
                                      controller: _descriptionController,

                                      textDirection: TextDirection.ltr,
                                      hinText: 'Descripcion',
                                      hintStyle: const TextStyle(
                                          fontSize: 20.0,
                                          color: Colors.redAccent
                                      ),
                                      icon: const Icon(
                                        Icons.text_fields,
                                        color: Colors.redAccent,
                                      )
                                  ),
                                ),
                                const SizedBox(height: 10,),
                                Container(
                                  width: 300,
                                  decoration: const BoxDecoration(boxShadow: []),
                                  child: Textfield(
                                      controller: _imagesController,

                                      textDirection: TextDirection.ltr,
                                      hinText: 'URL',
                                      hintStyle: const TextStyle(
                                          fontSize: 20.0,
                                          color: Colors.redAccent
                                      ),
                                      icon: const Icon(
                                        Icons.image,
                                        color: Colors.redAccent,
                                      )
                                  ),
                                ),
                                const SizedBox(height: 10,),
                                Container(
                                  width: 300,
                                  decoration: const BoxDecoration(boxShadow: []),
                                  child: Textfield(
                                      controller: _priceController,

                                      textDirection: TextDirection.ltr,
                                      hinText: 'price',
                                      hintStyle: const TextStyle(
                                          fontSize: 20.0,
                                          color: Colors.redAccent
                                      ),
                                      icon: const Icon(
                                        Icons.monetization_on,
                                        color: Colors.redAccent,
                                      )
                                  ),
                                ),

                                SizedBox(
                                  width: 100,
                                  child: TextButton(
                                    style: TextButton.styleFrom(
                                        backgroundColor: Colors.green
                                    ),
                                    onPressed: (){


                                        setState(() {
                                          save();
                                      });


                                    },
                                    child: const Text('Save'),
                                  ),
                                )
                              ],
                            ),
                          )

                      ),
                    ),
                  )
              )
            ],
          )


      ),
    );
  }
}
