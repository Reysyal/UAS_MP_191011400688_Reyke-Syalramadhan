import 'package:flutter/material.dart';
import 'package:news_app/provider/news_provider.dart';
import 'package:news_app/screens/news_detail_screen.dart';
import 'package:provider/provider.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('191011400688_Reyke Syalramadhan'),
      ),
      body: Consumer<NewsProvider>(
        builder: (context, newsProvider, child) {
          return newsProvider.loading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.separated(
                  padding: const EdgeInsets.all(32.0),
                  itemCount: newsProvider.getNewsCount(),
                  itemBuilder: (context, index) {
                    return Card(
                      child: GestureDetector(
                        onTap: () {
                          newsProvider.toggleLoading();
                          newsProvider.fetchNewsDetail(
                              newsProvider.newsModel[index].id!);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const NewsDetailScreen(),
                            ),
                          );
                        },
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.network(
                                newsProvider.newsModel[index].image!,
                                width: 100,
                              ),
                            ),
                            Flexible(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 12.0,
                                  horizontal: 8.0,
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      newsProvider.newsModel[index].title!,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 20.0,
                                      ),
                                    ),
                                    const SizedBox(height: 8.0),
                                    Text(
                                      newsProvider.newsModel[index].createdAt!,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 18.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                      const SizedBox(
                    height: 10.0,
                  ),
                );
        },
      ),
    );
  }
}
