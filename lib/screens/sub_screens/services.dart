import 'package:car_wash/components/custom_app_bar.dart';
import 'package:car_wash/components/service_card.dart';
import 'package:car_wash/data/services_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

class Services extends StatelessWidget {
  const Services({super.key});

  @override
  Widget build(BuildContext context) {
    ServicesData servicesData = ServicesData();
    Size screenSize = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFf6f4e1),
        body: servicesData.services != null
            ? SingleChildScrollView(
                // Wrapped in a SingleChildScrollView
                child: Column(
                  children: [
                    CustomAppBar(
                      isHome: false,
                      title: "Wash Services",
                      isBooking: false,
                    ),
                    SizedBox(
                      height: screenSize.height * 0.02,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: servicesData.services
                          .map((service) => Padding(
                                padding: const EdgeInsets.only(
                                    left: 20.0, right: 20.0, bottom: 15),
                                child: (Column(
                                  children: [
                                    GestureDetector(
                                      onTap: () => context.go("/make-booking",
                                          extra: service),
                                      child: ServiceCard(
                                        image: service.image!,
                                        width: true,
                                        height: true,
                                        subTitle: service.subTitle!,
                                      ),
                                    ),
                                  ],
                                )),
                              ))
                          .toList(),
                    ),
                  ],
                ),
              )
            : Container(),
      ),
    );
  }
}
