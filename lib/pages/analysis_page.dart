import 'package:flutter/material.dart';

class AnalysisPage extends StatelessWidget {
  final List<Map<String, String>> analysisData = [
    {'location': 'A 상권', 'footTraffic': '500명/일'},
    {'location': 'B 상권', 'footTraffic': '300명/일'},
    {'location': 'C 상권', 'footTraffic': '100명/일'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('상권 분석')),
      body: ListView.builder(
        itemCount: analysisData.length,
        itemBuilder: (context, index) {
          final data = analysisData[index];
          return Card(
            child: ListTile(
              title: Text('${data['location']}'),
              subtitle: Text('유동인구: ${data['footTraffic']}'),
            ),
          );
        },
      ),
    );
  }
}
