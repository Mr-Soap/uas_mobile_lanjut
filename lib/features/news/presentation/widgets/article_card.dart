import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:uas_mobile_lanjut/core/routing/route_names.dart';
import 'package:uas_mobile_lanjut/core/theme/app_colors.dart';
import 'package:uas_mobile_lanjut/core/theme/app_radius.dart';
import 'package:uas_mobile_lanjut/core/theme/app_shadows.dart';
import 'package:uas_mobile_lanjut/core/theme/app_text_styles.dart';
import '../../domain/entities/article.dart';

class ArticleCard extends StatefulWidget {
  final Article article;

  const ArticleCard({
    super.key,
    required this.article,
  });

  @override
  State<ArticleCard> createState() => _ArticleCardState();
}

class _ArticleCardState extends State<ArticleCard> {
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: TweenAnimationBuilder<double>(
        tween: Tween(
          begin: 1,
          end: _pressed ? 0.97 : 1,
        ),
        duration: const Duration(milliseconds: 150),
        builder: (context, scale, child) {
          return Transform.scale(
            scale: scale,
            child: child,
          );
        },
        child: Material(
          color: Colors.white,
          borderRadius: BorderRadius.circular(AppRadius.large),
          clipBehavior: Clip.antiAlias,
          elevation: 0,
          child: InkWell(
            borderRadius: BorderRadius.circular(AppRadius.large),
            onTapDown: (_) {
              setState(() {
                _pressed = true;
              });
            },
            onTapUp: (_) {
              setState(() {
                _pressed = false;
              });
            },
            onTapCancel: () {
              setState(() {
                _pressed = false;
              });
            },
            onTap: () {
              context.push(
                RouteNames.detailNews,
                extra: widget.article,
              );
            },
            child: Ink(
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFFFFFFFF),
                    Color(0xFFF8FFFF),
                    Color(0xFFEAFBF6),
                  ],
                ),
                border: Border.all(
                  color: Colors.white70,
                  width: 1.5,
                ),
                borderRadius: BorderRadius.circular(AppRadius.large),
                boxShadow: AppShadows.card,
              ),
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    top: 0,
                    bottom: 0,
                    child: Container(
                      width: 4,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            AppColors.primary,
                            AppColors.secondary,
                            AppColors.accent,
                          ],
                        ),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(AppRadius.large),
                          bottomLeft: Radius.circular(AppRadius.large),
                        ),
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 6),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        //image
                        ClipRRect(
                          borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(AppRadius.large),
                          ),
                    
                          child: Stack(
                            children: [
                              widget.article.image.isNotEmpty
                                ?  Image.network(
                                    widget.article.image,
                                    height: 220,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                    errorBuilder: (_, __, ___) => _buildPlaceholder(),
                                  )
                                : _buildPlaceholder(),
                              
                              Positioned.fill(
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        Colors.transparent,
                                        Colors.black.withAlpha(31),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                    
                        //judul berita + source
                        Padding(
                          padding: const EdgeInsets.all(18),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              //live chip
                              _buildSourceChip(widget.article),
                            
                              const SizedBox(height: 12),
                            
                              //judul berita
                              Text(
                                widget.article.title,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: AppTextStyles.title,
                              ),
                    
                              const SizedBox(height: 12),
                    
                              //deskripsi
                              Text(
                                widget.article.description,
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style: AppTextStyles.body,
                              ),
                    
                              const SizedBox(height: 18),
                    
                              //source
                              Row(
                                children: [
                                  Icon(
                                    Icons.schedule,
                                    size: 16,
                                    color: AppColors.primary,
                                  ),
                    
                                  SizedBox(width: 6),
                    
                                  Expanded(
                                    child: Text(
                                      widget.article.publishedAt.toString(),
                                      style: AppTextStyles.caption,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget _buildPlaceholder() {
  return Container(
    height: 200,
    color: AppColors.lightMint,
    child: const Center(
      child: Icon(
        Icons.image_outlined,
        size: 60,
      ),
    ),
  );
}

Widget _buildSourceChip(Article article) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
    decoration: BoxDecoration(
      gradient: const LinearGradient(
        colors: [
          AppColors.secondary,
          AppColors.accent,
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
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    ),
  );
}