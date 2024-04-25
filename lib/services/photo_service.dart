import 'dart:convert';
import "package:http/http.dart" as http;
import "../models/photo.dart";

class PhotoService {
  static const String _baseUrl = "https://picsum.photos/v2/list";

  Future<List<Photo>> fetchPhotos() async {
    final response = await http.get(Uri.parse(_baseUrl));
    if (response.statusCode == 200) {
      return (json.decode(response.body) as List)
          .map((item) => Photo.fromJson(item))
          .toList();
    } else {
      throw Exception("gagal load foto");
    }
  }
}
