import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar extends StatelessWidget {
  final bool isHome;
  final String title;
  final bool isBooking;
  const CustomAppBar(
      {super.key,
      required this.isHome,
      required this.title,
      required this.isBooking});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(color: Color(0xffdededa), width: 1.5),
              left: BorderSide(color: Color(0xffdededa), width: 1.5),
              right: BorderSide(color: Color(0xffdededa), width: 1.5)),
          color: Colors.white,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20))),
      child: Column(
        mainAxisAlignment:
            isHome != true ? MainAxisAlignment.center : MainAxisAlignment.start,
        children: [
          isHome
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "mgwashers@gmail.com",
                        style: TextStyle(fontSize: 15, color: Colors.grey),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "+94 72 080 6890",
                        style: TextStyle(fontSize: 15,color: Colors.grey),
                      ),
                    )
                  ],
                )
              : Container(),
          Container(
            padding: isHome ? EdgeInsets.only(top: 8) : EdgeInsets.all(0),
            child: Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceBetween, // Space between the items
              children: [
                isBooking
                    ? Align(
                        alignment: Alignment.topLeft,
                        child: GestureDetector(
                            onTap: ()=> context.go("/home"),
                            child: Container(
                              margin: EdgeInsets.only(left: 10),
                              child: Image.asset("images/arrow.png", width: 30,)) ),
                      )
                    : SizedBox(),
                Expanded(
                  // Expanded to center the text widget
                  child: Text(
                    title,
                    textAlign: TextAlign.center, // Center the text
                    style: TextStyle(
                        shadows: [
                          Shadow(
                            color:
                                Colors.grey, // Choose the color of the shadow
                            blurRadius:
                                2.0, // Adjust the blur radius for the shadow effect
                            offset: Offset(0.5,
                                2.0), // Set the horizontal and vertical offset for the shadow
                          ),
                        ],
                        color: Color(0xffd8a656),
                        fontWeight: FontWeight.bold,
                        fontSize: 25),
                  ),
                ),
                Opacity(
                  // Invisible icon to balance the row
                  opacity: 0.0,
                  child: Icon(Icons.arrow_back),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
