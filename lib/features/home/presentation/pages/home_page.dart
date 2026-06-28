import 'package:flutter/material.dart';
import 'package:uas_mobile_lanjut/features/news/domain/usecases/get_top_headlines.dart';
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
            final usecase = sl<GetTopHeadlines>();
            final articles = await usecase();
            print(articles.first.title);
          },

          child: const Text("Test API"),

        ),

      ),

    );
  }
}