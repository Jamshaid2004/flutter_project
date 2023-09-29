class Item {
  final String itemName;
  final int quantity;
  final double price;

  const Item({
    required this.itemName,
    required this.quantity,
    required this.price,
  });

  double totalPrice() {
    return quantity * price;
  }
}
