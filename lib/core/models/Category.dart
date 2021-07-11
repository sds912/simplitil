class Category {
  final int catId;
  final String label;
  final String image;

  Category(this.catId, this.label, this.image);

  Category.fromJson(Map<String, dynamic> json)
      : catId = json['catId'],
        label = json['label'],
        image = json['image'];

  Map<String, dynamic> toJson() =>
      {'catId': catId, 'label': label, 'image': image};
}
