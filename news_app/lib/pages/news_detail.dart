import 'package:flutter/material.dart';
import 'package:news_app/models/model.dart';

class Newsdetail extends StatelessWidget {
  final List articles;
  int index;

  Newsdetail({required this.articles, required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(articles[index].title),
        backgroundColor: Colors.grey,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Container(
                height: 250.0,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(articles[index].urlToImage),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 8.0, bottom: 8.0),
                width: double.infinity,
                decoration: BoxDecoration(color: Colors.white),
                child: Text(
                  "Kaynak : " + articles[index].source.name,
                ),
              ),
              Container(
                child: Text(
                  articles[index].content,
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
