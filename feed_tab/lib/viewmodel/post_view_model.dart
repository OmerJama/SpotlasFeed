// ignore_for_file: avoid_print

import 'package:feed_tab/model/post_model.dart';
import 'package:feed_tab/services/api_status.dart';
import 'package:feed_tab/services/post_services.dart';
import 'package:flutter/material.dart';

class PostViewModel extends ChangeNotifier{
  bool _loading = false;
  List<PostModel> _postModelList = [];

  bool get loading => _loading;
  List<PostModel> get postModelList => _postModelList;

  PostViewModel() {
    getPosts();
  }

  setLoading(bool loading) async{
    _loading = loading;
    notifyListeners();
  }

  setUserListModel(List<PostModel> postModelList){
    _postModelList = postModelList;
    notifyListeners();
  }

  getPosts() async{
    setLoading(true);
    var response = await PostServices.getPosts();
    if (response is Success) {
      setUserListModel(response.response as List<PostModel>);
    }
    if (response is Failure) {
      print("User error");
    }
  }

}