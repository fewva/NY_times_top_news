import 'package:json_annotation/json_annotation.dart';
import 'package:nt_top_news/models/article_abstract.dart';
import 'package:nt_top_news/models/multimedia.dart';

part 'new_article.g.dart';

@JsonSerializable()

class NewArticle extends Article {

  final String section;
  final String subsection;
  final String title;
  final String abstract;
  final String url;
  final String uri;
  final String byline;
  final String itemType;
  final DateTime updatedDate;
  final DateTime createdDate;
  final DateTime publishedDate;
  final String materialTypeFacet;
  final String kicker;
  final List<String> desFacet;
  final List<String> orgFacet;
  final List<String> perFacet;
  final List<String> geoFacet;
  final List<Multimedia> multimedia;
  final String shortUrl;

  NewArticle({
    this.section,
    this.subsection,
    this.title,
    this.abstract,
    this.url,
    this.uri,
    this.byline,
    this.itemType,
    this.updatedDate,
    this.createdDate,
    this.publishedDate,
    this.materialTypeFacet,
    this.kicker,
    this.desFacet,
    this.orgFacet,
    this.perFacet,
    this.geoFacet,
    this.multimedia,
    this.shortUrl,
  });

  String get coverUrl => this.multimedia[0].url; 
  set coverUrl(String newCover) => coverUrl = newCover;

  factory NewArticle.fromJson(json) => _$NewArticleFromJson(json);
  Map<String,dynamic> toJson() => _$NewArticleToJson(this);

}