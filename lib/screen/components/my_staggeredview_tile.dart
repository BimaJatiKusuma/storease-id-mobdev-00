import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyStaggeredviewTile extends StatelessWidget {

  final String asset;

  MyStaggeredviewTile({required this.asset, super.key});


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      onTap: (){},
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.network(asset, fit: BoxFit.fitWidth,)
      ),
    );
  }
  
}