import 'package:news_app/widgets/widget_main.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/models/model.dart';
import 'package:news_app/services/services.dart';

class homePage extends StatefulWidget {
  const homePage({Key? key}) : super(key: key);

  @override
  _homePageState createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  int seciliSayfa = 0;
  void sayfaDegistir(int index) {
    // seçilen sayfa için state in güncellendiği yer
    setState(() {
      seciliSayfa = index;
    });
  }

  bool _butonaBasildi = false;
  void renkDegistir() {
    setState(() {
      _butonaBasildi =
          !_butonaBasildi; // butonun basıldıgında renginin değişmesi için state in güncellendiği yer.
    });
  }

  getNews client = getNews();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Haberler",
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 25.0),
          ),
          backgroundColor: Colors.white,
        ),
        body: SafeArea(
            child: FutureBuilder(
          // API den gelen veriyi yazdırmak için futurebuilder kullanıyoruz.
          future: client.Baglanti(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              List articles = snapshot.data ?? " ";
              return ListView.builder(
                  // listview ile gelen veriyi widget olarak yazdırıyoruz.
                  itemCount: sayfaSayma(seciliSayfa, articles),
                  itemBuilder: (BuildContext context, index) {
                    return sayfaGoster(seciliSayfa, context, index, articles);
                  });
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        )),
        bottomNavigationBar: SizedBox(
          height: 60.0,
          child: Theme(
              data: Theme.of(context).copyWith(canvasColor: Colors.grey),
              child: BottomNavigationBar(
                currentIndex: seciliSayfa,
                onTap: sayfaDegistir,
                type: BottomNavigationBarType.fixed,
                fixedColor: Colors.white,
                items: <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    title: Text(
                      'Anasayfa',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.list),
                    title: Text(
                      'Kategoriler',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.favorite),
                    title: Text(
                      'Favoriler',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ),
                ],
              )),
        ));
  }
}

Widget sayfaGoster(int seciliSayfa, BuildContext context, index, articles) {
  var sayfaDurum; // hangi sayfanın seçildğini ve hangisinin gösterileceğini belirleyen kod.
  if (seciliSayfa == 0) {
    sayfaDurum = anaSayfa(context, index, articles);
  } else if (seciliSayfa == 1) {
    sayfaDurum = kategoriSayfa(index);
  } else if (seciliSayfa == 2) {
    sayfaDurum = favoriSayfa(context, index, articles);
  }
  return sayfaDurum;
}

sayfaSayma(seciliSayfa, articles) {
  // her sayfaya göre ayrı ayrı listview builder ın count parametresine uzunluk değerini gönderen kod.
  if (seciliSayfa == 0) {
    if (articles.length != null) {
      return articles.length;
    } else {
      return CircularProgressIndicator();
    }
  } else if (seciliSayfa == 1) {
    return kategoriler.length;
  } else if (seciliSayfa == 2) {
    return 2;
  }
}
