import 'package:flutter/material.dart';
import 'package:uas_mobile_lanjut/features/news/domain/entities/article.dart';

class DetailNewsPage extends StatelessWidget {
  final Article article;
  const DetailNewsPage({
    super.key,
    required this.article,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Menu Details"),
      ),
    );
  }
}