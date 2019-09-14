import 'package:add_del_3/images.dart';
import 'package:flutter/material.dart';
class Cart extends StatefulWidget {
  final List <String>cartItem;
 
  Cart(this.cartItem);

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.cartItem.length}"),
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext _, int index)=> Card(
          child: ListTile(
            title: Image.network(widget.cartItem[index]),
            trailing: InkWell(child: Icon(Icons.delete), 
            onTap: (){
              
              setState(() {
                widget.cartItem.removeAt(index)                ;
              });
              },
            ),
          ),
          elevation: 2.0,
        ),
        
        itemCount: widget.cartItem.length,
      ),
    );
  }
}