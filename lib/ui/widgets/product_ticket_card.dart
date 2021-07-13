import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simplitil/constants/enums/device_screen_type.dart';
import 'package:simplitil/constants/simplitil_color.dart';
import 'package:simplitil/core/models/ticket_item.dart';
import 'package:simplitil/core/providers/product_provider.dart';
import 'package:simplitil/ui/screens/base_widget.dart';

class ProductTicketCard extends StatefulWidget {
  final TicketItem _ticketItem;
  const ProductTicketCard(this._ticketItem);

  @override
  _ProductTicketCardState createState() => _ProductTicketCardState();
}

class _ProductTicketCardState extends State<ProductTicketCard> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    ProductProvider _prodProvider = Provider.of<ProductProvider>(context);

    return BaseWidget(
      builder: (context, sizingInfo) => Container(
        padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 8.0),
        margin: EdgeInsets.only(top: 5.0),
        decoration: BoxDecoration(color: Colors.white),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: sizingInfo.deviceType != DeviceScreenType.Mobile
                  ? sizingInfo.screenSize.width * .14
                  : sizingInfo.screenSize.width * .38,
              child: Row(
                children: [
                  TextButton(
                      onPressed: () {
                        _prodProvider.decreaseTicketItem(widget._ticketItem);
                      },
                      child: Text(
                        "-",
                        style: TextStyle(
                            fontSize:
                                sizingInfo.deviceType == DeviceScreenType.Mobile
                                    ? 22.0
                                    : 14.0,
                            color: SimplitilColor.mainBlack),
                      )),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: Text(
                      widget._ticketItem.count.toString(),
                      style: TextStyle(
                          fontSize:
                              sizingInfo.deviceType == DeviceScreenType.Mobile
                                  ? 14.0
                                  : 12.0,
                          fontWeight: FontWeight.w800),
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        _prodProvider.increaseTicketItem(widget._ticketItem);
                      },
                      child: Text("+",
                          style: TextStyle(
                              fontSize: sizingInfo.deviceType ==
                                      DeviceScreenType.Mobile
                                  ? 20.0
                                  : 12.0,
                              color: SimplitilColor.mainBlack)))
                ],
              ),
            ),
            Container(
                width: sizingInfo.deviceType != DeviceScreenType.Mobile
                    ? sizingInfo.screenSize.width * .10
                    : sizingInfo.screenSize.width * .4,
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget._ticketItem.product.label,
                      style: TextStyle(
                          fontSize:
                              sizingInfo.deviceType == DeviceScreenType.Mobile
                                  ? 16.0
                                  : 12.0,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "${widget._ticketItem.product.price} FCFA",
                      style: TextStyle(
                          fontSize:
                              sizingInfo.deviceType == DeviceScreenType.Mobile
                                  ? 14.0
                                  : 12.0,
                          color: SimplitilColor.mainBlack),
                    )
                  ],
                )),
            Container(
              width: sizingInfo.deviceType != DeviceScreenType.Mobile
                  ? sizingInfo.screenSize.width * .05
                  : sizingInfo.screenSize.width * .17,
              child: Text(
                "${widget._ticketItem.total} FCFA",
                style: TextStyle(
                    fontSize: sizingInfo.deviceType == DeviceScreenType.Mobile
                        ? 14.0
                        : 12.0,
                    color: SimplitilColor.mainBlack),
              ),
            )
          ],
        ),
      ),
    );
  }
}
