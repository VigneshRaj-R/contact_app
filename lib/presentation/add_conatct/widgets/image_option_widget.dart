import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ViewOrSelectImage extends StatelessWidget {
  const ViewOrSelectImage({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Select Option'),
      content: Text("Do you want to view or select photo?"),
      actions: [
        TextButton(onPressed: () {}, child: Text("View")),
        TextButton(onPressed: () {}, child: Text("Select"))
      ],
    );
  }
}
