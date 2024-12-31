import 'package:flutter/material.dart';
import "circular_border.dart";


class BorderToggleButton extends StatefulWidget {
  final String label;
  final Color color;

  const BorderToggleButton({
    super.key, // Use super parameter for key
    required this.label,
    required this.color,
  });
  
  @override
  BorderToggleButtonState createState() => BorderToggleButtonState();
}

class BorderToggleButtonState extends State<BorderToggleButton> {
  bool isDashed = true;

  void _toggleBorder() {
    setState(() {
      isDashed = !isDashed;
    });
  }

  @override
   Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white, // Set the background color to white
        shape: BoxShape.circle, // Set the shape to circle
        border: isDashed
            ? null
            : Border.all(
                color: widget.color,
                width: 5,
              ),
      ),
      child: CustomPaint(
        painter: isDashed ? DashedCircularBorderPainter(color: widget.color, strokeWidth: 5) : null,
        child: IconButton(
          icon: Icon(
            Icons.directions_bus,
            size: isDashed ? 45 : 35, // Toggle icon size based on border style
          ),
          onPressed: () {
            _toggleBorder();
            print("Button pressed");
          },
          color: Colors.black, // Set the color to black
        ),
      ),
    );
  }
}