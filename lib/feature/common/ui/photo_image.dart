import 'package:flutter/material.dart';

class PhotoImage extends StatelessWidget {
  const PhotoImage({
    required this.imageUrl,
    this.placeholderAsset,
    Key? key,
  }) : super(key: key);

  final String imageUrl;
  final String? placeholderAsset;

  @override
  Widget build(BuildContext context) => Image.network(imageUrl);
}
