import 'package:feed_tab/components/multiple_image_post.dart';
import 'package:feed_tab/model/post_model.dart';
import 'package:feed_tab/services/api_status.dart';
import 'package:feed_tab/services/post_services.dart';
import 'package:feed_tab/viewmodel/post_view_model.dart';
import 'package:feed_tab/components/single_image_post.dart';
import 'package:feed_tab/widgets/top_toolbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class FeedView extends StatefulWidget {
  const FeedView({Key? key}) : super(key: key);

  @override
  State<FeedView> createState() => _FeedViewState();
}

class _FeedViewState extends State<FeedView> {
  ScrollController _scrollController = ScrollController();
  RefreshController _paginationController = RefreshController();

  @override
  Widget build(BuildContext context) {
    PostViewModel postViewModel = context.watch<PostViewModel>();

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const FeedTopBar(title: "Feed"),
            Expanded(
              child: SmartRefresher(
                controller: _paginationController,
                enablePullUp: true,
                onRefresh: () async {
                  final result = await PostServices.getPosts(isRefreshed: true);
                  if (result is Success) {
                    _paginationController.refreshCompleted();
                  }
                  else{
                    _paginationController.refreshFailed();
                  }
                },
                onLoading: () async{
                  final result = await PostServices.getPosts();
                  if (result is Success) {
                    _paginationController.loadComplete();
                  }
                  else{
                    _paginationController.loadFailed();
                  }
                },
                child: ListView.builder(
                controller: _scrollController,
                itemCount: postViewModel.postModelList.length,
                itemBuilder: (context, index) {
                  PostModel postModel = postViewModel.postModelList[index];
                  if (postModel.media.length > 1) {
                    List<Media> mediaList = postModel.media;
                    return MultipleImagePost(
                        mediaList: mediaList, postModel: postModel);
                  }
                  return SingleImagePost(postModel: postModel);
                },
              ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
