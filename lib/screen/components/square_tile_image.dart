import 'package:flutter/material.dart';

class SquareTileImage extends StatelessWidget{
  final String imagePath;
  const SquareTileImage({
    super.key,
    required this.imagePath
  });

  @override
  Widget build(BuildContext context){
    return Container(
      padding: EdgeInsets.all(20),
      child: Image.asset(imagePath, height: 102,),
    );
  }
}