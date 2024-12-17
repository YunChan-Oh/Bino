import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../providers/stock_provider.dart';
import '../models/stock.dart';

class StockPage extends ConsumerWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stockList = ref.watch(stockProvider);

    return Scaffold(
      appBar: AppBar(title: Text('재고 관리')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(labelText: '재고 이름'),
                ),
                TextField(
                  controller: quantityController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(labelText: '수량'),
                ),
                ElevatedButton(
                  onPressed: () {
                    final name = nameController.text;
                    final quantity = int.tryParse(quantityController.text) ?? 0;
                    if (name.isNotEmpty && quantity > 0) {
                      ref.read(stockProvider.notifier).addStock(
                            Stock(name: name, quantity: quantity),
                          );
                      nameController.clear();
                      quantityController.clear();
                    }
                  },
                  child: Text('재고 추가'),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: stockList.length,
              itemBuilder: (context, index) {
                final stock = stockList[index];
                return ListTile(
                  leading: Icon(Icons.inventory), // 재고 아이콘 추가
                  title: Text(stock.name),
                  subtitle: Text('수량: ${stock.quantity}'),
                  trailing: IconButton(
                    icon: FaIcon(FontAwesomeIcons.remove,
                        color: Colors.red, size: 28), // 명확한 삭제 아이콘
                    onPressed: () {
                      ref.read(stockProvider.notifier).deleteStock(stock.id!);
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
