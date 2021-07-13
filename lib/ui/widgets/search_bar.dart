import 'package:flutter/material.dart';
import 'package:simplitil/constants/enums/device_screen_type.dart';
import 'package:simplitil/constants/simplitil_color.dart';
import 'package:simplitil/ui/screens/base_widget.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return BaseWidget(
      builder: (context, sizingInfo) => Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
        margin: EdgeInsets.symmetric(horizontal: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: sizingInfo.deviceType == DeviceScreenType.Mobile
                  ? sizingInfo.screenSize.width * .7
                  : sizingInfo.screenSize.width * .45,
              child: TextField(
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search_outlined),
                      hintText: "Rechercher un produit par son nom,code ",
                      border: InputBorder.none,
                      hintStyle: TextStyle(color: Colors.grey))),
            ),
            Icon(
              Icons.qr_code_scanner,
              size: 32.0,
              color: SimplitilColor.mainBlue,
            )
          ],
        ),
      ),
    );
  }
}
