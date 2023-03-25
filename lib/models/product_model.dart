class ProductModel {
  String imageCard, imageDetail, name, description;
  double price, rate;
  Special special;
  ProductModel(
      {required this.imageCard,
      required this.imageDetail,
      required this.name,
      required this.price,
      required this.rate,
      required this.description,
      required this.special});
}

class Special {
  final String name, image;

  Special({required this.name, required this.image});
}

List<ProductModel> products = [
  ProductModel(
      imageCard: 'burger/beef burger.png',
      imageDetail: 'burger/beef burger_.png',
      name: 'Beef Burger',
      price: 6.59,
      rate: 4.8,
      special: Special(name: 'Cheesy Mozarella', image: 'cheese.png'),
      description: desc),
  ProductModel(
      imageCard: 'burger/double burger.png',
      imageDetail: 'burger/double burger_.png',
      name: ' Double Burger',
      price: 7.49,
      rate: 4.8,
      special: Special(name: 'Double Beef', image: 'beef.png'),
      description: desc)
];
var desc =
    "This burger are often served with cheese, lettuce, tomato, onion, pickles, bacon, or chilis; condiments such as ketchup, mustard, mayonnaise, relish, or a 'special sauce', often a variation of Thousand Island dressing; and are frequently placed on sesame seed buns. ";
