import 'package:flutter/material.dart';

class DateTimeCard extends StatelessWidget {
  final String title;
  final String displayText;
  final VoidCallback onTap;

  const DateTimeCard({
    Key? key,
    required this.title,
    required this.displayText,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8), // Spacing between title and display text
              Text(displayText),
              SizedBox(height: 8), // Spacing between display text and buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  TextButton(
                    onPressed: () {
                      // Cancel logic
                    },
                    child: Text('Cancel'),
                  ),
                  TextButton(
                    onPressed: () {
                      // Set logic
                    },
                    child: Text('Set'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}