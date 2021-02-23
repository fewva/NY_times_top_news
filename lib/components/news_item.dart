import 'package:flutter/material.dart';
import 'package:nt_top_news/models/article_abstract.dart';
import 'package:nt_top_news/theme.dart';
import 'package:nt_top_news/utils/date_parser.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsItem extends StatelessWidget {

  final Article article;
  final bool showCategory;

  const NewsItem({
    @required this.article,
    this.showCategory = false,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    DateTime _now = DateTime.now();

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        boxShadow: kStandartBoxShadow
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        onTap: () {
          _launchURL(article.shortUrl);
        },
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (article.coverUrl != null)
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: CachedNetworkImage(
                    imageUrl: article.coverUrl,
                    height: 250,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => Container(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              if (article.title != null)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: Text(
                        article.title,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Text(
                      article.abstract,
                      style: TextStyle(color: Colors.grey),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          article.section,
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 14,
                            fontWeight: FontWeight.w600
                          ),
                        ),
                        Text(
                          DateParser.parseDate(
                            article.updatedDate,
                            _now
                          ),
                          style: TextStyle(
                            color: Colors.grey
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

_launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}