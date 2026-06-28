import 'package:flutter/material.dart';
import 'package:uas_mobile_lanjut/features/news/data/datasources/news_remote_datasources.dart';
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
            final datasource = sl<NewsRemoteDataSource>();
            final result = await datasource.getTopHeadlines();
            print(result.totalArticles);
            print(result.articles.first.title);
          },

          child: const Text("Test API"),

        ),

      ),

    );
  }
}