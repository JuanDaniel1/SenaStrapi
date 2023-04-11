import 'dart:convert';

import 'package:hive/hive.dart';

import 'tag.dart';

part 'product.g.dart';

List<Product> popularProductListFromJson(String val) =>
    List<Product>.from(json.decode(val)['data']
        .map((val) => Product.popularProductFromJson(val))
    );

List<Product> productListFromJson(String val) =>
    List<Product>.from(json.decode(val)['data']
        .map((val) => Product.productFromJson(val))
    );

@HiveType(typeId: 3)
class Product {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String description;
  @HiveField(3)
  final String images;
  @HiveField(4)
  final double price;



  

  Product(
      {required this.id,
        required this.name,
        required this.description,
        required this.images,
        required this.price,
        });

  factory Product.popularProductFromJson(Map<String, dynamic> data) => Product(
      id: data['id'],
      name: data['attributes']['product']['data']['attributes']['name'],
      description: data['attributes']['product']['data']['attributes']
      ['description'],
      images: data['attributes']['product']['data']['attributes']
      ['images'],
      price: data['attributes']['product']['data']['attributes']
      ['price'],
    
  );

  factory Product.productFromJson(Map<String, dynamic> data) => Product(
      id: data['id'],
      name: data['attributes']['name'],
      description: data['attributes']['description'],
      images: data['attributes']['images'],
      price: data['attributes']['price'],
  );
  factory Product.carrito(Map<String, dynamic> data) => Product(
    id: data['id'],
    name: data['attributes']['name'],
    description: data['attributes']['description'],
    images: data['attributes']['images'],
    price: data['attributes']['price'],

  );

}