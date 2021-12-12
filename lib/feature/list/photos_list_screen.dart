import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petli_assignment/feature/common/model/photo_display_model.dart';
import 'package:petli_assignment/feature/common/ui/error_widget.dart';
import 'package:petli_assignment/feature/common/ui/photo_image.dart';
import 'package:petli_assignment/feature/list/photos_list_bloc.dart';

class PhotosListScreen extends StatelessWidget {
  const PhotosListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('All those photos!'),
        ),
        body: BlocProvider<ImagesListBloc>(
          create: (context) => ImagesListBloc()..init(),
          child: BlocBuilder<ImagesListBloc, ImagesListState>(
            builder: (context, state) => state.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error) => AppErrorWidget(
                error,
                onRetry: context.read<ImagesListBloc>().retry,
              ),
              data: _ImagesListDetails.new,
            ),
          ),
        ),
      );
}

class _ImagesListDetails extends StatelessWidget {
  const _ImagesListDetails(this.photos, {Key? key}) : super(key: key);

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
          // onTap: () {
          //   Navigator.of(context).push<void>(MaterialPageRoute(
          //     builder: (ctx) => ArtObjectScreen(objectId: artObject.objectNumber),
          //   ));
          // },
          child: Card(
            clipBehavior: Clip.hardEdge,
            child: Row(
              children: [
                PhotoImage(imageUrl: photoModel.thumbnailUrl),
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
                        child: IconButton(
                          onPressed: () => context.read<ImagesListBloc>().like(
                                photoModel.id,
                                isLiked: !photoModel.isLiked,
                              ),
                          icon: photoModel.isLiked ? const Icon(Icons.favorite) : const Icon(Icons.favorite_border),
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
