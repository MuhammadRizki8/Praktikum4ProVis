import 'package:flutter/material.dart';

class CardProfile extends StatelessWidget {
  const CardProfile({
    Key? key,
    required this.item,
  }) : super(key: key);

  final Map<String, String> item;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 240, 205, 234),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            item['image']!,
            // loadingBuilder: (BuildContext context, Widget child,
            //     ImageChunkEvent? loadingProgress) {
            //   if (loadingProgress == null) {
            //     return child;
            //   } else {
            //     return Center(
            //       child: CircularProgressIndicator(
            //         value: loadingProgress.expectedTotalBytes != null
            //             ? loadingProgress.cumulativeBytesLoaded /
            //                 loadingProgress.expectedTotalBytes!
            //             : null,
            //       ),
            //     );
            //   }
            // },
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 8),
          Padding(
            padding: EdgeInsets.only(left: 8, top: 2, right: 2, bottom: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item['title']!,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 4),
                Text(
                  item['description']!,
                  style: TextStyle(fontSize: 14),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
