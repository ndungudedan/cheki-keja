import 'package:cached_network_image/cached_network_image.dart';
import 'package:cheki_keja/connection/networkApi.dart';
import 'package:cheki_keja/models/apartment.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class PhotoViewer extends StatefulWidget {
  PhotoViewer({
    Key key,
    this.loadingBuilder,
    this.backgroundDecoration,
    this.minScale,
    this.maxScale,
    this.initialIndex,
    this.scrollDirection = Axis.horizontal,
    @required this.picList,@required this.apartment,
  }) : pageController = PageController(initialPage: initialIndex);

List<Images> picList = [];
  MyApartment apartment;
  final LoadingBuilder loadingBuilder;
  final Decoration backgroundDecoration;
  final dynamic minScale;
  final dynamic maxScale;
  final int initialIndex;
  final PageController pageController;
  final Axis scrollDirection;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<PhotoViewer> {
  List<Images> picList = [];
  var picIndex = 0;
  MyApartment apartment;
  int currentIndex;

  @override
  void initState() {
    picList = widget.picList;
    apartment = widget.apartment;
    currentIndex = widget.initialIndex;
    super.initState();
  }
void onPageChanged(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
    child: PhotoViewGallery.builder(
      scrollPhysics: const BouncingScrollPhysics(),
      builder: (BuildContext context, int index) {
        return PhotoViewGalleryPageOptions(
          imageProvider: CachedNetworkImageProvider(constants.path +
                                      apartment.ownerid +
                                      constants.folder +widget.picList[index].image),
          initialScale: PhotoViewComputedScale.contained * 0.8,
          heroAttributes: PhotoViewHeroAttributes(tag: currentIndex),
        );
      },
      itemCount: picList.length,
      loadingBuilder: (context, event) => Center(
        child: Container(
          width: 20.0,
          height: 20.0,
          child: CircularProgressIndicator(
            value: event == null
                ? 0
                : event.cumulativeBytesLoaded / event.expectedTotalBytes,
          ),
        ),
      ),
      backgroundDecoration: widget.backgroundDecoration,
      pageController: widget.pageController,
      onPageChanged: onPageChanged,
    )
  );
  }
}
