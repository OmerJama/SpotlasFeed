import 'package:feed_tab/components/multiple_image_post.dart';
import 'package:feed_tab/model/post_model.dart';
import 'package:feed_tab/viewmodel/post_view_model.dart';
import 'package:feed_tab/components/single_image_post.dart';
import 'package:feed_tab/widgets/top_toolbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FeedView extends StatefulWidget {
  const FeedView({Key? key}) : super(key: key);

  @override
  State<FeedView> createState() => _FeedViewState();
}

class _FeedViewState extends State<FeedView> {
  @override
  Widget build(BuildContext context) {
    PostViewModel postViewModel = context.watch<PostViewModel>();

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const FeedTopBar(title: "Feed"),
            Expanded(
                child: ListView.builder(
              itemCount: postViewModel.postModelList.length,
              itemBuilder: (context, index) {
                PostModel postModel = postViewModel.postModelList[index];
                if (postModel.media.length > 1) {
                  List<Media> mediaList = postModel.media;
                  return MultipleImagePost(mediaList: mediaList, postModel: postModel);
                }
                return SingleImagePost(postModel: postModel);
              },
            ))
          ],
        ),
      ),
    );
  }
}








