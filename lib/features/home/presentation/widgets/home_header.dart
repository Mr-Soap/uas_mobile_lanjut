import 'package:flutter/material.dart';
import 'package:uas_mobile_lanjut/core/theme/app_shadows.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //good morning
                Text(
                  "Good Morning",
                  style: AppTextStyles.caption,
                ),

                const SizedBox(height: 4),
                //appname
                Text(
                  "DIGINEWS",
                  style: AppTextStyles.headline,
                ),

                const SizedBox(height: 6),
                //caption
                Text(
                  "Explore today's world news",
                  style: AppTextStyles.body,
                ),
              ],
            ),
          ),
          
          //button
          Container(
            height: 52,
            width: 52,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
              boxShadow: AppShadows.card,
            ),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.notifications_none_rounded,
                color: AppColors.primary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}