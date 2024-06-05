import 'package:flutter/cupertino.dart';
import 'package:storease_mobileapp_dev/components/my_starrating.dart';

class VendorDetailProdukReviewTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Container(
            height: 50,
            width: 50,
            child: Image.asset("images/account_circle_blue.png"),
          ),
          SizedBox(width: 10,),
          Expanded(
              child: Column(
            children: [
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("adfkjsf", style: TextStyle(fontWeight: FontWeight.bold),),
                        StarRating(rating: 4),
                      ],
                    ),
                    Container(
                      child: Text("dd/mm/yyyy"),
                    )
                  ],
                ),
              ),
              Text(
                  "Ini adalah text panjang dari review dan ini adalah pendapat customer")
            ],
          )),
        ],
      ),
    );
  }
}
