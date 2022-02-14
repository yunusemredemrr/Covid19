// ignore_for_file: avoid_print

import 'package:covid19/src/domain/repositories/covid19_base_repository.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class DataCovid19BaseRepository implements Covid19BaseRepository {
  static final DataCovid19BaseRepository _instance =
      DataCovid19BaseRepository._internal();
  DataCovid19BaseRepository._internal();
  factory DataCovid19BaseRepository() => _instance;

  String baseUrl = "https://api.covid19api.com/dayone/country/";
  var header = {
    "Access-Control_Allow_Origin": "*",
    "Content-Type": "application/json",
  };

  @override
  Future<Response> executeCovid19Request(String requestType, String country,
      {body}) async {
    Response response;
    var url = Uri.parse(baseUrl + country + "/status/confirmed");

    try {
      switch (requestType) {
        case "GET":
          response = await http.get(url);
          break;
        case "POST":
          response = await http.post(
            url,
            headers: header,
            body: body,
          );
          break;
        case "PUT":
          response = await http.put(
            url,
            headers: header,
            body: body,
          );
          break;
        case "DELETE":
          response = await http.delete(
            url,
            headers: header,
            body: body,
          );
          break;
        default:
          throw Exception("");
      }

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return response;
      } else {
        throw Exception("");
      }
    } catch (e, st) {
      print(e);
      print(st);
      rethrow;
    }
  }
}
