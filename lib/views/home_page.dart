import 'package:flutter/material.dart';

import '../models/article.dart';
import '../services/article_service.dart';
import '../widget/ArticleWidget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Article>? articles;
  bool isLoaded = false;

  @override
  void initState() {
    getArticles();
    super.initState();
  }

  getArticles() async {
    articles = (await ArticleService.getArticles())!.cast<Article>();
    if (articles != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Visibility(
          visible: isLoaded,
          replacement: const CircularProgressIndicator(),
          child: ListView.builder(
              itemCount: articles == null ? 0 : articles!.length,
              itemBuilder: (context, index) {
                return ArticleWidget(text: articles![index].title);
              }),
        ),
      ),
    );
  }
}
