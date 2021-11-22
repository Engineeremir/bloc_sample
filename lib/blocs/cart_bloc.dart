import 'dart:async';

import 'package:bloc_sample/models/cart_model.dart';
import 'package:bloc_sample/services/cart_service.dart';

class CartBloc {
  final cartStreamController = StreamController.broadcast();

  Stream get getStream => cartStreamController.stream;

  void addToCart(CartModel item) {
    CartService.addToCart(item);
    cartStreamController.sink.add(CartService.getCart());
  }

  void removeFromCart(CartModel item) {
    CartService.removeFromCart(item);
    cartStreamController.sink.add(CartService.getCart());
  }

  List<CartModel> getCart() {
    return CartService.getCart();
  }
}

final cartBloc = CartBloc();
