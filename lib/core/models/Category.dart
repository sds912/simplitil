class Category {
  int catId;
  String label;
  String image;
  bool selected = false;

  Category(this.catId, this.label, this.image, this.selected);

  Category.fromJson(Map<String, dynamic> json)
      : catId = json['catId'],
        label = json['label'],
        image = json['image'],
        selected = json['selected'];

  Map<String, dynamic> toJson() =>
      {'catId': catId, 'label': label, 'image': image, 'selected': selected};
}
