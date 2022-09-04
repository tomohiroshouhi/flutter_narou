import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:narou/core/apis/detail_api.dart';
import 'package:narou/feature/ranking_list/bloc/ranking_bloc_state.dart';

import '../../../core/apis/ranking_api.dart';

class RankingBloc extends Cubit<RankingBlocState> {
  RankingBloc() : super(RankingBlocLoadingState());

  Future<void> getRankingList() async {
    final api = RankingApi();
    final resultRanking = await api.getRankApi();
    final list = <RankingBlocSet>[];

    emit(RankingBlocLoadingState());

    if (resultRanking != null) {
      for (var detail in resultRanking) {
        if (detail.rank <= 30) {
          final detailApi = DetailApi();
          final detailResult = await detailApi.getDetail(detail.ncode);

          if (detailResult != null) {
            list.add(
              RankingBlocSet(
                ranking: detail.rank,
                title: detailResult.title,
                ncode: detailResult.ncode,
                writer: detailResult.writer,
                userid: detailResult.userid,
                story: detailResult.story,
                keyword: detailResult.keyword,
              ),
            );
          }
        }
      }
    }

    emit(RankingBlocSetState(list: list));
  }
}
