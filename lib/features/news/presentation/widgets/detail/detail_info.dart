import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../domain/entities/article.dart';


class DetailInfo extends StatelessWidget {
  final Article article;
  const DetailInfo({
    super.key,
    required this.article,
  });

  @override
  Widget build(BuildContext context) {
    final formattedDate = DateFormat('dd MMM yyyy').format(article.publishedAt);

    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //source dan tanggal
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      AppColors.secondary,
                      AppColors.accent
                    ],
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),

                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.public,
                      size: 14,
                      color: Colors.white,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      article.sourceName,
                      style: AppTextStyles.caption.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w600
                      ),
                    ),
                  ],
                ),
              ),

              const Spacer(),

              const Icon(
                Icons.schedule,
                size: 16,
                color: AppColors.primary,
              ),

              const SizedBox(width: 6),

              Text(
                formattedDate,
                style: AppTextStyles.caption,
              )
            ],
          ),
          const SizedBox(height: 24),

          //judul
          Text(
            article.title,
            style: AppTextStyles.headline,
          ),
          const SizedBox(height: 16),

          //deskripsi
          Text(
            article.description,
            style: AppTextStyles.body,
          ),
          const SizedBox(height: 20),

          //konten
          Text(
            article.content,
            style: AppTextStyles.body.copyWith(height: 1.7),
          ),
        ],
      ),
    );
  }
}