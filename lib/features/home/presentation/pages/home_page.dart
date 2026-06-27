import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import '../../../../core/di/service_locator.dart';
import '../../../../core/network/api_endpoint.dart';

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
            final dio = sl<Dio>();
            try {
              final response = await dio.get(
                ApiEndpoints.topHeadlines,
                queryParameters: {
                  'lang': 'en',
                  'max': 10,
                },
              );
              print("===== SUCCESS =====");
              print(response.statusCode);
              print(response.data);
            } on DioException catch (e) {
              print("===== ERROR =====");
              print(e.response?.statusCode);
              print(e.response?.data);
              print(e.message);
            } catch (e) {
              print(e);
            }
          },

          child: const Text("Test API"),

        ),

      ),

    );
  }
}