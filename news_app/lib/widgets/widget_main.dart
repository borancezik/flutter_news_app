import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/models/model.dart';
import 'package:news_app/pages/news_detail.dart';
import 'package:news_app/services/services.dart';
import 'package:news_app/pages/home.dart';

Widget anaSayfa(BuildContext context, index, articles) {
  return GestureDetector(
      child: Container(
          padding: EdgeInsets.all(12.0),
          margin: EdgeInsets.all(8.0),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.0),
              boxShadow: [BoxShadow(color: Colors.black, blurRadius: 13.0)]),
          child: Column(
            children: [
              articles[index].urlToImage != Null
                  ? Container(
                      height: 200.0,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(articles[index].urlToImage),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    )
                  : Container(
                      height: 200.0,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                                'https://source.unsplash.com/weekly?coding'),
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
              Text(
                articles[index].title,
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.favorite,
                      size: 30.0,
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ],
          )),
      onTap: () {
        //  onTap
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    Newsdetail(articles: articles, index: index)));
      });
}

List<String> kategoriler = [
  "Spor Haberleri",
  "Ekonomi Haberleri",
  "Gündem Haberleri",
  "Magazin Haberleri",
  "Siyaset Haberleri",
  "Son Dakika Haberleri",
  "Yaşam Haberleri",
  "Sağlık Haberleri",
  "Dünya Haberleri",
  "Seyahat Haberleri",
  "Yurt Dışı Haberleri",
  "Kadın Haberleri",
  "Erkek Haberleri",
  "Teknoloji Haberleri1",
];
List<IconData> iconlar = [
  Icons.sports_basketball,
  Icons.account_balance,
  Icons.attach_money,
  Icons.sentiment_satisfied_alt_rounded,
  Icons.camera_alt,
  Icons.query_stats_rounded,
  Icons.queue_rounded,
  Icons.queue_rounded,
  Icons.queue_rounded,
  Icons.queue_rounded,
  Icons.queue_rounded,
  Icons.queue_rounded,
  Icons.queue_rounded,
  Icons.queue_rounded,
];
Widget kategoriSayfa(index) {
  return Column(
    children: [
      Container(
        margin: EdgeInsets.only(top: 15.0),
        padding: EdgeInsets.only(left: 10.0, top: 10.0, bottom: 10.0),
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  offset: Offset(0, 4),
                  blurRadius: 4,
                  color: Colors.black.withOpacity(0.70))
            ]),
        child: Row(
          children: [
            Icon(
              iconlar[index],
              size: 30.0,
            ),
            SizedBox(
              width: 30.0,
            ),
            Text(
              kategoriler[index],
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    ],
  );
}

Widget favoriSayfa(BuildContext context, index, articles) {
  return Container(
    padding: EdgeInsets.all(10.0),
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [BoxShadow(color: Colors.black, blurRadius: 13.0)]),
    margin: EdgeInsets.all(8.0),
    child: Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8.0),
              topRight: Radius.circular(8.0),
            ),
            child: Image.network(articles[index].urlToImage,
                height: 200, fit: BoxFit.fill),
          ),
          ListTile(
            title: Text(articles[index].title),
          ),
        ],
      ),
    ),
  );
}
