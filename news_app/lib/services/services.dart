import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/models/model.dart';

class getNews {
  // İlk olarak API'yı bir değişkene tanımlıyoruz
  final Url = Uri.parse(
      "https://newsapi.org/v2/top-headlines?country=tr&apiKey=fbedee90569d4ced8ade8a8af70b4746");
  late List makaleResult;
  int? counter1;

  Future Baglanti() async {
    // Burada bağlantı isimli bir future fonksiyon oluşturuyoruz.
    final response = await http.get(
        Url); // response isimli değişkende bağlantı işlemimizi gerçekleştiriyoruz. Ve gelen veriyi decode edip en son liste olarak dışarı çıkartıyoruz.
    if (response.statusCode == 200) {
      Map<String, dynamic> makale = jsonDecode(response.body);
      List<dynamic> body = makale['articles'];
      int counter = makale[
          'totalResults']; // gelen haberlerin sayısını almak için bu değişken kullanılıyor.
      List<Article> articles =
          body.map((dynamic item) => Article.fromJson(item)).toList();
      return articles;
    } else {
      print("bağlantıda bir sorun oluştu");
    }
  }
}
