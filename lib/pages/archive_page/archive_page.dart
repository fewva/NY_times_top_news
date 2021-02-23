import 'package:flutter/material.dart';
import 'package:nt_top_news/components/custom_app_bar.dart';
import 'package:nt_top_news/components/news_list.dart';
import 'package:nt_top_news/databases/news_db.dart';

class ArchivePage extends StatelessWidget {
  const ArchivePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: NewsDB().getArticles(),
      builder: (context, articles) {
        if (articles.hasData)
          return Scaffold(
            appBar: CustomAppBar(
              title: 'Archive',
            ),
            body: NewsList(newsList: articles.data),
          );
        if (articles.hasError) return Container(child: Center(child: Text('ERROR')));
        if (!articles.hasData)
          return Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
            ),
          );
        return Container();
      },
    );
  }
}