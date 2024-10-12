// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:storease_mobileapp_dev/color/color.dart';
// import 'package:storease_mobileapp_dev/screen/components/my_starrating.dart';
// import 'package:storease_mobileapp_dev/screen/package/packageDetail.dart';

// class MyContentPackageTile extends StatelessWidget {
//   const MyContentPackageTile({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.only(bottom: 20, right: 10, left: 10),
//       padding: EdgeInsets.only(bottom: 10 , top: 5, left: 5, right: 5),
//       height: 250,
//       decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(10),
//           color: Colors.white,
//           boxShadow: [
//             BoxShadow(
//                 color: Colors.grey, offset: Offset(0.0, 1.0), blurRadius: 6.0)
//           ]),
//       child: InkWell(
//         onTap: () {
//           Navigator.push(context, MaterialPageRoute(builder: (context){
//             return PackageDetail();
//           }));
//         },
//         child: Column(
//           children: [
//             Expanded(
//               child: Stack(
//                 children: [
//                   Container(
//                       child: Image.asset(
//                     "images/venue_image.png",
//                     height: double.infinity,
//                     fit: BoxFit.cover,
//                   )),
//                   Container(
//                     margin: EdgeInsets.only(left: 5, top: 5),
//                     padding: EdgeInsets.only(top:2, bottom: 2, right: 5, left: 5),
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.all(Radius.circular(5)),
//                         color: MyColor.color1),
//                     child: Text(
//                       "Bali",
//                       style: TextStyle(
//                           color: Colors.white,
//                           // decoration: TextDecoration.underline,
//                           fontWeight: FontWeight.w600),
//                     ),
//                   )
//                 ],
//               ),
//             ),
//             SizedBox(
//               height: 5,
//             ),
//             Container(
//               child: Text("The Amarylis Boutique Resort",style: TextStyle(fontWeight: FontWeight.bold),),
//             ),
//             SizedBox(
//               height: 5,
//             ),
//             Row(children: [
//               Expanded(
//                   child: Row(
//                 children: [
//                   StarRating(rating: 4.1),
//                   SizedBox(
//                     width: 5,
//                   ),
//                   Text(
//                     "4.1",
//                     style: TextStyle(fontSize: 12),
//                   ),
//                   Text(
//                     "(1235)",
//                     style: TextStyle(fontSize: 10),
//                   )
//                 ],
//               )),
//               GestureDetector(
//                 onTap: (){},
//                 child: Icon(Icons.map_outlined),
//               ),
//               SizedBox(width: 5,),
//               GestureDetector(
//                 onTap: (){},
//                 child: Icon(Icons.bookmark_border_outlined),
//               )
              
//               // IconButton(onPressed: () {}, icon: Icon(Icons.map_outlined)),
//               // IconButton(
//               //     onPressed: () {}, icon: Icon(Icons.bookmark_border_outlined)),
//             ])
//           ],
//         ),
//       ),
//     );
//   }
// }
