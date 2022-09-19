import 'package:books_app/books.dart';
import 'package:flutter/material.dart';

class BooksDetail extends StatefulWidget {

  Books onClickBooksItem;
  BooksDetail(this.onClickBooksItem);

  @override
  State<BooksDetail> createState() => _BooksDetailState();}

class _BooksDetailState extends State<BooksDetail> {



  @override
  Widget build(BuildContext context) {
  return Scaffold(
      appBar: AppBar(
        title: Text('zZeren Books Now Order %35 Discount '),
        centerTitle: true),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children:[
              SizedBox(
                height: 320,
                child: Image.asset('books/${widget.onClickBooksItem.bookPicture}')),
              Text(widget.onClickBooksItem.bookName,style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
              Text('${widget.onClickBooksItem.bookPrice} \u{20BA}',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
              ElevatedButton(
                child: Text('Buy Now!',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.black87),),
                onPressed: (){
                   print('Buying');
              } 
            )
          ],
        ),
      ),
    );
  }
}