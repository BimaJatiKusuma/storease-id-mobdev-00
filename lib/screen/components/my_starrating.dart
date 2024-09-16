import 'package:flutter/material.dart';

class StarRating extends StatelessWidget {
  final double rating;

  StarRating({required this.rating});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: buildStarIcons(rating),
    );
  }

  List<Widget> buildStarIcons(double rating) {
    List<Widget> stars = [];
    for (int i = 1; i <= 5; i++) {
      if (i <= rating) {
        stars.add(Icon(Icons.star, color: Colors.amber, size: 15,));
      } else if (i - rating <= 0.25) {
        stars.add(Icon(Icons.star_half, color: Colors.amber,  size: 15));
      } else if (i - rating <= 0.75) {
        stars.add(Icon(Icons.star_half, color: Colors.amber, size: 15));
      } else {
        stars.add(Icon(Icons.star_border, color: Colors.amber, size: 15));
      }
    }
    return stars;
  }
}