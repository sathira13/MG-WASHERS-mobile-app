import 'package:car_wash/models/service.dart';

class ServicesData {
  List<Service> services = [
    Service(
        image: "images/service1.jpg",
        subTitle: "Regular Car Wash",
        description:
            "A regular car wash typically involves a thorough cleaning of a vehicle's exterior. This process can be done either manually with hand tools and cleaning products or through an automated system found at a car wash facility",
        time: 30,
        price: 2500,
        services: ["Car detailing", "Drying"]),
    Service(
        image: "images/service2.jpg",
        subTitle: "Engine Steam Cleaning",
        description:
            "Engine steam cleaning is a detailed cleaning method used for the engine compartment of a vehicle. In this process, steam is used as the primary cleaning agent to remove dirt, grease, and grime from the engine and its components",
        time: 60,
        price: 3500,
        services: ["Degreasing", "Steam Cleaning", " Detailing and Brushing"]),
    Service(
        image: "images/service3.jpg",
        subTitle: "Interior Cleaning",
        description:
            "Vehicle interior cleaning is a comprehensive service aimed at thoroughly cleansing the inside of a car, truck, or any other type of vehicle. This process involves a series of steps designed to remove dirt, dust, stains, and grime from every part of the vehicle's interior, ensuring a clean, sanitized, and fresh environment",
        time: 90,
        price: 6000,
        services: [
          "Vacuuming",
          "Dashboard and Console Cleaning",
          "Air Vent Cleaning"
        ]),
    Service(
        image: "images/service4.jpg",
        subTitle: "Waxing & Polishing",
        description:
            "Waxing and polishing are two essential steps in maintaining a vehicle's exterior, each serving a specific purpose in the detailing process to enhance and protect the paintwork.",
        time: 120,
        price: 5000,
        services: ["Polishing", "Waxing"]),
  ];
}
