import 'dart:math';

import 'package:add_del_3/images.dart';
import 'package:add_del_3/viewPage.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
class Favourites extends StatefulWidget {
  final List <String>favourite;
 
  Favourites(this.favourite);

  @override
  _FavouritesState createState() => _FavouritesState();
}

class _FavouritesState extends State<Favourites> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("your Favourites :)"),
      ),
      body: ListView(
        children: <Widget>[
Text("you have ${widget.favourite.length} favourite items", style: TextStyle(color: Colors.yellowAccent, fontSize: 20.0),),
Container(height: 200.0,width: 200.0,
  child: crausol1),
  Row(
    children: <Widget>[
      Text("your favourite list"),
      SizedBox(width: 20.0,),
      Icon(Icons.arrow_downward, color: Colors.greenAccent,),
   
    ],
  ),


Container(
  height: 320.0,
  
  child: LiVi(context, widget.favourite)),
        ],
      ),
    );
  }
  Widget LiVi(BuildContext context, List favourite){
   return ListView.builder(
        itemBuilder: (BuildContext _, int index)=> Card(
          color: Colors.deepOrange,
          child: Row(
            children: <Widget>[
              Image.network(widget.favourite[index], height: 150.0, width: 200.0,),
              SizedBox(width: 30.0,),
              InkWell1(index,  context,) ,
              SizedBox(width: 30.0,),
              InkWell2(index,  context,  widget.favourite[index]) ,
                          ],
                        ),
                        elevation: 2.0,
                      ),
                      
                      itemCount: widget.favourite.length,
                    );
                }
              
                Widget crausol1 = Container(
                    height: 200,
                    child: Carousel(
                      boxFit: BoxFit.cover,
                      images: [
                        Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS3o453UWa996G-sTUGiY69-i4VsjTWBMWAG96887uMjeyx7BVRRQ",),
                        Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTaF2ZIZHiIYrs40J4SlHx3iBiFijSnYMGK2RbK4CyJvyLhE0S8CQ"),
                        Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTFGfdNm8TwOBpm--lMk1mVgoehUu-ylsRCCt9jrqlHd03KicHQAA"),
                        Image.network("https://images.unsplash.com/photo-1567339200339-9e514d1724fe?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60"),
                        Image.network("https://images.unsplash.com/photo-1533407411655-dcce1534c1a6?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60"),
                      ],
                      animationCurve: Curves.fastOutSlowIn,
                      animationDuration: Duration(microseconds: 2000),
                      dotSize: 4.0,
                      dotColor: Colors.green,
                      
                      indicatorBgPadding: 4.0,
                    ));
              
                _del(int index, BuildContext context) {
                  setState(() {
                widget.favourite.removeAt(index)                ;
              });
                }
                Widget InkWell1( int index,BuildContext context){
                  return InkWell(
                    child: Icon(Icons.delete, color: Colors.greenAccent,size: 30.0,),
                    onTap: ()=> _del(index, context),
                  );
                }
                Widget InkWell2( int index,BuildContext context, String pic){
                  return InkWell(
                    child: Icon(Icons.view_comfy, color: Colors.greenAccent, size: 30.0,),
                    onTap: (){
                      
                      Navigator.push(context, MaterialPageRoute(builder: (_)=> ViewPage(pic)));} ,
                  );
                }
}
      // onTap: (){
              
              // setState(() {
              //   widget.favourite.removeAt(index)                ;
              // });
      //         },