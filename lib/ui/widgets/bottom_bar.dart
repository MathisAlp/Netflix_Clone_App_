import 'package:flutter/material.dart';

class BottomAppBar extends StatefulWidget {
  BottomAppBar({Key? key}) : super(key: key);

  @override
  State<BottomAppBar> createState() => _BottomAppBarState();
}

class _BottomAppBarState extends State<BottomAppBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:BottomNavigationBar(
      backgroundColor:Colors.black87,
      selectedItemColor: Colors.white,
      type:BottomNavigationBarType.fixed,
      items:[
        BottomNavigationBarItem(
          icon:new Icon(Icons.home),
          label: 'Home'
        ),
        BottomNavigationBarItem(
          icon: new Icon(Icons.search),
          label:'Search',
        ),
        BottomNavigationBarItem(
          icon:Image.asset('assets/icons/coming.png',scale:22.0,color:Colors.white),
          label:'Comming Soon'
        ),
        BottomNavigationBarItem(
          icon:Image.asset('assets/icons/search.png',scale:22.0,color:Colors.white),
          label:'Download'
        ),
        BottomNavigationBarItem(
          icon:Image.asset('assets/icons/more.png',scale:22.0,color:Colors.white),
          label:'More'
        ),
      ],
      ),
    );
  }
}