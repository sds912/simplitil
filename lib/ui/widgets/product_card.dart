import 'package:flutter/material.dart';
import 'package:simplitil/constants/simplitil_color.dart';
import 'package:simplitil/core/models/Product.dart';

class ProductCard extends StatefulWidget {
  final Product product;
  const ProductCard(this.product);

  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: .5,
            blurRadius: 2,
            offset: Offset(0, 1), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            height: 100.0,
            width: double.infinity,
            child: Image(
              fit: BoxFit.fill,
              image: AssetImage(widget.product.image),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              widget.product.label,
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 10.0),
            child: Text(
              "${widget.product.price.toString()} FCFA",
              style: TextStyle(color: SimplitilColor.mainBlack, fontSize: 16.0),
            ),
          )
        ],
      ),
    );
  }
}
