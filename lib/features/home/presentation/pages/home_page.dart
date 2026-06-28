import 'package:flutter/material.dart';
import 'package:uas_mobile_lanjut/features/news/data/datasources/news_remote_datasources.dart';
import 'package:uas_mobile_lanjut/features/news/domain/repositories/news_repository.dart';
import '../../../../core/di/service_locator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("DigiNews"),
      ),

      body: Center(

        child: ElevatedButton(

          onPressed: () async {
            final repository = sl<NewsRepository>();
            final articles = await repository.getTopHeadlines();
            print(articles.first.title);
          },

          child: const Text("Test API"),

        ),

      ),

    );
  }
}