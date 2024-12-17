import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../core/database.dart';
import '../models/stock.dart';

final stockProvider = StateNotifierProvider<StockNotifier, List<Stock>>((ref) {
  return StockNotifier();
});

class StockNotifier extends StateNotifier<List<Stock>> {
  StockNotifier() : super([]) {
    loadStock();
  }

  // 재고 데이터 로드
  Future<void> loadStock() async {
    final db = await DatabaseHelper.initDatabase();
    final data = await db.query('stock');

    state = data.map((item) {
      return Stock(
        id: item['id'] as int?,
        name: item['name'] as String? ?? '',
        quantity: item['quantity'] as int? ?? 0,
      );
    }).toList();
  }

  // 재고 항목 추가
  Future<void> addStock(Stock stock) async {
    final db = await DatabaseHelper.initDatabase();
    await db.insert('stock', stock.toMap());
    loadStock();
  }

  // 재고 항목 삭제
  Future<void> deleteStock(int id) async {
    final db = await DatabaseHelper.initDatabase();
    await db.delete('stock', where: 'id = ?', whereArgs: [id]);
    loadStock();
  }

  // 재고 항목 업데이트
  Future<void> updateStock(Stock stock) async {
    final db = await DatabaseHelper.initDatabase();
    await db
        .update('stock', stock.toMap(), where: 'id = ?', whereArgs: [stock.id]);
    loadStock();
  }
}
