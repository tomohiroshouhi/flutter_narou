import 'dart:convert';

import 'package:narou/feature/core/apis/base_api.dart';
import 'package:http/http.dart' as http;

import '../api_models/detail_model.dart';

class DetailApi extends ApiBase {
  Future<DetailsModel?> getDetail(String ncode) async {
    final url = '$domain/novelapi/api/?out=json&ncode=$ncode';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final jsonDecode = json.decode(response.body);
      final model = DetailsModel.fromJson(jsonDecode[1]);

      return model;
    }
    return null;
  }
}
