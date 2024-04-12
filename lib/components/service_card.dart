import 'package:flutter/material.dart';

class ServiceCard extends StatelessWidget {
  final bool? width;
  final String? subTitle;
  final String image;
  final bool? height;
  const ServiceCard(
      {super.key, this.width, this.subTitle, required this.image, this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover)),
      width: width == true ? double.infinity : 150,
      height: height == true ? 125 : 150,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(""),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              subTitle != null ? subTitle! : "",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 22),
            ),
          )
        ],
      ),
    );
  }
}
