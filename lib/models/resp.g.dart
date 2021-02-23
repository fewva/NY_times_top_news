// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Resp _$RespFromJson(Map<String, dynamic> json) {
  return Resp(
    status: json['status'] as String,
    copyright: json['copyright'] as String,
    section: json['section'] as String,
    lastUpdated: json['lastUpdated'] == null
        ? null
        : DateTime.parse(json['lastUpdated'] as String),
    numResults: json['numResults'] as int,
    results: (json['results'] as List)
        ?.map((e) => e == null ? null : NewArticle.fromJson(e))
        ?.toList(),
  );
}

Map<String, dynamic> _$RespToJson(Resp instance) => <String, dynamic>{
      'status': instance.status,
      'copyright': instance.copyright,
      'section': instance.section,
      'lastUpdated': instance.lastUpdated?.toIso8601String(),
      'numResults': instance.numResults,
      'results': instance.results,
    };
