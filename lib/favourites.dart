import 'package:flutter/material.dart';
import 'package:sidebar_widget/sidebar_widget.dart';

class Favourites extends StatelessWidget {
  const Favourites({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //add this line to call draw menu direct
      drawer: NavigationDrawer(),
      appBar: AppBar(
        title: Text('Favourites'),
        backgroundColor: Colors.green,
      ),
    );
  }
}
