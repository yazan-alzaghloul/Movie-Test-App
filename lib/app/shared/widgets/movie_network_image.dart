import 'package:flutter/material.dart';

class MovieNetworkImage extends StatelessWidget {
  final String imageUrl;
  final Widget placeHolder;
  final double? height;
  final double? width;

  const MovieNetworkImage(
      {Key? key,
        required this.imageUrl,
        this.height = double.infinity,
        this.width = double.infinity,
        this.placeHolder = const Icon(Icons.terrain_outlined)})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      imageUrl,
      fit: BoxFit.fill,
      height: height,
      width: width,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return child;
        return Center(
          child: CircularProgressIndicator(
            strokeWidth: 1,
            value: loadingProgress.expectedTotalBytes != null
                ? loadingProgress.cumulativeBytesLoaded /
                loadingProgress.expectedTotalBytes!
                : null,
          ),
        );
      },
      errorBuilder: (context, error, stackTrace) {
        return Container(
            height: height, width: width, child: Center(child: placeHolder));
      },
    );
  }
}
