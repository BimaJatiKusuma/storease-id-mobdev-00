import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:storease_mobileapp_dev/components/my_staggeredview_tile.dart';

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
            ElevatedButton(onPressed: (){}, child: Text("Filters (0)"))
          ],
          automaticallyImplyLeading: false,
        ),
        body: ListView(children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: StaggeredGrid.count(
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              crossAxisCount: 2,
              axisDirection: AxisDirection.down,
              children: [
                ...imageLink.map((asset) => MyStaggeredviewTile(asset: asset))
              ],
            ),
          ),
        
        
        ]),
      ),
    );
  }
}
