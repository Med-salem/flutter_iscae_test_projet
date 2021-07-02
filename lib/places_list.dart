import 'package:flutter/material.dart';
import 'data/result.dart';

class PlacesList extends StatelessWidget {
  const PlacesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final places = ModalRoute.of(context)!.settings.arguments as Result;

    return ListView.builder(
      //itemCount: places.length,
      itemBuilder: (context, index) {
        return ListTile(
          // leading: Image.network(places.photos.toString()),
          title: Text(places.name),
          subtitle: Text(places.geometry.toString()),
        );
      },
    );
  }
}
