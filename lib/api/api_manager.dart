import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news/model/NewsResponse.dart';

import '../model/SourceResponse.dart';
import 'api_constants.dart';
import 'api_endpoints.dart';

//https://newsapi.org/v2/top-headlines/sources?apiKey=3aae3e834065453184ef24a867e9a5d5
class ApiManager {
  Future<SourceResponse> getSources(String categoryId) async {
    Uri url = Uri.https(ApiConstants.serverName, ApiEndPoints.apiName, {
      'apikey': ApiConstants.apiKey,
      'category': categoryId,
    });
    try {
      var response = await http.get(url);
      var responseBody = response.body; //todo:string
      var json = jsonDecode(responseBody); //todo:json
      return SourceResponse.fromJson(json); //todo: object
    } catch (e) {
      throw e;
    }
  }

  //todo: https://newsapi.org/v2/everything?q=bitcoin&apiKey=3aae3e834065453184ef24a867e9a5d5
  static Future<NewsResponse?> getNewsBySourceId(
    String sourceId,
    /*String title*/
  ) async {
    Uri url = Uri.https(ApiConstants.serverName, ApiEndPoints.newsApi, {
      'apiKey': ApiConstants.apiKey,
      'sources': sourceId,
      /*'q':title*/
    });
    try {
      var response = await http.get(url);
      /*if(response.statusCode >=200 && response.statusCode< 300){

  }*/
      var responseBody = response.body;
      var json = jsonDecode(responseBody);
      return NewsResponse.fromJson(json);
    } catch (e) {
      throw e;
    }
  }

  static Future<NewsResponse?> giveNews() async {
/*    Uri url = Uri.https()
    http.post(url);*/

    Uri url = Uri.https(ApiConstants.serverName, ApiEndPoints.newsApi, {
      'apiKey': ApiConstants.apiKey,
      'q': "flutter",
      'searchIn': "title,content",
    });
    try {
      var response = await http.get(url);
      var responseBody = response.body;
      var json = jsonDecode(responseBody);
      return NewsResponse.fromJson(json);
    } catch (e) {
      throw e;
    }
  }
}
