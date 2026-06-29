import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uas_mobile_lanjut/features/home/presentation/widgets/home_header.dart';
import 'package:uas_mobile_lanjut/features/home/presentation/widgets/news_search_bar.dart';
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
      body: SafeArea(
        child: Column(
          children: [
            const HomeHeader(),
            
            const SizedBox(height: 10),

            const NewsSearchBar(),

            const SizedBox(height: 20),

            Expanded(
              child: BlocBuilder<NewsBloc, NewsState>(
                builder: (context, state) {
                  //state loading
                  if (state is NewsLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  //state loaded
                  if (state is NewsLoaded) {
                    return ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      itemCount: state.articles.length,
                      itemBuilder: (context, index) {
                        return Text(
                          state.articles[index].title,
                        );
                      },
                    );
                  }

                  //state error
                  if (state is NewsError) {
                    return Center(
                      child: Text(state.message),
                    );
                  }

                  return const SizedBox();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}