import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:simplitil/constants/simplitil_color.dart';
import 'package:simplitil/ui/widgets/product_ticket_card.dart';

class TicketScreen extends StatefulWidget {
  const TicketScreen({Key? key}) : super(key: key);

  @override
  _TicketScreenState createState() => _TicketScreenState();
}

class _TicketScreenState extends State<TicketScreen> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return Scaffold(
        backgroundColor: SimplitilColor.mainGray,
        appBar: PreferredSize(
          preferredSize: Size(double.infinity, 150.0),
          child: Container(
            height: 110.0,
            padding: EdgeInsets.only(top: 60.0, left: 10.0, bottom: 15.0),
            color: SimplitilColor.darkBlue,
            child: Row(
              children: [
                Container(
                  width: w * .05,
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context, rootNavigator: true).pop();
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 26.0,
                    ),
                  ),
                ),
                Container(
                  width: w * .9,
                  alignment: Alignment.center,
                  child: Image(
                    image: AssetImage("assets/icons/logo.jpg"),
                  ),
                )
              ],
            ),
          ),
        ),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 20.0, bottom: 30.0),
              child: Text(
                "TICKET",
                style: TextStyle(
                    color: SimplitilColor.mainBlue,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w800),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                          width: 1.0,
                          color: SimplitilColor.mainBlack.withOpacity(0.3)))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        "EN COURS",
                        style: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.w600),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 15.0),
                        width: w * .35,
                        height: 4.0,
                        color: SimplitilColor.mainBlue,
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Text("EN COURS",
                          style: TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.w600)),
                      Container(
                        margin: EdgeInsets.only(top: 15.0),
                        width: w * .35,
                        height: 4.0,
                        color: SimplitilColor.mainBlue,
                      )
                    ],
                  )
                ],
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 20.0)),
            Expanded(
                child: ListView.builder(
                    itemCount: 5,
                    itemBuilder: (context, index) => ProductTicketCard())),
            Container(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "TOTAL",
                    style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w700,
                        color: SimplitilColor.mainBlack),
                  ),
                  Text(
                    "75000 FCFA",
                    style:
                        TextStyle(fontSize: 16.0, fontWeight: FontWeight.w700),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              decoration: BoxDecoration(
                  border: Border(
                      top: BorderSide(
                          width: .5, color: SimplitilColor.mainBlack))),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "METTRE LE TICKET EN ATTENTE",
                        style: TextStyle(
                            fontSize: 14.0, fontWeight: FontWeight.w600),
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: SimplitilColor.mainRed,
                              shape: CircleBorder()),
                          onPressed: () {},
                          child: Icon(Icons.play_arrow_rounded))
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10.0),
                    padding:
                        EdgeInsets.symmetric(horizontal: 40.0, vertical: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                primary: SimplitilColor.mainRed,
                                minimumSize: Size(120.0, 42.0)),
                            child: Text("ANNULER")),
                        ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                primary: SimplitilColor.mainBlue,
                                minimumSize: Size(120.0, 42.0)),
                            child: Text("PAYER"))
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
