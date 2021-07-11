import 'package:flutter/material.dart';
import 'package:simplitil/constants/simplitil_color.dart';

class ProductTicketCard extends StatefulWidget {
  const ProductTicketCard();

  @override
  _ProductTicketCardState createState() => _ProductTicketCardState();
}

class _ProductTicketCardState extends State<ProductTicketCard> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
      margin: EdgeInsets.only(top: 5.0),
      decoration: BoxDecoration(color: Colors.white),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: w * .36,
            child: Row(
              children: [
                TextButton(
                    onPressed: () {},
                    child: Text(
                      "-",
                      style: TextStyle(
                          fontSize: 22.0, color: SimplitilColor.mainBlack),
                    )),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: Text(
                    "2",
                    style:
                        TextStyle(fontSize: 14.0, fontWeight: FontWeight.w800),
                  ),
                ),
                TextButton(
                    onPressed: () {},
                    child: Text("+",
                        style: TextStyle(
                            fontSize: 20.0, color: SimplitilColor.mainBlack)))
              ],
            ),
          ),
          Container(
              width: w * .38,
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Product name",
                    style:
                        TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "2500 FCFA",
                    style: TextStyle(
                        fontSize: 14.0, color: SimplitilColor.mainBlack),
                  )
                ],
              )),
          Container(
            width: w * .2,
            child: Text(
              "30000 FCFA",
              style: TextStyle(fontSize: 14.0, color: SimplitilColor.mainBlack),
            ),
          )
        ],
      ),
    );
  }
}
