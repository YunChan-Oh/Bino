class Stock {
  final int? id;
  final String name;
  final int quantity;

  Stock({this.id, required this.name, required this.quantity});

  Map<String, dynamic> toMap() {
    return {'id': id, 'name': name, 'quantity': quantity};
  }
}
