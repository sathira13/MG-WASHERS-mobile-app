import 'package:flutter/material.dart';

class BookingCard extends StatelessWidget {
  final String title;
  final String time;
  final String date;
  final double price;
  final String image;
  final VoidCallback onCancel;
  final bool status;
  const BookingCard(
      {super.key,
      required this.title,
      required this.time,
      required this.date,
      required this.price,
      required this.image,
      required this.onCancel,
      required this.status});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Image.asset(
              image, // Replace with actual image URL
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
            title: Container(
                decoration: const BoxDecoration(
                    color: Color(0xffe8cc9f),
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                child: const Text(
                  'Car washing Service',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                )),
            subtitle: Text(
              "${title}\n${time} mins",
              style: TextStyle(fontSize: 14),
            ),
            trailing: status == true
                ? ElevatedButton(
                    child: Text(
                      "Cancel",
                      style: TextStyle(fontSize: 12),
                    ),
                    onPressed: onCancel,
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        backgroundColor: const Color(0xFFe63939),
                        foregroundColor: Colors.white),
                  )
                : ElevatedButton(
                    child: Text(
                      "Cancelled",
                      style: TextStyle(fontSize: 12),
                    ),
                    onPressed: onCancel,
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        backgroundColor: Color.fromARGB(255, 73, 66, 66),
                        foregroundColor: Colors.white),
                  ),
          ),
          Divider(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("Order Date\n${date}"),
                Text('Total Payment\nRs. ${price.toStringAsFixed(2)}'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
