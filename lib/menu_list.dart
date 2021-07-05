import 'package:flutter/material.dart';
import 'package:our_pharmacies/data/result.dart';

class MenuList extends StatelessWidget {
  final List<Result> result;
  MenuList({required this.result});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
          child: Text(
            '',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
        ),
        ListTile(
          leading: Icon(Icons.local_pharmacy),
          title: Text('Nrearby Pharmacy List'),
          // TODO: send places to fonction de trie
          onTap: () =>
              Navigator.pushNamed(context, '/PlaceList', arguments: result),
        ),
        ListTile(
          leading: Icon(Icons.settings),
          title: Text('Settings'),
        ),
      ],
    );
  }
}
