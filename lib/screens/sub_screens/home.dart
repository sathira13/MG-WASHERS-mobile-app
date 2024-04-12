import 'package:car_wash/components/custom_app_bar.dart';
import 'package:car_wash/components/custom_text_heading.dart';
import 'package:car_wash/components/icon_input_box.dart';
import 'package:car_wash/components/input_box.dart';
import 'package:car_wash/components/offer_card.dart';
import 'package:car_wash/components/service_card.dart';
import 'package:car_wash/data/services_data.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  final bool isHome;
  final VoidCallback onSeeAllServices;

  const Home({super.key, required this.isHome, required this.onSeeAllServices});

  @override
  Widget build(BuildContext context) {
    ServicesData services = ServicesData();

    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      // appBar: CustomAppBar(true, "MG Washers"),
      backgroundColor: Color(0xFFf6f4e1),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppBar(isHome: true, title: "MG Washers", isBooking: false,),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
              child: IconInputBox(),
            ),
            SizedBox(
              height: screenSize.height * 0.02,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: CustomTextHeading(text: "Special Offers"),
            ),
            SizedBox(
              height: screenSize.height * 0.02,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    OfferCard(image: "images/service1.jpg"),
                    SizedBox(
                      width: screenSize.width * 0.02,
                    ),
                    OfferCard(image: "images/service2.jpg"),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: screenSize.height * 0.02,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: CustomTextHeading(
                text: "Location",
              ),
            ),
            SizedBox(
              height: screenSize.height * 0.02,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1),
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    image: DecorationImage(
                        image: AssetImage("images/map.png"),
                        fit: BoxFit.cover)),
                width: double.infinity,
                height: 150,
              ),
            ),
            SizedBox(
              height: screenSize.height * 0.02,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CustomTextHeading(text: "Wash Services"),
                  TextButton(
                      onPressed: onSeeAllServices,
                      child: const Text(
                        "See All",
                        style: TextStyle(color: Colors.black),
                      ))
                ],
              ),
            ),
            SizedBox(
              height: screenSize.height * 0.02,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: Container(
                height: 150,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: services.services.length - 1,
                    itemBuilder: (context, index) {
                      return (Row(
                        children: [
                          ServiceCard(
                            image: services.services[index].image!,
                          ),
                          SizedBox(
                            width: screenSize.width * 0.02,
                          )
                        ],
                      ));
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
