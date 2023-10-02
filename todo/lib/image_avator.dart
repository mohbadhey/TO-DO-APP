



import 'package:flutter/material.dart';

class imagesAvator extends StatelessWidget {
  const imagesAvator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
  width: 50,
  height: 50,
  padding: const EdgeInsets.all(2), // Add spacing around the avatar
  decoration: BoxDecoration(
    color: Colors.white, // Add a background color or remove this line for transparent background
    shape: BoxShape.circle,
    border: Border.all(
      color: Colors.blue, // Add a border color or remove this line for no border
      width: 2, // Border width
    ),
  ),
  child: const ClipOval(
    child: CircleAvatar(
      radius: 48,
      backgroundImage: AssetImage('images/we.jpeg'),
    ),
  ),
);
  }
}