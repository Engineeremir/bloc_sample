import 'dart:async';

import 'package:bloc_sample/models/product_model.dart';
import 'package:bloc_sample/services/product_service.dart';

class ProductBloc {
  final productStreamController = StreamController.broadcast();

  Stream get getStream => productStreamController.stream;

  List<ProductModel>? getAll() {
    return ProductService.getAll();
  }
}

final productBloc = ProductBloc();
