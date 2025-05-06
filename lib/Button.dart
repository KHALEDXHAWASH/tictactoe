import 'package:flutter/material.dart';

class button extends StatefulWidget {
  String text;
  int index;
  Function click;
  button({required this.text, required this.index, required this.click});

  @override
  State<button> createState() => _buttonState();
}

class _buttonState extends State<button> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(7),
      decoration: BoxDecoration(
        color: Colors.white, // Background color of the Container
        borderRadius: BorderRadius.circular(12), // Rounded corners
        border: Border.all(
          color: Colors.blue, // Border color
          width: 2, // Border width
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2), // Shadow color
            spreadRadius: 2, // Spread radius
            blurRadius: 5, // Blur radius
            offset: Offset(0, 3), // Shadow offset
          ),
        ],
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue, // Background color of the button
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(9), // Rounded corners for the button
          ),
        ),
        onPressed: () {
          widget.click(widget.index);
        },
        child: Text(widget.text, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30)),
      ),
    );
  }
}