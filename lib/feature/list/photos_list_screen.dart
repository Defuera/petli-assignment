import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petli_assignment/feature/common/model/photo_display_model.dart';
import 'package:petli_assignment/feature/common/ui/error_widget.dart';
import 'package:petli_assignment/feature/common/ui/like_button.dart';
import 'package:petli_assignment/feature/common/ui/photo_image.dart';
import 'package:petli_assignment/feature/detailed/photo_detailed_screen.dart';
import 'package:petli_assignment/feature/list/photos_list_bloc.dart';

class PhotosListScreen extends StatelessWidget {
  const PhotosListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('All those photos!'),
        ),
        body: BlocProvider<PhotosListBloc>(
          create: (context) => PhotosListBloc()..init(),
          child: BlocBuilder<PhotosListBloc, PhotosListState>(
            builder: (context, state) => state.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error) => AppErrorWidget(
                error,
                onRetry: context.read<PhotosListBloc>().retry,
              ),
              data: _PhotosListDetails.new,
            ),
          ),
        ),
      );
}

class _PhotosListDetails extends StatelessWidget {
  const _PhotosListDetails(this.photos, {Key? key}) : super(key: key);

  final List<PhotoDisplayModel> photos;

  @override
  Widget build(BuildContext context) => ListView.builder(
        itemCount: photos.length,
        itemBuilder: (context, index) => _PhotoListItem(photos[index]),
      );
}

class _PhotoListItem extends StatelessWidget {
  const _PhotoListItem(this.photoModel, {Key? key}) : super(key: key);
  final PhotoDisplayModel photoModel;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          onTap: () {
            showModalBottomSheet<dynamic>(
              context: context,
              builder: (context) => PhotoDetailedScreen(model: photoModel),
              isScrollControlled: true,
            );
          },
          child: Card(
            clipBehavior: Clip.hardEdge,
            child: Row(
              children: [
                PhotoImage(imageUrl: photoModel.thumbnailUrl, size: 150),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          photoModel.title,
                          style: Theme.of(context).textTheme.headline5?.copyWith(fontSize: 18),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: LikeButton(
                          isLiked: photoModel.isLiked,
                          onPressed: () => context.read<PhotosListBloc>().like(
                                photoModel.id,
                                isLiked: !photoModel.isLiked,
                              ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
