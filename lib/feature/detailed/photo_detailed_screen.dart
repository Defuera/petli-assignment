import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petli_assignment/feature/common/model/photo_display_model.dart';
import 'package:petli_assignment/feature/common/ui/like_button.dart';
import 'package:petli_assignment/feature/common/ui/photo_image.dart';
import 'package:petli_assignment/feature/detailed/photo_detailed_bloc.dart';

class PhotoDetailedScreen extends StatelessWidget {
  const PhotoDetailedScreen({required this.model, Key? key}) : super(key: key);

  final PhotoDisplayModel model;

  @override
  Widget build(BuildContext context) => Material(
        color: Colors.transparent,
        child: BlocProvider<PhotoDetailedBloc>(
          create: (context) => PhotoDetailedBloc(model),
          child: BlocBuilder<PhotoDetailedBloc, PhotoDetailedState>(
            builder: (context, state) => _PhotoData(state.photoModel),
          ),
        ),
      );
}

class _PhotoData extends StatelessWidget {
  const _PhotoData(this.photo, {Key? key}) : super(key: key);

  final PhotoDisplayModel photo;

  @override
  Widget build(BuildContext context) => Container(
        color: Theme.of(context).backgroundColor,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            PhotoImage(
              imageUrl: photo.url,
              size: MediaQuery.of(context).size.width,
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                photo.title,
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
            const SizedBox(height: 24),
            LikeButton(
              isLiked: photo.isLiked,
              size: 120,
              onPressed: () => context.read<PhotoDetailedBloc>().like(photo.id, isLiked: !photo.isLiked),
            ),
          ],
        ),
      );
}
