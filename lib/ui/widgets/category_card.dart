import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simplitil/constants/enums/device_screen_type.dart';
import 'package:simplitil/constants/simplitil_color.dart';
import 'package:simplitil/core/models/Category.dart';
import 'package:simplitil/core/providers/product_provider.dart';
import 'package:simplitil/ui/screens/base_widget.dart';

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
    ProductProvider _prodProvider = Provider.of<ProductProvider>(context);

    return BaseWidget(
      builder: (context, sizingInfo) => Container(
        margin: EdgeInsets.symmetric(horizontal: 10.0),
        width: w * .25,
        height: sizingInfo.deviceType == DeviceScreenType.Mobile ? 65.0 : 120.0,
        decoration: BoxDecoration(color: Colors.white),
        child: InkWell(
          onTap: () {
            _prodProvider.onChangeSelectedCategory(widget.cat);
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              !widget.cat.selected
                  ? Container(
                      width: 60.0,
                      height: 50.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0)),
                      child: Image(
                        fit: BoxFit.fill,
                        image: AssetImage(widget.cat.image),
                      ),
                    )
                  : Container(
                      alignment: Alignment.center,
                      width: 60.0,
                      height: 50.0,
                      decoration: BoxDecoration(color: SimplitilColor.mainRed),
                      child: Text(
                        widget.cat.label.substring(0, 1).toUpperCase(),
                        style: TextStyle(
                            fontSize: 26.0,
                            color: Colors.white,
                            fontWeight: FontWeight.w800),
                      ),
                    ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  widget.cat.label,
                  style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w600),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
