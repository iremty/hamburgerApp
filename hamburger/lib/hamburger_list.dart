import 'package:flutter/material.dart';
import 'package:hamburger/burger_page.dart';

class HamburgerList extends StatefulWidget {
  final int row;
  HamburgerList({required this.row});

  @override
  State<HamburgerList> createState() => _HamburgerListState();
}

class _HamburgerListState extends State<HamburgerList> {
  @override
  Widget build(BuildContext context) {
    int items = 10;
    Widget baconImage = Container(
      height: 120,
      child: Image.asset("images/ha.jpg"),
    );
    Widget chickenImage = Container(
      height: 120,
      child: Image.asset("images/hams.jpg"),
    );
    return SliverToBoxAdapter(
      child: Container(
        height: widget.row == 2 ? 330 : 240,
        margin: EdgeInsets.only(top: 10),
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: items,
            itemBuilder: (context, index) {
              bool reverse = widget.row == 2 ? index.isEven : index.isOdd;
              return Stack(
                children: [
                  Container(
                    height: 240,
                    width: 200,
                    margin: EdgeInsets.only(
                        left: 20, right: index == items ? 20 : 0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed(BurgerPage.tag);
                      },
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Column(
                            children: [
                              Text(
                                reverse ? " Chicken Burger" : "Bacon Burger",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              Spacer(),
                              Row(
                                children: [
                                  Text(
                                    "15.95 \$ CAN",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Spacer(),
                                  Container(
                                    width: 50,
                                    height: 50,
                                    child: Card(
                                        color: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Icon(Icons.add)),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        elevation: 3,
                        margin: EdgeInsets.all(10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(45),
                            bottomRight: Radius.circular(15),
                            topLeft: Radius.circular(45),
                            topRight: Radius.circular(45),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: reverse ? 60 : 60,
                    child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed(BurgerPage.tag);
                        },
                        child: reverse ? chickenImage : baconImage),
                  )
                ],
              );
            }),
      ),
    );
  }
}
