import 'package:flutter/material.dart';

class neww extends StatelessWidget {
  const neww({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Text('Name'),
            ],
          ),
          Row(
            children: <Widget>[
              Text('Gem code'),
            ],
          ),
        ],
      ),
    );
  }
}
