import 'package:flutter/material.dart';
import 'package:flutter_masonry_view/flutter_masonry_view.dart';
import 'package:profile_app/widgets/CardProfile.dart';
import 'package:profile_app/widgets/DialogFloatingActionButton.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Map<String, String>> _items = [
    {
      'image': 'https://source.unsplash.com/random/15',
      'title': 'Judul Nyoba 1',
      'description': 'Deskripsi Nyoba 1'
    },
    {
      'image': 'https://source.unsplash.com/random/17',
      'title': 'Judul Nyoba 2',
      'description': 'Deskripsi Nyoba 2'
    },
    {
      'image': 'https://source.unsplash.com/random/13',
      'title': 'Judul Nyoba 3',
      'description': 'Deskripsi Nyoba 3'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 231, 154, 218),
        title: const Text('Gallery'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: MasonryView(
            listOfItem: _items,
            numberOfColumn: 2,
            itemBuilder: (item) {
              return CardProfile(item: item);
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return DialogFloatingActionButton();
            },
          ).then((value) {
            if (value != null) {
              setState(
                () {
                  _items.add(value);
                },
              );
            }
          });
        },
      ),
    );
  }
}
