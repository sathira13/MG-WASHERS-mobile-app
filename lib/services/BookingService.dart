import 'package:car_wash/models/book.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

typedef BookingResponseCallback = void Function(bool success, String message);

class BookingService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User? getCurrentUser() {
    return _auth.currentUser;
  }

  void makeBooking(
      String uuid,
      String location,
      String make,
      String model,
      String yom,
      String license,
      String name,
      String phone,
      String requiredTime,
      double price,
      String image,
      String serviceName,
      String time,
      String date,
      BookingResponseCallback callback) async {
    try {
      DatabaseReference databaseReference = FirebaseDatabase.instance
          .ref()
          .child('bookings')
          .child(getCurrentUser()!.uid);

      DatabaseReference newBookingRef = databaseReference.push();

      await newBookingRef.set({
        "id": uuid,
        "location": location,
        "make": make,
        "model": model,
        "yom": yom,
        "license": license,
        "name": name,
        "phone": phone,
        "requiredTime": requiredTime,
        "price": price,
        "image": image,
        "time": time,
        "service": serviceName,
        "date": date,
        "status": true
      });

      callback(true, "Booking created successfully.");
    } catch (e) {
      callback(false, "Failed to create booking");
    }
  }

  Future<List<Book>> getCurrentUserBookings() async {
    final String uid = getCurrentUser()!.uid;
    List<Book> bookingsList = [];

    if (uid.isEmpty) {
      print('User not logged in');
      return bookingsList;
    }

    DatabaseReference bookingsRef =
        FirebaseDatabase.instance.ref('bookings/$uid');
    DatabaseEvent event = await bookingsRef.once();

    if (event.snapshot.exists) {
      Map<dynamic, dynamic> bookings =
          event.snapshot.value as Map<dynamic, dynamic>;
      bookings.forEach((key, value) {
        Book booking = Book.fromJson(Map<String, dynamic>.from(value));
        bookingsList.add(booking);
      });
    } else {
      print('No bookings found for current user');
    }
    return bookingsList;
  }
}
