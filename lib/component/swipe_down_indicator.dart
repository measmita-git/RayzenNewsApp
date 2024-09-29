import 'package:flutter/material.dart';

class SwipeDownIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.5),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.swipe_down_alt,
            color: Colors.white,
            size: 30.0,
          ),
          SizedBox(height: 5.0),
          Text(
            "Swipe down to read more",
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
