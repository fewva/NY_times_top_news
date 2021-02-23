import 'package:json_annotation/json_annotation.dart';

part 'multimedia.g.dart';

@JsonSerializable()
class Multimedia {

  final String url;
  final String format;
  final int height;
  final int width;
  final String type;
  final String subtype;
  final String caption;
  final String copyright;

  Multimedia({
    this.url,
    this.format,
    this.height,
    this.width,
    this.type,
    this.subtype,
    this.caption,
    this.copyright,
  });

  factory Multimedia.fromJson(json) => _$MultimediaFromJson(json);
  Map<String,dynamic> toJson() => _$MultimediaToJson(this);

}