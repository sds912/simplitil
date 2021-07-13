import 'package:flutter/material.dart';
import 'package:simplitil/core/models/Category.dart';
import 'package:simplitil/ui/widgets/category_card.dart';

class CategoriesList extends StatefulWidget {
  final List<Category> categories;
  final int orientation;
  const CategoriesList(this.categories, this.orientation);

  @override
  _CategoriesListState createState() => _CategoriesListState();
}

class _CategoriesListState extends State<CategoriesList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.orientation == 1
          ? EdgeInsets.only(top: 20.0)
          : EdgeInsets.only(top: 0.0),
      padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 0.0),
      height: 110.0,
      decoration: BoxDecoration(color: Colors.white),
      child: ListView.builder(
          scrollDirection:
              widget.orientation == 1 ? Axis.horizontal : Axis.vertical,
          itemCount: widget.categories.length + 1,
          itemBuilder: (context, index) {
            if (index == widget.categories.length) {
              return ElevatedButton(
                onPressed: () {},
                child: Text(
                  "+",
                  style: TextStyle(color: Colors.white, fontSize: 32.0),
                ),
                style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    // padding: EdgeInsets.all(12),
                    minimumSize: Size(30.0, 30.0),
                    primary: Colors.blue // <-- Splash color
                    ),
              );
            } else {
              return CategoryCard(widget.categories[index]);
            }
          }),
    );
  }
}
