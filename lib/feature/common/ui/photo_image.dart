import 'package:flutter/material.dart';

const _placeholderUri = 'assets/images/placeholder.jpeg';

class PhotoImage extends StatelessWidget {
  const PhotoImage({
    required this.imageUrl,
    required this.size,
    Key? key,
  }) : super(key: key);

  final String imageUrl;
  final double size;

  @override
  Widget build(BuildContext context) => SizedBox(
    width: size,
    height: size,
    child: AspectRatio(
      aspectRatio: 1,
      child: FadeInImage.assetNetwork(
        placeholder: _placeholderUri,
        placeholderErrorBuilder: (context, _, __) => Image.asset(_placeholderUri),
        imageErrorBuilder: (context, _, __) => Image.asset(_placeholderUri),
        image: imageUrl,
        fit: BoxFit.fitHeight,
      ),
    ),
  );
}
