import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import '../../model/product.dart';
import '../CartItem.dart';
import 'components/product_carousel_slider.dart';

class ProductDetailsScreen extends StatefulWidget {
  final Product product;


  ProductDetailsScreen({Key? key, required this.product})
      : super(key: key);

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  NumberFormat formatter = NumberFormat('00');
  int _qty = 1;
  List<ShoppingCart> cartItems = [];



  Future carrito() async {
    const String url = "http://localhost:4410/api/carritos/";

    final Map<String, String> dataHeader = {
      'Content-Type': 'application/json; charset=UTF-8',
    };

    final Map<String, dynamic> dataBody = {
      "name": widget.product.name.toString(),
      "description": widget.product.description.toString(),
      "images": widget.product.images.toString(),
      "price": widget.product.price.toInt()

    };
    for(int i=1;i<=_qty;i++){
      await http.post(
        Uri.parse(url),
        headers: dataHeader,
        body: json.encode({'data': dataBody}),
      );
    }
    Navigator.pop(context);



  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child:SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(padding: EdgeInsets.all(10),
                child: Positioned(child: GestureDetector(
                  child: Icon(Icons.arrow_back_ios_new_rounded),
                  onTap: (){
                    Navigator.pop(context);
                  },
                ),
                  left: 3,),),
              Image.network(
                widget.product.images,
                loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                  if (loadingProgress == null)
                    return child;
                  return Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                          : null,
                    ),
                  );
                },
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  widget.product.name,
                  style: TextStyle(
                      fontSize: 24,
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w600),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  '\$${widget.product.price}',
                  style: TextStyle(
                      fontSize: 18,
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w400),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(width: 1),
                        borderRadius:
                        const BorderRadius.all(Radius.circular(8))),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            if (_qty > 1) {
                              setState(() {
                                _qty--;
                              });
                            }
                          },
                          child: Icon(
                            Icons.keyboard_arrow_left_sharp,
                            size: 32,
                            color: Colors.grey.shade800,
                          ),
                        ),
                        Text(
                          formatter.format(_qty),
                          style: TextStyle(
                              fontSize: 18, color: Colors.grey.shade800),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              _qty++;
                              if (_qty > 10) {
                                _qty = 10;
                              }
                            });
                          },
                          child: Icon(
                            Icons.keyboard_arrow_right_sharp,
                            size: 32,
                            color: Colors.grey.shade800,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),


              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  'Acerca del producto:',
                  style: TextStyle(
                      fontSize: 16,
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w500),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  widget.product.description,
                  style: TextStyle(fontSize: 16, color: Colors.grey.shade700),
                ),
              )
            ],
          ),
        ),
      ),

      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(8.0),
        child: TextButton(
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
            backgroundColor:
            MaterialStateProperty.all<Color>(Theme.of(context).primaryColor),
          ),
          onPressed: () {
            setState(() {

                carrito();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Se agregó "${widget.product.name}" al carrito'),
                  duration: Duration(seconds: 2),
                ),
              );
            });
          },
          child: const Padding(
            padding: EdgeInsets.all(6.0),
            child: Text(
              'Agregar al carrito',
              style: TextStyle(fontSize: 16),
            ),
          ),
        ),
      ),
    );
  }
}