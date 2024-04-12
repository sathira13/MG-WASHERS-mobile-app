import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(100.0), // Here we set the height to 100
          child: AppBar(
            title: Padding(
              padding: const EdgeInsets.all(10.0), // Adjust padding as needed
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  // Email part
                  Row(
                    children: [
                      Icon(Icons.email, color: Colors.black),
                      SizedBox(width: 8.0),
                      Text(
                        'MGwashers@gmail.com',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.0,
                        ),
                      ),
                    ],
                  ),
                  // Phone part
                  Row(
                    children: [
                      Icon(Icons.phone, color: Colors.black),
                      SizedBox(width: 4.0),
                      Text(
                        '+94 72 080 6890',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.0,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            backgroundColor: Colors.yellowAccent,
            elevation: 0,
            systemOverlayStyle: SystemUiOverlayStyle.dark,
          ),
        ),
      ),
    );
  }
}
