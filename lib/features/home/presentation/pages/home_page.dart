import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uas_mobile_lanjut/features/news/presentation/bloc/news_state.dart';
import 'package:uas_mobile_lanjut/features/news/presentation/bloc/news_bloc.dart';

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
      body: BlocBuilder<NewsBloc, NewsState>(
        builder: (context, state) {
          if (state is NewsLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is NewsLoaded) {
            return ListView.builder(
              itemCount: state.articles.length,
              itemBuilder: (context, index) {
                final article = state.articles[index];

                return ListTile(
                  title: Text(article.title),
                  subtitle: Text(article.sourceName),
                );
              },
            );
          }

          if (state is NewsError) {
            return Center(
              child: Text(state.message),
            );
          }
          return const SizedBox();
        },
      )
    );
  }
}