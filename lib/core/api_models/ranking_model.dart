import 'package:flutter/foundation.dart';

@immutable
class RankingModel {
  final String ncode;
  final int pt;
  final int rank;

  const RankingModel({
    required this.ncode,
    required this.pt,
    required this.rank,
  });

  factory RankingModel.fromJson(Map<String, dynamic> json) {
    return RankingModel(
      ncode: json['ncode'],
      pt: json['pt'],
      rank: json['rank'],
    );
  }
}
