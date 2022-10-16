import 'dart:io';

import 'package:feed_tab/model/post_model.dart';
import 'package:feed_tab/services/api_status.dart';
import 'package:http/http.dart' as http;

class PostServices {
  static Future<Object> getPosts() async {
    try {
      var url = Uri.parse("https://dev.api.spotlas.com/interview/feed?page=1");
      var response = await http.get(url);
      
      if (response.statusCode == 200) {
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
