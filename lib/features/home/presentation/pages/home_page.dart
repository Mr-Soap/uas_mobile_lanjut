import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uas_mobile_lanjut/features/home/presentation/widgets/home_header.dart';
import 'package:uas_mobile_lanjut/features/home/presentation/widgets/news_search_bar.dart';
import 'package:uas_mobile_lanjut/features/news/presentation/bloc/news_event.dart';
import 'package:uas_mobile_lanjut/features/news/presentation/bloc/news_state.dart';
import 'package:uas_mobile_lanjut/features/news/presentation/bloc/news_bloc.dart';
import 'package:uas_mobile_lanjut/features/news/presentation/widgets/article_card.dart';
import 'package:uas_mobile_lanjut/core/widgets/loading_lottie.dart';
import 'package:uas_mobile_lanjut/core/widgets/empty_state.dart';

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
                    return const LoadingLottie();
                  }

                  //state loaded
                  if (state is NewsLoaded) {

                     if (state.articles.isEmpty) {
                      return RefreshIndicator(
                        onRefresh: () async {
                          context.read<NewsBloc>().add(
                            const GetTopHeadlinesEvent(),
                          );
                        },
                        child: const SingleChildScrollView(
                          physics: AlwaysScrollableScrollPhysics(),
                          child: SizedBox(
                            height: 600,
                            child: EmptyState(
                              title: "No News Found",
                              subtitle: "Try another keyword.",
                            ),
                          ),
                        ),
                      );
                     }
                    return RefreshIndicator(
                      onRefresh: () async {
                        context.read<NewsBloc>().add(
                          const GetTopHeadlinesEvent(),
                        );
                      },
                      child: ListView.builder(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        itemCount: state.articles.length,
                        itemBuilder: (context, index) {
                          final article = state.articles[index];
                          return ArticleCard(article: article);
                        },
                      ),
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