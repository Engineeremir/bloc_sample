import 'package:bloc_sample/models/product_model.dart';

class ProductService {
  static List<ProductModel>? products = [];

  static ProductService singleton = ProductService._internal();

  factory ProductService() {
    return singleton;
  }
  ProductService._internal();
  
  static List<ProductModel>? getAll() {
    products!.add(ProductModel(1, "Laptop", 6000));
    products!.add(ProductModel(2, "Phone", 4000));
    products!.add(ProductModel(3, "Book", 50));

    return products;
  }
}
