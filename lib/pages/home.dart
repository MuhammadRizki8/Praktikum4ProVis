import 'package:flutter/material.dart';
import 'package:flutter_masonry_view/flutter_masonry_view.dart';
import 'package:profile_app/widgets/CardProfile.dart';
import '../models/photo.dart';
import '../services/photo_service.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final PhotoService _photoService = PhotoService();
  List<Photo> _photos = [];
  bool _isLoading = true;
  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    try {
      _photos = await _photoService.fetchPhotos();
      setState(() {
        _isLoading = false;
      });
    } catch (e) {
      print("error");
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 231, 154, 218),
        title: const Text('Gallery'),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: MasonryView(
                  listOfItem: _photos,
                  numberOfColumn: 2,
                  itemBuilder: (item) {
                    return CardProfile(item: item);
                  },
                ),
              ),
            ),
    );
  }
}
