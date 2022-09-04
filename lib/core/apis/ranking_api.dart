import 'dart:convert';

import 'package:intl/intl.dart';
import 'package:narou/feature/core/apis/base_api.dart';
import 'package:http/http.dart' as http;

import '../api_models/ranking_model.dart';

class RankingApi extends ApiBase {
  Future<List<RankingModel>?> getRankApi() async {
    var formatter = DateFormat('yyyyMMdd');
    final url =
        '$domain/rank/rankget/?out=json&rtype=${formatter.format(DateTime.now())}-d';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final jsonArray = json.decode(response.body);
      final list =
          jsonArray.map((json) => RankingModel.fromJson(json)).toList();

      return list.cast<RankingModel>();
    }
    return null;
  }
}
