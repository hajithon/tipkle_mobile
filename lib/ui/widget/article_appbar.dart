import 'package:flutter/material.dart';

class ArticleAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(170.0);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20.0),
          bottomRight: Radius.circular(20.0),
        ),
      ),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "좌 상단",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  Text(
                    "우 상단",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Text(
                "중앙",
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
            ),
            Container(
              height: 50,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Container(
                    width: 100,
                    color: Colors.red,
                    child: Center(child: Text("태그 리스트1")),
                  ),
                  Container(
                    width: 100,
                    color: Colors.orange,
                    child: Center(child: Text("태그 리스트2")),
                  ),
                  Container(
                    width: 100,
                    color: Colors.yellow,
                    child: Center(child: Text("태그 리스트3")),
                  ),
                  Container(
                    width: 100,
                    color: Colors.green,
                    child: Center(child: Text("태그 리스트4")),
                  ),
                  Container(
                    width: 100,
                    color: Colors.blue,
                    child: Center(child: Text("태그 리스트5")),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
