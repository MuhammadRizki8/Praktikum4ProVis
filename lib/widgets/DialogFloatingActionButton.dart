import 'package:flutter/material.dart';

class DialogFloatingActionButton extends StatelessWidget {
  DialogFloatingActionButton({Key? key}) : super(key: key);

  String _image = "";
  String _title = "";
  String _description = "";

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Add New Data'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            decoration: InputDecoration(labelText: 'Image'),
            onChanged: (value) {
              _image = value;
            },
          ),
          TextField(
            decoration: InputDecoration(labelText: 'title'),
            onChanged: (value) {
              _title = value;
            },
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Description'),
            onChanged: (value) {
              _description = value;
            },
          )
        ],
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop({
              'image': _image,
              'title': _title,
              'description': _description,
            });
          },
          child: Text('Add Data'),
        ),
      ],
    );
  }
}
