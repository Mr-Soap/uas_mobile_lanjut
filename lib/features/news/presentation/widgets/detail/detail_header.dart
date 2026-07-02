import 'package:flutter/material.dart';
import '../../../domain/entities/article.dart';

class DetailHeader extends StatelessWidget {
  final Article article;
  const DetailHeader({
    super.key,
    required this.article,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      width: double.infinity,
      child:Stack(
        children:[
          //image
          Hero(
            tag: article.url,
            child: SizedBox.expand(
              child: Image.network(
                article.image,
                fit: BoxFit.cover,
              ),
            ),
          ),

          //overlay
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black.withAlpha(80),
                  ],
                ),
              ),
            ),
          ),

          //button
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: CircleAvatar(
                backgroundColor: Colors.black26,
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ]
      ),
    );
  }
}