import 'package:flutter/material.dart';
import 'package:uas_mobile_lanjut/features/news/domain/entities/article.dart';
import 'package:uas_mobile_lanjut/features/news/presentation/widgets/detail/detail_header.dart';
import 'package:uas_mobile_lanjut/features/news/presentation/widgets/detail/detail_info.dart';

class DetailNewsPage extends StatelessWidget {
  final Article article;
  const DetailNewsPage({
    super.key,
    required this.article,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DetailHeader(article: article),
            DetailInfo(article: article),
          ],
        ),
      ),
    );
  }
}