import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:panorama_viewer/panorama_viewer.dart';
import 'package:storease_mobileapp_dev/color/color.dart';

class VRDisplay extends StatefulWidget{
  String title;
  VRDisplay({required this.title, super.key});
  
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
        title: Text(widget.title),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.fullscreen))
        ],
        centerTitle: true,
      ),
      body: Center(
        child:
        // Panorama
        PanoramaViewer(
          animSpeed: 1,
          sensorControl: SensorControl.orientation,
          child: Image.asset("images/image360.jpg"),
        ),
      ),
    );
  }
}