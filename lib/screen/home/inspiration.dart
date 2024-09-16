import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shimmer/shimmer.dart';

class Inspiration extends StatefulWidget {
  Inspiration({super.key});

  @override
  State<StatefulWidget> createState() {
    return _InspirationState();
  }
}

class _InspirationState extends State<Inspiration> {
  List<String> imageLink = [
    "https://picsum.photos/id/237/200/300",
    "https://dummyimage.com/640x4:3/",
    "https://picsum.photos/id/237/200/300",
    "https://dummyimage.com/16:9x1080/",
    "https://picsum.photos/id/237/200/300",
    "https://dummyimage.com/640x4:3/",
    "https://picsum.photos/id/237/200/300",
    "https://picsum.photos/id/237/200/300",
    "https://picsum.photos/200/300",
    "https://dummyimage.com/16:9x1080/",
    "https://dummyimage.com/640x4:3/",
    "https://picsum.photos/id/237/200/300",
    "https://dummyimage.com/16:9x1080/",
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Container(
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.all(10),
                hintText: "Search Inspiration"
              ),
            ),
          ),
          actions: [
            ElevatedButton(onPressed: () {}, child: Text("Filters (0)"))
          ],
          automaticallyImplyLeading: false,
        ),
        body: ListView(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: StaggeredGrid.count(
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                crossAxisCount: 2,
                axisDirection: AxisDirection.down,
                children: imageLink.map((asset) => CachedNetworkImage(
                  imageUrl: asset,
                  placeholder: (context, url) => ShimmerSkeleton(width: 50, height: 250),
                  errorWidget: (context, url, error) {
                    print('Error loading image: $url');
                    return Icon(Icons.error);
                  },
                )).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ShimmerSkeleton extends StatelessWidget {
  const ShimmerSkeleton({super.key, this.height, this.width});
  final double? height, width;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        padding: EdgeInsets.all(8),
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.5),
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
      ),
    );
  }
}
