class Category {
  final String label;
  final String image;
  final String value;

  Category({
    required this.label,
    required this.image,
    required this.value,
  });

  static List<Category> categoryList = [
    Category(
      label: "Electronics",
      image: "assets/categorys/eletronic.png",
      value: "electronics",
    ),
    Category(
      label: "Jewelery",
      image: "assets/categorys/jewellery.jpg",
      value: "jewelery",
    ),
    Category(
      label: "Men’s Wear",
      image: "assets/categorys/mens_wear.jpg",
      value: "men's clothing",
    ),
    Category(
      label: "Women’s Wear",
      image: "assets/categorys/womans_wear.jpg",
      value: "women's clothing",
    ),
  ];
}
