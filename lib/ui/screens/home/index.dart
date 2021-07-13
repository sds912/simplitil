import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:simplitil/constants/enums/device_screen_type.dart';
import 'package:simplitil/constants/enums/ticket_state.dart';
import 'package:simplitil/constants/simplitil_color.dart';
import 'package:simplitil/core/models/Product.dart';
import 'package:simplitil/core/providers/product_provider.dart';
import 'package:simplitil/ui/screens/base_widget.dart';
import 'package:simplitil/ui/screens/ticket/index.dart';
import 'package:simplitil/ui/widgets/categories_list.dart';
import 'package:simplitil/ui/widgets/product_card.dart';
import 'package:simplitil/ui/widgets/product_ticket_card.dart';
import 'package:simplitil/ui/widgets/search_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> _productList(List<Product> prods) {
    List<Widget> list = [];
    prods.forEach((Product p) {
      list.add(ProductCard(p));
    });
    return list;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    ProductProvider _prodProvider = Provider.of<ProductProvider>(context);
    return BaseWidget(
      builder: (context, sizingInformations) {
        return Scaffold(
          backgroundColor: SimplitilColor.mainGray,
          appBar: _appBar(80.0, _prodProvider.ticketTotalItem.toString()),
          body: sizingInformations.deviceType == DeviceScreenType.Mobile
              ? Column(
                  children: [
                    SearchBar(),
                    CategoriesList(_prodProvider.categories, 1),
                    Padding(padding: EdgeInsets.only(top: 20.0)),
                    Expanded(
                      child: ResponsiveGridList(
                        desiredItemWidth: 150,
                        minSpacing: 25,
                        children: _prodProvider.products.length > 0
                            ? _productList(_prodProvider.products)
                            : [],
                      ),
                    ),
                    Text(sizingInformations.deviceType.toString())
                  ],
                )
              : Container(
                  child: Row(
                  children: [
                    Container(
                      width: sizingInformations.screenSize.width * .10,
                      height: sizingInformations.screenSize.height,
                      child: Expanded(
                          child: CategoriesList(_prodProvider.categories, 2)),
                    ),
                    Container(
                      width: sizingInformations.screenSize.width * .60,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 10.0, bottom: 20.0),
                            child: SearchBar(),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 30.0, top: 10.0, bottom: 15.0),
                            child: Text(
                              _prodProvider.selectedCategory.label,
                              style: TextStyle(
                                  fontSize: 20.0, fontWeight: FontWeight.w600),
                            ),
                          ),
                          Expanded(
                            child: ResponsiveGridList(
                              desiredItemWidth: 150,
                              minSpacing: 25,
                              children: _prodProvider.products.length > 0
                                  ? _productList(_prodProvider.products)
                                  : [],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: sizingInformations.screenSize.width * .3,
                      height: sizingInformations.screenSize.height,
                      color: Colors.white,
                      child: Column(
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
                                        color: SimplitilColor.mainBlack
                                            .withOpacity(0.3)))),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    _prodProvider.onTicketStateChange(
                                        TicketState.ENCOURS);
                                  },
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: sizingInformations
                                                    .screenSize.width *
                                                .01),
                                        child: Text(
                                          "EN COURS",
                                          style: TextStyle(
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                      _prodProvider.ticketState ==
                                              TicketState.ENCOURS
                                          ? Container(
                                              margin:
                                                  EdgeInsets.only(top: 15.0),
                                              width: sizingInformations
                                                      .screenSize.width *
                                                  .10,
                                              height: 4.0,
                                              color: SimplitilColor.mainBlue,
                                            )
                                          : Container()
                                    ],
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    _prodProvider.onTicketStateChange(
                                        TicketState.ENATTENTE);
                                  },
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                            right: sizingInformations
                                                    .screenSize.width *
                                                .01),
                                        child: Text("EN ATTENTE",
                                            style: TextStyle(
                                                fontSize: 14.0,
                                                fontWeight: FontWeight.w600)),
                                      ),
                                      _prodProvider.ticketState ==
                                              TicketState.ENATTENTE
                                          ? Container(
                                              margin:
                                                  EdgeInsets.only(top: 15.0),
                                              width: sizingInformations
                                                      .screenSize.width *
                                                  .10,
                                              height: 4.0,
                                              color: SimplitilColor.mainBlue,
                                            )
                                          : Container()
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(padding: EdgeInsets.only(top: 20.0)),
                          Expanded(
                              child: ListView.builder(
                                  itemCount: _prodProvider.ticketList.length,
                                  itemBuilder: (context, index) =>
                                      ProductTicketCard(
                                          _prodProvider.ticketList[index]))),
                          Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 20.0, horizontal: 10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "TOTAL",
                                  style: TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w700,
                                      color: SimplitilColor.mainBlack),
                                ),
                                Text(
                                  "${_prodProvider.ticketTotalPrice} FCFA",
                                  style: TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w700),
                                )
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 20.0),
                            decoration: BoxDecoration(
                                border: Border(
                                    top: BorderSide(
                                        width: .5,
                                        color: SimplitilColor.mainBlack))),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "METTRE LE TICKET EN ATTENTE",
                                      style: TextStyle(
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            primary: SimplitilColor.mainRed,
                                            shape: CircleBorder()),
                                        onPressed: () {},
                                        child: Icon(Icons.play_arrow_rounded))
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 10.0),
                                      decoration: BoxDecoration(
                                          border: Border.symmetric(
                                              horizontal: BorderSide(
                                                  width: .5,
                                                  color: Colors.grey))),
                                      child: TextButton(
                                          onPressed: () {},
                                          style: TextButton.styleFrom(
                                              minimumSize: Size(
                                                  sizingInformations
                                                          .screenSize.width *
                                                      .23,
                                                  42.0)),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "ANNULER LE TICKET",
                                                style: TextStyle(
                                                    color:
                                                        SimplitilColor.mainRed,
                                                    fontSize: 20.0,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                              Icon(
                                                Icons.close,
                                                color: SimplitilColor.mainRed,
                                              )
                                            ],
                                          )),
                                    ),
                                    ElevatedButton(
                                        onPressed: () {},
                                        style: ElevatedButton.styleFrom(
                                            primary: SimplitilColor.mainBlue,
                                            minimumSize: Size(
                                                sizingInformations
                                                        .screenSize.width *
                                                    .25,
                                                60.0)),
                                        child: Text("PAYER"))
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                )),
        );
      },
    );
  }

  _appBar(double height, String total) => PreferredSize(
      preferredSize: Size(MediaQuery.of(context).size.width, height + 80),
      child: BaseWidget(
        builder: (context, sizingInfos) => Container(
          padding:
              EdgeInsets.only(top: 60.0, bottom: 20.0, left: 10.0, right: 10.0),
          color: SimplitilColor.darkBlue,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              sizingInfos.deviceType != DeviceScreenType.Mobile
                  ? Row(
                      children: [
                        Icon(
                          Icons.menu,
                          color: Colors.white,
                          size: 36.0,
                        ),
                        Container(
                          width: 60.0,
                          height: 36.0,
                          margin: EdgeInsets.only(
                              left: sizingInfos.screenSize.width * .08),
                          child:
                              Image(image: AssetImage("assets/icons/logo.jpg")),
                        ),
                      ],
                    )
                  : Container(
                      height: 0.0,
                    ),
              sizingInfos.deviceType == DeviceScreenType.Mobile
                  ? Icon(
                      Icons.menu,
                      color: Colors.white,
                      size: 36.0,
                    )
                  : Container(
                      height: 0.0,
                    ),
              sizingInfos.deviceType == DeviceScreenType.Mobile
                  ? Container(
                      width: 60.0,
                      height: 36.0,
                      child: Image(image: AssetImage("assets/icons/logo.jpg")),
                    )
                  : Container(
                      height: 0.0,
                    ),
              sizingInfos.deviceType == DeviceScreenType.Mobile
                  ? InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => TicketScreen()));
                      },
                      child: Container(
                        width: 40.0,
                        height: 43.0,
                        child: Stack(
                          children: [
                            Positioned(
                              bottom: 0.0,
                              child: Icon(
                                Icons.shopping_cart,
                                color: Colors.white,
                                size: 36.0,
                              ),
                            ),
                            Positioned(
                              top: 0.0,
                              right: 0.0,
                              child: Container(
                                alignment: Alignment.center,
                                width: 20.0,
                                height: 20.0,
                                decoration: BoxDecoration(
                                    color: SimplitilColor.mainRed,
                                    borderRadius: BorderRadius.circular(10.0)),
                                child: Text(
                                  total,
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  : Container(
                      child: Row(
                        children: [
                          Container(
                            width: 40.0,
                            height: 40.0,
                            margin: EdgeInsets.only(right: 20.0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                image: DecorationImage(
                                    image: NetworkImage(
                                        "https://randomuser.me/api/portraits/men/91.jpg"))),
                          ),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: SimplitilColor.mainRed),
                              onPressed: () {},
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 8.0),
                                    child: Icon(Icons.close),
                                  ),
                                  Text("Fermer la caisse")
                                ],
                              ))
                        ],
                      ),
                    ),
            ],
          ),
        ),
      ));
}
