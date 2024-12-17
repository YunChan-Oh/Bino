import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'policy_detail_page.dart';

class SupportPage extends StatelessWidget {
  final List<Map<String, String>> supportPolicies = [
    {
      'title': '소상공인 긴급 경영 안정 자금',
      'description': '소상공인의 경영난을 해결하기 위한 긴급 자금 지원 프로그램입니다.',
      'image': 'assets/policy1.png'
    },
    {
      'title': '제로페이 이용 수수료 지원',
      'description': '제로페이 사용 시 발생하는 수수료를 정부에서 지원합니다.',
      'image': 'assets/policy2.png'
    },
    {
      'title': '소상공인 창업 지원 프로그램',
      'description': '창업 초기 소상공인을 위한 자금 및 교육 지원 프로그램입니다.',
      'image': 'assets/policy3.png'
    },
    {
      'title': '상권 활성화 지원 정책',
      'description': '지역 상권 활성화를 위한 다양한 지원 정책이 제공됩니다.',
      'image': 'assets/policy4.png'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('정부 지원 정책')),
      body: ListView.builder(
        itemCount: supportPolicies.length,
        itemBuilder: (context, index) {
          final policy = supportPolicies[index];
          return Card(
            child: ListTile(
              leading: Image.asset(
                policy['image']!, // 정책에 해당하는 이미지
                width: 40, // 아이콘 크기 조정
                height: 40,
                fit: BoxFit.cover, // 이미지를 카드에 맞게 조정
              ),
              title: Text(policy['title']!),
              trailing: FaIcon(FontAwesomeIcons.arrowRight), // 이동 표시 아이콘
              onTap: () {
                // 상세 페이지로 이동
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PolicyDetailPage(
                      title: policy['title']!,
                      description: policy['description']!,
                      imagePath: policy['image']!,
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
