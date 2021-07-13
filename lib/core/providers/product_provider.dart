import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:simplitil/constants/enums/ticket_state.dart';
import 'package:simplitil/core/models/Category.dart';
import 'package:simplitil/core/models/Product.dart';
import 'package:simplitil/core/models/ticket_item.dart';

class ProductProvider extends ChangeNotifier {
  Category _selctedCategory = Category(1, "", "", false);
  List<TicketItem> _ticketList = [];
  int _ticketTotalItem = 0;
  int _ticketTotalPrice = 0;
  TicketState _ticketState = TicketState.ENCOURS;

  List<Category> _categories = [];
  List<Product> _products = [];

  _loadJson() async {
    String data = await rootBundle.loadString('assets/data/init.json');
    var jsonResult = json.decode(data);

    for (var i = 0; i < jsonResult[0]['categories'].length; i++) {
      Category cat = Category.fromJson(jsonResult[0]['categories'][i]);

      _categories.add(cat);
    }
    print(jsonResult[0]['products']);
    for (var i = 0; i < jsonResult[0]['products'].length; i++) {
      Product p = Product.fromJson(jsonResult[0]['products'][i]);
      if (p.catId == _selctedCategory.catId) {
        _products.add(p);
      }
    }
  }

  _getProductByCat(Category cat) async {
    String data = await rootBundle.loadString('assets/data/init.json');
    var jsonResult = json.decode(data);
    _products = [];
    for (var i = 0; i < jsonResult[0]['products'].length; i++) {
      Product p = Product.fromJson(jsonResult[0]['products'][i]);
      if (p.catId == _selctedCategory.catId) {
        _products.add(p);
      }
    }
  }

  _init() {
    _selctedCategory = new Category(1, "Légumes", "", true);
    _ticketTotalItem = _ticketList.length;
    _ticketTotalPrice = getTotalPrice();
  }

  int getTotalPrice() {
    int total = 0;
    _ticketList.forEach((element) {
      total += element.total;
    });
    return total;
  }

  ProductProvider() {
    _init();
    _loadJson();
  }

  Category get selectedCategory => _selctedCategory;
  List<TicketItem> get ticketList => _ticketList;
  int get ticketTotalItem => _ticketTotalItem;
  TicketState get ticketState => _ticketState;
  List<Category> get categories => _categories;
  List<Product> get products => _products;
  int get ticketTotalPrice => _ticketTotalPrice;

  onTicketStateChange(TicketState state) {
    _ticketState = state;
    notifyListeners();
  }

  onAddToTicket(Product p) {
    bool exist = false;
    _ticketList.forEach((elt) {
      if (elt.product == p) {
        exist = true;
      }
    });

    if (!exist) {
      TicketItem t = new TicketItem((_ticketList.length + 1), p, 1, p.price);
      _ticketList.add(t);
    } else {
      _ticketList.forEach((element) {
        if (element.product == p) {
          element.count += 1;
          element.total = p.price * element.count;
        }
      });
    }
    _ticketTotalItem = _ticketList.length;
    _ticketTotalPrice = getTotalPrice();
    notifyListeners();
  }

  increaseTicketItem(TicketItem t) {
    ticketList.forEach((elt) {
      if (elt == t) {
        elt.count += 1;
        elt.total = elt.count * elt.product.price;
      }
    });
    _ticketTotalPrice = getTotalPrice();
    notifyListeners();
  }

  decreaseTicketItem(TicketItem t) {
    ticketList.forEach((elt) {
      if (elt == t) {
        elt.count -= 1;
        elt.total = elt.count * elt.product.price;
      }
    });
    _ticketTotalPrice = getTotalPrice();
    notifyListeners();
  }

  onRemoveFromTicket(Product p) {
    _ticketList.remove(p);
    _ticketTotalItem = _ticketList.length;
    notifyListeners();
  }

  onChangeSelectedCategory(Category cat) {
    _categories.forEach((elt) {
      elt.selected = false;
      if (elt == cat) {
        elt.selected = true;
      }
    });
    _selctedCategory = cat;
    _getProductByCat(_selctedCategory);
    notifyListeners();
  }
}
