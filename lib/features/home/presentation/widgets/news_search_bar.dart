import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_radius.dart';
import '../../../../core/theme/app_shadows.dart';

class NewsSearchBar extends StatelessWidget {
  const NewsSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppRadius.medium),
        boxShadow: AppShadows.card,
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: "Search news...",
          hintStyle: TextStyle(
            color: Colors.grey.shade500,
          ),
          prefixIcon: const Icon(
            Icons.search_rounded,
            color: AppColors.primary,
          ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 18)
        ),
      ),
    );
  }
}