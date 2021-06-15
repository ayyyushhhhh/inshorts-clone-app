import 'package:flutter/material.dart';
import 'package:inshorts_clone/models/news_model.dart';
import 'package:inshorts_clone/repository/repository.dart';
import 'package:inshorts_clone/widgets/news_card.dart';

class HomePage extends StatefulWidget {
  final NewsType? newsType;
  final String? searchTerm;
  const HomePage({Key? key, this.newsType, this.searchTerm}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  int index = 0;

  @override
  void initState() {
    super.initState();
    getCurrentStream();
  }

  void updateIndex(DismissDirection direction) {
    setState(() {
      if (direction == DismissDirection.up) {
        index = index + 1;
      } else if (direction == DismissDirection.down) {
        if (index != 0) {
          index = index - 1;
        } else {
          index = 0;
        }
      }
    });
  }

  Stream<List<Article>> getCurrentStream() {
    if (widget.newsType == NewsType.TechNews) {
      print("tech");
      return newsRepo.fetchTechNews();
    } else if (widget.newsType == NewsType.BuisnessNews) {
      return newsRepo.fetchBreakingNews();
    } else if (widget.newsType == NewsType.SportsNews) {
      return newsRepo.sportsNews();
    } else if (widget.searchTerm != null) {
      return newsRepo.searchNews(search: widget.searchTerm.toString());
    }
    return newsRepo.fetchBreakingNews();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Repository newsRepo = Repository();

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("InShorts"),
      ),
      body: StreamBuilder(
        stream: getCurrentStream(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            List<Article> articlesList = snapshot.data;
            return Dismissible(
              key: UniqueKey(),
              direction: DismissDirection.vertical,
              resizeDuration: Duration(milliseconds: 1),
              onDismissed: (direction) {
                updateIndex(direction);
              },
              background: index == 0
                  ? Container(
                      color: Colors.black,
                    )
                  : Opacity(
                      opacity: 0.5,
                      child: NewsCard(
                        article: articlesList[index - 1],
                      ),
                    ),
              secondaryBackground: Opacity(
                opacity: 0.5,
                child: NewsCard(
                  article: articlesList[index + 1],
                ),
              ),
              child: NewsCard(
                article: articlesList[index],
              ),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text("Opps Error Occured"),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
