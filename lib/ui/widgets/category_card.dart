import 'package:flutter/material.dart';
import 'package:simplitil/core/models/Category.dart';

class CategoryCard extends StatefulWidget {
  final Category cat;
  const CategoryCard(this.cat);

  @override
  _CategoryCardState createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.0),
      width: w * .25,
      height: 65.0,
      decoration: BoxDecoration(color: Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 60.0,
            height: 50.0,
            decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(10.0)),
            child: Image(
              fit: BoxFit.fill,
              image: AssetImage(widget.cat.image),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              widget.cat.label,
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
            ),
          )
        ],
      ),
    );
  }
}
