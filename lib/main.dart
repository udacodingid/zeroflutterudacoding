import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MovieApps(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MovieApps extends StatefulWidget {
  @override
  _MovieAppsState createState() => _MovieAppsState();
}

class _MovieAppsState extends State<MovieApps> {

  List<Container> listMovie = new List();


  var daftarMovie = [
    {"nama":"Movie 1", "images":"movie1.jpeg"},
    {"nama":"Movie 2", "images":"movie2.jpeg"},
    {"nama":"Movie 3", "images":"movie3.jpeg"},
    {"nama":"Movie 4", "images":"movie4.jpeg"},
    {"nama":"Movie 5", "images":"movie5.jpeg"},
    {"nama":"Movie 6", "images":"movie6.jpeg"},
    {"nama":"Movie 7", "images":"movie7.jpeg"},
    {"nama":"Movie 8", "images":"movie8.jpeg"},
    {"nama":"Movie 9", "images":"movie9.jpeg"},
    {"nama":"Movie 10", "images":"movie10.jpeg"},
    {"nama":"Movie 11", "images":"movie11.jpeg"},
  ];

  _buatDataList(){
    for(var i=0; i<daftarMovie.length; i++){
      final listMovienya = daftarMovie[i];
      final String images = listMovienya['images'];

      listMovie.add(new Container(
        padding: new EdgeInsets.all(20.0),
        child: new Card(
          child: new InkWell(
            onTap: (){
              //pindah ke detail
              Navigator.of(context).push(new MaterialPageRoute(builder: (context) => DetailMovieApp(
                nama: listMovienya['nama'],
                gambar: images,
              )));
            },
            child: new Column(
              children: <Widget>[
                new Padding(padding: new EdgeInsets.all(10.0)),
                new Hero(tag: listMovienya['nama'], child: new Image.asset("gambar/$images",
                height: 150.0,
                  width: 100.0,
                  fit: BoxFit.cover,

                )),
                new Padding(padding: new EdgeInsets.all(10.0)),
                new Text(listMovienya['nama'], style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),),
              ],
            ),
          ),
        ),
      ));
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _buatDataList();
  }

  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;

    final double itemHeight = (size.height - kToolbarHeight - 24)/2;
    final double itemWidth = size.width/2;

    return Scaffold(
      appBar: AppBar(
        title: Text('Movie Apps'),
        backgroundColor: Colors.red,
      ),

      resizeToAvoidBottomPadding: false,
      body: new Container(
        child: GridView.count(
          childAspectRatio: (itemWidth/itemHeight),
          controller: new ScrollController(keepScrollOffset: false),
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          crossAxisCount: 2,
          children: listMovie,

        ),
      ),
    );
  }
}

class DetailMovieApp extends StatelessWidget {

  DetailMovieApp({this.nama, this.gambar});
  final String nama;
  final String gambar;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          new Container(
            height: 300,
            child: new Hero(tag: nama, child: new Material(
              child: new InkWell(
                child: Image.asset('gambar/$gambar', fit: BoxFit.contain,),
              ),
            )),
          ),

          new BagianNama(
            nama : nama
          ),
          
          new BagianIcon(),
          
          new BagianKeterangan(),
        ],
      ),
    );
  }
}

class BagianNama extends StatelessWidget {

  BagianNama({this.nama});
  final String nama;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: new Row(
        children: <Widget>[
          new Expanded(child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Text(nama, style : new TextStyle(fontSize: 20.0, color: Colors.red),),
              new Text("$nama\@gmail.com", style: new TextStyle(fontSize: 17.0, color: Colors.grey),)
            ],
          )),

          new Row(
            children: <Widget>[
              new Icon(Icons.star, size: 30.0, color: Colors.red,),
              new Text("12", style: new TextStyle(fontSize: 18.0),),
            ],
          )
        ],
      ),
    );
  }
}


class  BagianIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: new Row(
        children: <Widget>[ 
          new IconTeks(
            iconData : Icons.call,
            teks : "Call"
          ),
          
          new IconTeks(
            iconData : Icons.message,
            teks : "Message"
          ),

          new IconTeks(
              iconData : Icons.photo,
              teks : "Photo"
          ),
          
          
        ],
      ),
    );
  }
}


class IconTeks extends StatelessWidget {
  
  IconTeks({this.iconData, this.teks});
  final IconData iconData;
  final String teks;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: new Column(
        children: <Widget>[
          new Icon(iconData, size: 20.0, color: Colors.red,),
          new Text(teks, style: new TextStyle(fontSize: 12.0, color: Colors.red),)
        ],
      ),
    );
  }
}


class BagianKeterangan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: new Card(
        child: new Padding(padding: const EdgeInsets.all(10.0),
        child: new Text("Lorem Ipsum adalah contoh teks atau dummy dalam industri percetakan dan penataan huruf atau typesetting. Lorem Ipsum telah menjadi standar contoh teks sejak tahun 1500an, saat seorang tukang cetak yang tidak dikenal mengambil sebuah kumpulan teks dan mengacaknya untuk menjadi sebuah buku contoh huruf. Ia tidak hanya bertahan selama 5 abad, tapi juga telah beralih ke penataan huruf elektronik, tanpa ada perubahan apapun. Ia mulai dipopulerkan pada tahun 1960 dengan diluncurkannya lembaran-lembaran Letraset yang menggunakan kalimat-kalimat dari Lorem Ipsum, dan seiring munculnya perangkat lunak Desktop Publishing seperti Aldus PageMaker juga memiliki versi Lorem Ipsum.",
          style: new TextStyle(fontSize: 14.0),
          textAlign: TextAlign.justify,
        ),

        ),
      ),
    );
  }
}





