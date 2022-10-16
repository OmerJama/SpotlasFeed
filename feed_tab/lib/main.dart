import 'package:feed_tab/view/feed_view.dart';
import 'package:feed_tab/viewmodel/post_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => PostViewModel(),
        )
      ],
      child: MaterialApp(
        title: 'Spotlas Feed',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const FeedView(),
      ),
    );
  }
}
