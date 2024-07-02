import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:panorama_viewer/panorama_viewer.dart';

class VRDisplay extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _VRDisplayState();
  }

}

class _VRDisplayState extends State<VRDisplay> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Venue - Cliff-Edge Cabana di Alila Villas Uluwatu Details"),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.fullscreen))
        ],
        centerTitle: true,
      ),
      body: Center(
        child: PanoramaViewer(
          child: Image.asset("images/image360.jpg"),
        ),
      ),
    );
  }
}