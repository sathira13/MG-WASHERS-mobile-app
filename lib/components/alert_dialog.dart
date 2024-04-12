import 'package:flutter/material.dart';

class CustomAlertDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }

  Widget dialogContent(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(17),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10.0,
            offset: const Offset(0.0, 10.0),
          ),
        ],
      ),
      child: Column(
        mainAxisSize:
            MainAxisSize.min, 
        children: <Widget>[
          SizedBox(height: 24),
          Text(
            'Congratulations',
            style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w700),
          ),
          SizedBox(height: 8),
          Text(
            'Your Booking Confirmed Successfully',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
                color: Color(0xffd8a656)),
          ),
          SizedBox(height: 24),
          Image.asset('images/car.png'),
          Align(
            alignment: Alignment.bottomRight,
            child: TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // To close the dialog
              },
              child: Icon(Icons.close),
            ),
          ),
        ],
      ),
    );
  }
}
