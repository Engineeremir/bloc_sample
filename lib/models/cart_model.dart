import 'package:bloc_sample/models/product_model.dart';

class CartModel {
  ProductModel? productModel;
  int? quantity;

  CartModel(this.productModel, this.quantity);
}
