import 'dart:math' show Random;
import 'package:random_string/random_string.dart';
import 'package:flutter/material.dart';

var dropdownValue = "abc";

class ViewPage extends StatefulWidget {
  final String pic;
  ViewPage(this.pic);

  @override
  _ViewPageState createState() => _ViewPageState();
}

class _ViewPageState extends State<ViewPage> {
  var str;
  var a1;
  var a2;
  var a3;
  var a4;
  var a5;
var a = randomAlpha(70); //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("your product"),
        centerTitle: true,
        elevation: 5.0,
      ),
      body: ListView(
        children: <Widget>[
          Container(
            height: 250.0,
            child: GridTile(
              child: Container(
                color: Colors.white60,
                child: Image.network(widget.pic),
              ),
              footer: Container(
                color: Colors.white,
                child: ListTile(
                  leading: Text(
                    "your Item",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  title: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          "\$${Random().nextInt(100)}",
                          style: TextStyle(
                              decoration: TextDecoration.lineThrough,
                              color: Colors.grey),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          "\$${Random().nextInt(100)}",
                          style: TextStyle(color: Colors.red),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: RaisedButton(
                  onPressed: () {
                    setState(() {
                      a1 = "20";
                      a2 = "30";
                      a3 = "40";
                      a4 = "50";
                      a5 = "60";
                      str = "70";
                    });
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        elevation: 6.0,
                        title: Text("size"),
                        content: A(),
                        actions: <Widget>[
                          RaisedButton(
                            elevation: 10.0,
                            child: Text("close"),
                            onPressed: () => Navigator.pop(context),
                          )
                        ],
                      ),
                    );
                  },
                  color: Colors.white,
                  textColor: Colors.grey,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text("Size"),
                      ),
                      Expanded(child: Icon(Icons.arrow_drop_down_circle)),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: RaisedButton(
                  onPressed: () {
                    setState(() {
                      a1 = "yellow";
                      a2 = "green";
                      a3 = "white";
                      a4 = "brown";
                      a5 = "orange";
                      str = "Choose your colour";
                    });
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        elevation: 6.0,
                        title: Text("color"),
                        content: A(),
                        actions: <Widget>[
                          RaisedButton(
                            elevation: 10.0,
                            child: Text("close"),
                            onPressed: () => Navigator.pop(context),
                          )
                        ],
                      ),
                    );
                  },
                  color: Colors.white,
                  textColor: Colors.grey,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text("Color"),
                      ),
                      Expanded(child: Icon(Icons.arrow_drop_down_circle)),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: RaisedButton(
                  onPressed: () {
                    setState(() {
                      a1 = "yellow";
                      a2 = "green";
                      a3 = "white";
                      a4 = "brown";
                      a5 = "orange";
                      str = "Choose your colour";
                    });
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        elevation: 6.0,
                        title: Text("color"),
                        content: A(),
                        actions: <Widget>[
                          RaisedButton(
                            elevation: 10.0,
                            child: Text("close"),
                            onPressed: () => Navigator.pop(context),
                          )
                        ],
                      ),
                    );
                  },
                  color: Colors.white,
                  textColor: Colors.grey,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text("qty"),
                      ),
                      Expanded(child: Icon(Icons.arrow_drop_down_circle)),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: RaisedButton(
                    onPressed: () {
                        //
                    },
                    
                    color: Colors.red,
                    textColor: Colors.white,
                    elevation: 5.0,
                    child: Text("Buy Now"),
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0))),
              ),
              SizedBox(
                width: 10.0,
              ),
              Icon(
                Icons.shopping_cart,
                color: Colors.yellowAccent,
              ),
              SizedBox(
                width: 10.0,
              ),
              Icon(
                Icons.favorite,
                color: Colors.yellowAccent,
              ),
              SizedBox(
                width: 10.0,
              )
            ],
          ),
          Divider(color: Colors.white,),
        Text("Product Details", style: TextStyle(color: Colors.green, fontSize: 20.0),),
        Divider(
          color: Colors.white,
        ),
        Text(a),
        Text(a),
        Text(a),
        Text(a),

        ],
        
      ),
    );
  }

  Widget A() {
    return ListView(
      children: <Widget>[
        Align(
          child: Text(
            str,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
          ),
          alignment: Alignment.center,
        ),
        Container(
          height: 70.0,
          width: 200.0,
          child: Card(
            child: Align(
              child: Text(
                a1,
                style: TextStyle(color: Colors.black, fontSize: 30.0),
              ),
              alignment: Alignment.center,
            ),
            elevation: 6.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            color: Colors.white,
          ),
        ),
        Container(
          height: 70.0,
          width: 200.0,
          child: Card(
            child: Align(
              child: Text(
                a2,
                style: TextStyle(color: Colors.black, fontSize: 30.0),
              ),
              alignment: Alignment.center,
            ),
            elevation: 6.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            color: Colors.white,
          ),
        ),
        Container(
          height: 70.0,
          width: 200.0,
          child: Card(
            child: Align(
              child: Text(
                a3,
                style: TextStyle(color: Colors.black, fontSize: 30.0),
              ),
              alignment: Alignment.center,
            ),
            elevation: 6.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            color: Colors.white,
          ),
        ),
        Container(
          height: 70.0,
          width: 200.0,
          child: Card(
            child: Align(
              child: Text(
                a4,
                style: TextStyle(color: Colors.black, fontSize: 30.0),
              ),
              alignment: Alignment.center,
            ),
            elevation: 6.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            color: Colors.white,
          ),
        ),
        Container(
          height: 70.0,
          width: 200.0,
          child: Card(
            child: Align(
              child: Text(
                a5,
                style: TextStyle(color: Colors.black, fontSize: 30.0),
              ),
              alignment: Alignment.center,
            ),
            elevation: 6.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
