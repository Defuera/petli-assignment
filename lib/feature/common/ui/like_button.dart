import 'package:flutter/material.dart';

class LikeButton extends StatelessWidget {
  const LikeButton({
    required this.isLiked,
    required this.onPressed,
    this.size,
    Key? key,
  }) : super(key: key);

  final bool isLiked;
  final VoidCallback onPressed;
  final double? size;

  @override
  Widget build(BuildContext context) => IconButton(
        iconSize: size ?? 24.0,
        onPressed: onPressed,
        icon: AnimatedCrossFade(
          crossFadeState: isLiked ? CrossFadeState.showFirst : CrossFadeState.showSecond,
          duration: const Duration(milliseconds: 200), //magic number 😱
          firstChild: const Icon(
            Icons.favorite,
            color: Colors.redAccent,
          ),
          secondChild: const Icon(
            Icons.favorite_border,
            color: Colors.redAccent,
          ),
        ),
      );
}
