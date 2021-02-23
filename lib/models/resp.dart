import 'package:json_annotation/json_annotation.dart';
import 'package:nt_top_news/models/article_abstract.dart';
import 'package:nt_top_news/models/new_article.dart';

part 'resp.g.dart';

@JsonSerializable()
class Resp {

  final String status;
  final String copyright;
  final String section;
  final DateTime lastUpdated;
  final int numResults;
  final List<Article> results;

  Resp({
    this.status,
    this.copyright,
    this.section,
    this.lastUpdated,
    this.numResults,
    this.results,
  });

  factory Resp.fromJson(json) => _$RespFromJson(json);
  Map<String,dynamic> toJson() => _$RespToJson(this);

}
