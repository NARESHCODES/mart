import "package:flutter/material.dart";

class CartView extends StatelessWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: const Text("Cart"),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: const [
                  ListTile(
                    title: Text("cart"),
                  )
                ],
              ),
            )));
  }
}
