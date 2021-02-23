import 'package:nt_top_news/models/article_abstract.dart';
import 'package:nt_top_news/models/new_article.dart';

class ArchiveArticle extends Article {

  final String section;
  final String subsection;
  final String title;
  final String shortUrl;
  final String coverUrl;
  final String byline;
  final String abstract;
  final DateTime updatedDate;

  ArchiveArticle({
    this.section,
    this.subsection,
    this.title,
    this.byline,
    this.updatedDate,
    this.shortUrl,
    this.coverUrl,
    this.abstract
  });

  factory ArchiveArticle.fromArticle(NewArticle a) => ArchiveArticle(
    section: a.section,
    subsection: a.subsection,
    title: a.title,
    byline: a.byline,
    updatedDate: a.updatedDate,
    shortUrl: a.shortUrl,
    coverUrl: a.coverUrl,
    abstract: a.abstract
  );

  Map<String, dynamic> toJSON() => {
    "section": section,
    "subsection": subsection,
    "title": title,
    "byline": byline,
    "updated_date": updatedDate.toIso8601String(),
    "short_url": shortUrl,
    "cover_url": coverUrl,
    "abstract": abstract
  };

  factory ArchiveArticle.fromJSON(Map<String, dynamic> json) => ArchiveArticle(
    section: json["section"],
    subsection: json["subsection"],
    title: json["title"],
    byline: json["byline"],
    updatedDate: DateTime.parse(json["updated_date"]),
    shortUrl: json["short_url"],
    coverUrl: json["cover_url"],
    abstract: json["abstract"]
  );


}
