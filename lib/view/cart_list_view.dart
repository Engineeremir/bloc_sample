// ignore_for_file: prefer_const_constructors, unused_local_variable

import 'package:bloc_sample/blocs/cart_bloc.dart';
import 'package:flutter/material.dart';

class CartListView extends StatelessWidget {
  const CartListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sepet"),
      ),
      body: StreamBuilder(
        initialData: cartBloc.getCart(),
        stream: cartBloc.getStream,
        builder: (context, AsyncSnapshot snapshot) {
          return buildCart(snapshot);
        },
      ),
    );
  }

  Widget buildCart(AsyncSnapshot snapshot) {
    return ListView.builder(
        itemCount: snapshot.data!.length,
        itemBuilder: (context, index) {
          final list = snapshot.data!;
          return ListTile(
            title: Text(list[index].productModel.productName),
            subtitle: Text(list[index].productModel.price.toString()),
            trailing: IconButton(
              icon: Icon(Icons.remove),
              onPressed: () {
                cartBloc.removeFromCart(list[index]);
              },
            ),
          );
        });
  }
}
