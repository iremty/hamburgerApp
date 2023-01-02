import 'package:flutter/material.dart';

import 'burger_page.dart';
import 'categories.dart';
import 'hamburger_list.dart';
import 'header.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        cardColor: Colors.deepOrangeAccent,
        appBarTheme: AppBarTheme(
          color: Colors.deepOrangeAccent,
          centerTitle: true,
        ),
        floatingActionButtonTheme:
            FloatingActionButtonThemeData(backgroundColor: Colors.brown),
        bottomAppBarColor: Colors.deepOrangeAccent,
      ),
      home: Burger(),
      routes: {BurgerPage.tag: (_) => BurgerPage()},
      debugShowCheckedModeBanner: false,
    );
  }
}

class Burger extends StatefulWidget {
  @override
  State<Burger> createState() => _BurgerState();
}

class _BurgerState extends State<Burger> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            title: Text("Deviver Me"),
            leading: IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {},
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.shopping_cart),
              ),
            ],
          ),
          Header(),
          Categories(),
          HamburgerList(
            row: 1,
          ),
          HamburgerList(
            row: 2,
          ),
        ],
      ),
      extendBody: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.home),
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(45),
        ),
        child: BottomAppBar(
          shape: CircularNotchedRectangle(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () {},
                color: Colors.white,
                icon: Icon(Icons.add_alert),
              ),
              IconButton(
                onPressed: () {},
                color: Colors.white,
                icon: Icon(Icons.turned_in),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
