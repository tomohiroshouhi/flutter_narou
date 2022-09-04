import 'package:flutter/foundation.dart';

@immutable
class DetailsModel {
  final String title;
  final String ncode;
  final int userid;
  final String writer;
  final String story;
  final List<String> keyword;

  const DetailsModel({
    required this.title,
    required this.ncode,
    required this.userid,
    required this.writer,
    required this.story,
    required this.keyword,
  });

  factory DetailsModel.fromJson(Map<String, dynamic> json) {
    return DetailsModel(
      title: json['title'],
      ncode: json['ncode'],
      userid: json['userid'],
      writer: json['writer'],
      story: json['story'],
      keyword: json['keyword'].split(' '),
    );
  }
}
