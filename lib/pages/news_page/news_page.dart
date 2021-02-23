import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:nt_top_news/components/custom_app_bar.dart';
import 'package:nt_top_news/components/news_list.dart';
import 'package:nt_top_news/databases/news_db.dart';
import 'package:nt_top_news/models/article_abstract.dart';
import 'package:nt_top_news/network/network.dart';

Stream getNews() async* {

  final news = await Network.getTopStories();

  yield news;

}

class NewsPage extends StatefulWidget {
  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {

  final StreamController newsStream = StreamController();

  @override
  void dispose() {
    super.dispose();
    newsStream.close();
  }

  @override
  Widget build(BuildContext context) {

    newsStream.addStream(getNews());

    return StreamBuilder(
      stream: newsStream.stream,
      builder: (context, response) {
        if (response.hasData) {
          NewsDB().insertArticles(response.data.results);
          List <String> _tabs = _getTabList(response.data.results);
          
          return DefaultTabController(
            length: _tabs.length,
            child: Scaffold(
              appBar: CustomAppBar(
                title: 'Top News',
                bottom: SizedBox(
                  height: 25,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    child: TabBar(
                      isScrollable: true,
                      indicator: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(20)
                      ),
                      tabs: [
                        for (var i = 0; i < _tabs.length; i++)
                          Tab(text: _tabs[i].toString().toUpperCase())
                      ]
                    ),
                  ),
                ),
              ),

              body: TabBarView(
                children: [
                  for (var i = 0; i < _tabs.length; i++)
                    LiquidPullToRefresh(
                      onRefresh: () async {
                        try {
                          final _ts = await Network.getTopStories();
                          newsStream.add(_ts);
                        } catch (e) {
                          return Scaffold.of(context).showSnackBar(_snackBar(e));
                        }
                      },
                      animSpeedFactor: 2,
                      height: 20,
                      color: Colors.black,
                      springAnimationDurationInMilliseconds: 300,
                      showChildOpacityTransition: false,
                      child: NewsList(
                        newsList: i == 0
                          ? response.data.results
                          : response.data.results
                            .where((v) => v.section == _tabs[i])
                            .toList(),
                        showCategory: i == 0,
                      ),
                    )
                ]
              ),
            ),
          );
        }
        if (response.hasError) return Container(child: Center(child: Text('ERROR')));
        if (!response.hasData)
          return Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
            ),
          );
        return Container();
      }
    );
  }
}

List<String> _getTabList(List<Article> articles) {
  Set<String> tabs = {'all'};

  for (var item in articles) {
    item.section != null
        ? tabs.add(item.section)
        : tabs.add('without category');
  }

  return tabs.toList();
}


SnackBar _snackBar(error) {
  return SnackBar(
    backgroundColor: Colors.white,
    elevation: 10,
    content: Text(error.toString(), style: TextStyle(color: Colors.black)),
    action: SnackBarAction(
      label: 'ok',
      textColor: Colors.redAccent,
      onPressed: () {
        print('Error');
      },
    ),
  );
} 