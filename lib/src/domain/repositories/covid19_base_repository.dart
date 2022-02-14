import 'package:http/http.dart';

abstract class Covid19BaseRepository {
  Future<Response> executeCovid19Request(String requestType, String path,
      {body});
}
