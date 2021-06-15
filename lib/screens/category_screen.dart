import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:inshorts_clone/repository/repository.dart';
import 'package:inshorts_clone/screens/home_page.dart';

class CategoryScreen extends StatelessWidget {
  final TextEditingController _textEditingController = TextEditingController();

  void _navigateToScreen(
      BuildContext context, NewsType? _newsType, String? searchTerm) {
    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
      return HomePage(
        newsType: _newsType,
        searchTerm: searchTerm,
      );
    }));
  }

  Widget _categoryContainer(
      {required String title, required String assetname}) {
    return Container(
      height: 100,
      width: double.infinity,
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.black12,
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            "assets/svg/$assetname",
            width: 150,
          ),
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Text(
              title,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Discover"),
      ),
      body: ListView(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 12,
            width: double.infinity,
            margin: EdgeInsets.all(20),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.black12,
            ),
            child: TextField(
              controller: _textEditingController,
              onSubmitted: (value) {
                if (value != "") {
                  _navigateToScreen(context, null, value);
                }
              },
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  border: InputBorder.none,
                  hintText: "Search For Topic"),
            ),
          ),
          GestureDetector(
              onTap: () {
                _navigateToScreen(context, NewsType.TechNews, null);
              },
              child: _categoryContainer(
                title: "Technology News",
                assetname: 'tech.svg',
              )),
          GestureDetector(
              onTap: () {
                _navigateToScreen(context, NewsType.BreakingNews, null);
              },
              child: _categoryContainer(
                title: "Buiness News",
                assetname: 'buisness.svg',
              )),
          GestureDetector(
              onTap: () {
                _navigateToScreen(context, NewsType.SportsNews, null);
              },
              child: _categoryContainer(
                title: "Sports",
                assetname: 'sports.svg',
              )),
        ],
      ),
    );
  }
}
