import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../core/database.dart';
import '../models/sales.dart';

final salesProvider = StateNotifierProvider<SalesNotifier, List<Sale>>((ref) {
  return SalesNotifier();
});

class SalesNotifier extends StateNotifier<List<Sale>> {
  SalesNotifier() : super([]) {
    loadSales();
  }

  Future<void> loadSales() async {
    final db = await DatabaseHelper.initDatabase();
    final data = await db.query('sales');

    // 명시적으로 타입 변환 후 Sale 객체로 변환
    state = data.map((item) {
      return Sale(
        id: item['id'] as int?, // id는 nullable int
        amount: (item['amount'] as num?)?.toDouble() ??
            0.0, // amount는 num -> double 변환
        date: item['date'] as String? ?? '', // date는 nullable String 처리
      );
    }).toList();
  }

  Future<void> addSale(Sale sale) async {
    final db = await DatabaseHelper.initDatabase();
    await db.insert('sales', sale.toMap());
    loadSales();
  }
}
