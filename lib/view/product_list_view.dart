// ignore_for_file: prefer_const_constructors

import 'package:bloc_sample/blocs/cart_bloc.dart';
import 'package:bloc_sample/blocs/product_bloc.dart';
import 'package:bloc_sample/models/cart_model.dart';
import 'package:flutter/material.dart';

class ProductListView extends StatelessWidget {
  const ProductListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Alışveriş"),
        actions: [
          IconButton(
              onPressed: () => Navigator.pushNamed(context, "/cart"),
              icon: Icon(Icons.shopping_basket))
        ],
      ),
      body: buildProductList(),
    );
  }

  buildProductList() {
    return StreamBuilder(
      initialData: productBloc.getAll(),
      stream: productBloc.getStream,
      builder: (context, AsyncSnapshot snapshot) {
        return snapshot.data!.length > 0
            ? buildProductListItems(snapshot)
            : Center(
                child: CircularProgressIndicator(),
              );
      },
    );
  }

  buildProductListItems(AsyncSnapshot snapshot) {
    return ListView.builder(
        itemCount: snapshot.data!.length,
        itemBuilder: (context, index) {
          final list = snapshot.data!;
          return ListTile(
            title: Text(list[index].productName),
            subtitle: Text(list[index].price.toString()),
            trailing: IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                cartBloc.addToCart(CartModel(list[index], 1));
                print(list[index].productName);
              },
            ),
          );
        });
  }
}
