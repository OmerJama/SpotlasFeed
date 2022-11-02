import 'dart:io';
import 'package:feed_tab/model/post_model.dart';
import 'package:feed_tab/services/api_status.dart';
import 'package:http/http.dart' as http;

class PostServices {
  static int currentPage = 1;
  static Future<Object> getPosts({bool isRefreshed = false}) async {
    try {
      if (isRefreshed) {
        currentPage = 1;
      }
      var url = Uri.parse("https://dev.api.spotlas.com/interview/feed?$currentPage");
      var response = await http.get(url);
      
      if (response.statusCode == 200) {
        currentPage++;
        print(currentPage);
        return Success(code: 200, response: postModelFromJson(response.body));
      }
      return Failure(code: 100, response: "Invalid response");
    } on HttpException {
      return Failure(code: 102, response: 'No internet');
    } catch (e) {
      return Failure(code: 103, response: 'Unknown error');
    }
  }
}
