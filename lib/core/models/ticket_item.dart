import 'package:simplitil/core/models/Product.dart';

class TicketItem {
  final int ticketId;
  final Product product;
  int count;
  int total;

  TicketItem(this.ticketId, this.product, this.count, this.total);

  TicketItem.fromJson(Map<String, dynamic> json)
      : ticketId = json['ticketId'],
        product = json['product'],
        count = json['count'],
        total = json['total'];

  Map<String, dynamic> toJson() => {
        'ticketId': ticketId,
        'product': product,
        'count': count,
        'total': total
      };
}
