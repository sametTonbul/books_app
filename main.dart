import 'package:books_app/books.dart';
import 'package:books_app/booksDetail.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
   @override
  State<MyHomePage> createState() => _MyHomePageState();}

class _MyHomePageState extends State<MyHomePage> {

  Future<List<Books>> getingBooks () async {

  var book1 = Books(1, 'Amok Koşucusu', 'amokkosucusu.jpg', 19.90);
  var book2 = Books(2, 'Ay Işığı', 'ayisigi.jpg', 25.90);
  var book3 = Books(3, 'Bir Çöküşün Hikayesi', 'bircokusunoykusu.jpg', 22.90);
  var book4 = Books(4, 'Korku', 'korku.jpg', 25.90);
  var book5 = Books(5, 'Mecburiyet', 'mecburiyet.jpg', 36.90);
  var book6 = Books(6, 'Satranç', 'satranc.jpg', 19.90);

  var myBooks = [book1,book2,book3,book4,book5,book6];

  return myBooks;

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('zZeren Books'),
        centerTitle: true),
      body: 
      
      FutureBuilder<List<Books>>(
        future: getingBooks(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var booksHasDataTrue = snapshot.data;
            return GridView.builder(
              itemCount: booksHasDataTrue!.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 2 / 3.5,
                crossAxisCount: 2,
              ),
              itemBuilder: (context, index) {
                var booksIndexHasData = booksHasDataTrue[index];

                return GestureDetector(
                  onTap: ()=>
                  Navigator.push(context, MaterialPageRoute(builder: (context) => BooksDetail(booksIndexHasData),)),

                  child: Card(
                    child : 
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            height: 280,
                            child: Image.asset(
                              'books/${booksIndexHasData.bookPicture}'),
                          ),
                        ),
                        Text(booksIndexHasData.bookName,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                        Text('${booksIndexHasData.bookPrice} \u{20BA} ',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  );
                }
              );
            } else {
              return Center();
          }
        }
      )
    );
  }
}
