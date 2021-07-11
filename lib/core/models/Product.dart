class Product {
  final int prodId;
  final String label;
  final int price;
  final String image;
  final int catId;

  Product(this.prodId, this.label, this.price, this.image, this.catId);

  Product.fromJson(Map<String, dynamic> json)
      : prodId = json['prodId'],
        label = json['label'],
        price = json['price'],
        image = json['image'],
        catId = json['catId'];

  Map<String, dynamic> toJson() => {
        'prodId': prodId,
        'label': label,
        'price': price,
        'image': image,
        'catId': catId
      };
}
