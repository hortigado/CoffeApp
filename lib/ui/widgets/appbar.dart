import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({
    Key key,
    @required this.width,
  }) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      child: Container(
        width: width,
        child: AppBar(
          leading: Icon(Icons.arrow_back),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: width * .04),
              child: Icon(Icons.shopping_cart_outlined),
            )
          ],
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          iconTheme: IconThemeData(color: Colors.black),
        ),
      ),
    );
  }
}
