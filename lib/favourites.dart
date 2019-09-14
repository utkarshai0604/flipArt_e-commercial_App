import 'package:add_del_3/images.dart';
import 'package:flutter/material.dart';
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
        title: Text("${widget.favourite.length}"),
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext _, int index)=> Card(
          child: ListTile(
            title: Image.network(widget.favourite[index]),
            trailing: InkWell(child: Icon(Icons.delete), 
            onTap: (){
              
              setState(() {
                widget.favourite.removeAt(index)                ;
              });
              },
            ),
          ),
          elevation: 2.0,
        ),
        
        itemCount: widget.favourite.length,
      ),
    );
  }
}