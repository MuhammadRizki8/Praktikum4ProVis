class Photo {
  final String id;
  final String author;
  final String url;
  final String downloadUrl;
  final int width;
  final int height;

  Photo(
      {required this.id,
      required this.author,
      required this.url,
      required this.downloadUrl,
      required this.width,
      required this.height});

  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
      id: json["id"],
      url: json["url"],
      downloadUrl: json["download_url"],
      author: json["author"],
      width: json["width"],
      height: json["height"],
    );
  }
}
