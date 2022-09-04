import 'package:flutter/foundation.dart';

@immutable
abstract class RankingBlocState {}

class RankingBlocLoadingState extends RankingBlocState {}

class RankingBlocSetState extends RankingBlocState {
  final List<RankingBlocSet> list;

  RankingBlocSetState({required this.list});
}

class RankingBlocSet {
  final int ranking;
  final String title;
  final String ncode;
  final int userid;
  final String writer;
  final String story;
  final List<String> keyword;

  RankingBlocSet({
    required this.ranking,
    required this.title,
    required this.ncode,
    required this.userid,
    required this.writer,
    required this.story,
    required this.keyword,
  });

  factory RankingBlocSet.init() {
    return RankingBlocSet(
      ranking: 0,
      title: '',
      ncode: 'NNNNNN',
      userid: 0,
      writer: 'aaaaaa',
      story: 'aaaaa',
      keyword: const [],
    );
  }

  RankingBlocSet copyWith({
    int? copyRanking,
    String? copyTitle,
    String? copyNcode,
    int? copyUserid,
    String? copyWriter,
    String? copyStory,
    List<String>? copyKeyword,
  }) {
    return RankingBlocSet(
      ranking: copyRanking ?? ranking,
      title: copyTitle ?? title,
      ncode: copyNcode ?? ncode,
      userid: copyUserid ?? userid,
      writer: copyWriter ?? writer,
      story: copyStory ?? story,
      keyword: copyKeyword ?? keyword,
    );
  }
}
