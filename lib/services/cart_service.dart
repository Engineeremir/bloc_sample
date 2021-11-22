import 'package:bloc_sample/models/cart_model.dart';

class CartService {
  static List<CartModel> cartItems = [];

  static CartService singleton = CartService._internal();

  factory CartService() {
    return singleton;
  }

  CartService._internal();

  static void addToCart(CartModel cart) {
    cartItems.add(cart);
  }

  static void removeFromCart(CartModel cart) {
    cartItems.remove(cart);
  }

  static List<CartModel> getCart() {
    return cartItems;
  }
}
