class Sale {
  final int? id;
  final double amount;
  final String date;

  Sale({this.id, required this.amount, required this.date});

  Map<String, dynamic> toMap() {
    return {'id': id, 'amount': amount, 'date': date};
  }
}
