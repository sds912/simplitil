import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:simplitil/constants/simplitil_color.dart';
import 'package:simplitil/core/models/Category.dart';
import 'package:simplitil/core/models/Product.dart';
import 'package:simplitil/ui/screens/ticket/index.dart';
import 'package:simplitil/ui/widgets/category_card.dart';
import 'package:simplitil/ui/widgets/product_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Category> categories = [];
  List<Product> products = [];

  loadJson() async {
    String data = await rootBundle.loadString('assets/data/init.json');
    var jsonResult = json.decode(data);

    for (var i = 0; i < jsonResult[0]['categories'].length; i++) {
      categories.add(Category.fromJson(jsonResult[0]['categories'][i]));
    }
    print(jsonResult[0]['products']);
    for (var i = 0; i < jsonResult[0]['products'].length; i++) {
      products.add(Product.fromJson(jsonResult[0]['products'][i]));
    }

    print(jsonResult);
    print(products);
  }

  List<Widget> _productList(List<Product> prods) {
    List<Widget> list = [];
    prods.forEach((Product p) {
      list.add(ProductCard(p));
    });
    return list;
  }

  @override
  void initState() {
    loadJson();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: SimplitilColor.mainGray,
      appBar: _appBar(80.0),
      body: Column(
        children: [
          Container(
            color: Colors.white,
            padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: screenSize.width * .75,
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
          Container(
            margin: EdgeInsets.only(top: 20.0),
            padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 0.0),
            height: 110.0,
            decoration: BoxDecoration(color: Colors.white),
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length + 1,
                itemBuilder: (context, index) {
                  if (index == categories.length) {
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
                    return CategoryCard(categories[index]);
                  }
                }),
          ),
          Padding(padding: EdgeInsets.only(top: 20.0)),
          Expanded(
            child: ResponsiveGridList(
              desiredItemWidth: 150,
              minSpacing: 25,
              children: products.length > 0 ? _productList(products) : [],
            ),
          )
        ],
      ),
    );
  }

  _appBar(height) => PreferredSize(
      preferredSize: Size(MediaQuery.of(context).size.width, height + 80),
      child: Container(
        padding:
            EdgeInsets.only(top: 60.0, bottom: 20.0, left: 10.0, right: 10.0),
        color: SimplitilColor.darkBlue,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.menu,
              color: Colors.white,
              size: 36.0,
            ),
            Container(
              width: 60.0,
              height: 36.0,
              child: Image(image: AssetImage("assets/icons/logo.jpg")),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => TicketScreen()));
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
                          "2",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ));
}
