import 'package:flutter/material.dart';

class OfferCard extends StatelessWidget {
  final String image;
  const OfferCard({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover
        )
      ),
      width: 300,
      height: 120,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 120,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(5))
              ),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text("Limited time", textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold),),
              )),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Get Special Offer 40% off",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
          )
        ],
      ),
    );
  }
}