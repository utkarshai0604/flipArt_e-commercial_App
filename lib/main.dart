import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'cart.dart';
import 'favourites.dart';
import 'images.dart';

void main() {
  runApp(MyApp());
}

// MyApp is a StatefulWidget. This allows updating the state of the
// widget when an item is removed.
class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  MyAppState createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "hello",
      theme: ThemeData(primarySwatch: Colors.blue, brightness: Brightness.dark),
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  final title = 'FlipArt';
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> fav = [];
  final items = List<String>.generate(image.length, (i) => "Item ${i + 1}");
  List<String> cart = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          InkWell(
            child: Icon(
              Icons.shopping_cart,
              color: Colors.yellow,
              size: 30.0,
            ),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => Cart(cart),
              ),
            ),
          ),
          SizedBox(
            width: 10.0,
          ),
          InkWell(
            child: Icon(
              Icons.favorite,
              color: Colors.red,
              size: 30.0,
            ),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => Favourites(fav),
              ),
            ),
          ),
          SizedBox(
            width: 10.0,
          )
        ],
      ),
      drawer: Drawer1(),
      body: ListView.builder(
        itemCount: image.length,
        itemBuilder: (context, index) {
          final item = items[index];

          return Dismissible(
              // Each Dismissible must contain a Key. Keys allow Flutter to
              // uniquely identify widgets.
              key: Key(item),
              // Provide a function that tells the app
              // what to do after an item has been swiped away.
              onDismissed: (direction) {
                // Remove the item from the data source.
                setState(() {
                  items.removeAt(index);
                  image.removeAt(index);
                });

                // Then show a snackbar.
                Scaffold.of(context)
                    .showSnackBar(SnackBar(content: Text("$item dismissed")));
              },
              // Show a red background as the item is swiped away.
              background: Container(color: Colors.red),
              child: Column(
                children: <Widget>[
                  Container(
                    height: 150.0,
                    width: double.infinity,
                    child: Container(
                        child: (index % 2) == 0
                            ? Row(
                                children: <Widget>[
                                  SizedBox(
                                    width: 20.0,
                                  ),
                                  Column(
                                    children: <Widget>[
                                      SizedBox(
                                        height: 30.0,
                                      ),
                                      Row(
                                        children: <Widget>[
                                          Text("add to "),
                                          Icon1(index, context),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10.0,
                                      ),
                                      Row(
                                        children: <Widget>[
                                          Text("add to "),
                                          Icon2(index, context),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10.0,
                                      ),
                                      Row(
                                        children: <Widget>[
                                          Text("view "),
                                          Icon(
                                            Icons.image_aspect_ratio,
                                            color: Colors.yellowAccent,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 20.0,
                                  ),
                                  Container(
                                      child: Image.network(
                                    image[index],
                                    height: 400.0,
                                    width: 250.0,
                                  ))
                                ],
                              )
                            : Row(
                                children: <Widget>[
                                  ClipRRect(
                                      borderRadius: BorderRadius.circular(50.0),
                                      child: Image.network(
                                        image[index],
                                        height: 400.0,
                                        width: 250.0,
                                      )),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  Column(
                                    children: <Widget>[
                                      SizedBox(
                                        height: 30.0,
                                      ),
                                      Row(
                                        children: <Widget>[
                                          Text("add to "),
                                          Icon1(index, context),
                                        ],
                                      ),
                                    
                                      SizedBox(
                                        height: 10.0,
                                      ),
                                      Row(
                                        children: <Widget>[
                                          Text("add to "),
                                          Icon2(index, context),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10.0,
                                      ),
                                       Row(
                                        children: <Widget>[
                                          Text("view "),
                                            Icon(
                                        Icons.image_aspect_ratio,
                                        color: Colors.yellowAccent,
                                      ),
                                        ],
                                      ),
                                    
                                    ],
                                  )
                                ],
                              )),
                  ),
                  Divider(
                    height: 30.0,
                    color: Colors.white,
                  )
                ],
              ));
        },
      ),
    );
  }

  _addFav(int index) {
    setState(() {
      fav.add(image[index]);
      print(fav.length);
      print(fav[index]);
    });
  }

  _addCart(int index) {
    setState(() {
      cart.add(image[index]);
    });
    print(cart.length);
  }

  Widget Icon1(int index, BuildContext context) {
    return InkWell(
        child: Icon(Icons.favorite, color: Colors.yellowAccent),
        onTap: () {
          Scaffold.of(context)
              .showSnackBar(SnackBar(content: Text("added to favourites")));
          _addFav(index);
        });
  }

  Widget Icon2(int index, BuildContext context) {
    return InkWell(
        child: Icon(Icons.shopping_cart, color: Colors.yellowAccent),
        onTap: () {
          Scaffold.of(context)
              .showSnackBar(SnackBar(content: Text("added in cart")));
          _addCart(index);
        });
  }

  Widget Drawer1() {
    return Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountEmail: Text('rajutkarshai@gmail.com'),
            accountName: Text("Utkarsh Raj"),
            currentAccountPicture: GestureDetector(
              child: CircleAvatar(
                backgroundColor: Colors.white70,
                child: Icon(
                  Icons.people,
                  size: 50.0,
                ),
              ),
            ),
            decoration: BoxDecoration(color: Colors.green),
          ),
          ListTile(
            title: Text("Home Page"),
            leading: Icon(
              Icons.home,
              color: Colors.blue,
            ),
            onTap: null,
          ),
          ListTile(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => Favourites(fav),
              ),
            ),
            leading: Icon(
              Icons.favorite,
              color: Colors.blue,
            ),
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: Colors.yellow,
            ),
            title: Text("Favourites"),
          ),
          ListTile(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => Cart(cart),
              ),
            ),
            leading: Icon(
              Icons.shopping_cart,
              color: Colors.blue,
            ),
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: Colors.yellow,
            ),
            title: Text("Cart"),
          ),
          ListTile(
            title: Text(
              "Profile",
            ),
            leading: Icon(Icons.people, color: Colors.blue),
          ),
          Divider(),
          ListTile(
            title: Text("Settings"),
            leading: Icon(
              Icons.settings,
              color: Colors.grey,
            ),
          ),
          ListTile(
            title: Text("My Orders"),
            leading: Icon(
              Icons.business_center,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}

// onPressed: ()=> Navigator.push(context, MaterialPageRoute(builder: (_)=>Favourites(fav), ),),
