import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../components/custom_card.dart';
import '../providers/sales_provider.dart';
import '../models/sales.dart';

class HomePage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sales = ref.watch(salesProvider);

    return Scaffold(
      appBar: AppBar(title: Text('삐노 - 홈')),
      body: Column(
        children: [
          CustomCard(
            title: '오늘의 매출',
            child: Text(
              '총 ${sales.fold(0.0, (double sum, sale) => sum + sale.amount)} 원',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: sales.length,
              itemBuilder: (context, index) {
                final sale = sales[index];
                return ListTile(
                  title: Text('${sale.amount} 원'),
                  subtitle: Text(sale.date),
                );
              },
            ),
          ),
          ElevatedButton(
            onPressed: () {
              ref.read(salesProvider.notifier).addSale(
                    Sale(amount: 50000, date: DateTime.now().toString()),
                  );
            },
            child: Text('매출 추가'),
          ),
        ],
      ),
    );
  }
}
