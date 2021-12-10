import 'package:flutter/material.dart';

class PhotoImage extends StatelessWidget {
  const PhotoImage({
    required this.imageUrl,
    this.placeholderAsset,
    required this.aspectRatio,
    Key? key,
  }) : super(key: key);

  final String imageUrl;
  final String? placeholderAsset;
  final double aspectRatio;

  @override
  Widget build(BuildContext context) => AspectRatio(
        aspectRatio: aspectRatio,

        child: Image.network(imageUrl), //todo better photo
        // child: FadeInImage.assetNetwork(
        //   // placeholder: placeholderAsset,
        //   // placeholderErrorBuilder: (context, _, __) => Image.asset(placeholderAsset),
        //   // imageErrorBuilder: (context, _, __) => Image.asset(placeholderAsset),
        //   image: imageUrl,
        //   fit: BoxFit.fitHeight,
        // ),
      );
}
