import 'package:car_wash/components/booking_card.dart';
import 'package:car_wash/components/car_background.dart';
import 'package:car_wash/components/custom_app_bar.dart';
import 'package:car_wash/models/book.dart';
import 'package:car_wash/services/AuthService.dart';
import 'package:car_wash/services/BookingService.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Bookings extends StatefulWidget {
  const Bookings({super.key});

  @override
  State<Bookings> createState() => _BookingsState();
}

class _BookingsState extends State<Bookings> {
  BookingService bookingService = new BookingService();
  AuthService authService = new AuthService();
  late Future<List<Book>> bookings;

  void cancelBooking(String bookingId) async {
    _fetchBookings();
    DatabaseReference ref = FirebaseDatabase.instance
        .ref("bookings/${authService.getCurrentUser()!.uid}");

    DatabaseEvent event = await ref.once();

    Map bookingsData = event.snapshot.value as Map;

    bookingsData.forEach((key, value) => {
          if (value['id'] == bookingId)
            {
              ref.update({"${key}/status": false})
            }
        });

    _fetchBookings();
  }

  void _fetchBookings() {
    setState(() {
      bookings = bookingService.getCurrentUserBookings();
    });
  }

  @override
  void initState() {
    super.initState();
    _fetchBookings();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return SafeArea(
        child: Scaffold(
      backgroundColor: Color(0xFFf6f4e1),
      body: Column(
        children: [
          CustomAppBar(isHome: false, title: "Bookings", isBooking: false),
          Expanded(
            child: FutureBuilder<List<Book>>(
              future: bookings,
              builder:
                  (BuildContext context, AsyncSnapshot<List<Book>> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else if (snapshot.data!.isEmpty) {
                  return Text('No bookings found');
                } else {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        Book book = snapshot.data![index];
                        return BookingCard(
                          title: book.title!,
                          time: book.requiredTime!,
                          date: book.date!,
                          price: book.price!.toDouble(),
                          image: book.image!,
                          status: book.status!,
                          onCancel: () {
                            cancelBooking(book.id!);
                          },
                        );
                      },
                    ),
                  );
                }
              },
            ),
          )
        ],
      ),
    ));
  }
}
