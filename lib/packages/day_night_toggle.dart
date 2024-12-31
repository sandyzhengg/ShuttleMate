import 'package:flutter/material.dart';

class DayNightSwitch extends StatefulWidget {
  const DayNightSwitch({
    super.key,
    required this.isDay,
    required this.onChanged,
  });

  final bool isDay;
  final ValueChanged<bool> onChanged;

  @override
  DayNightSwitchState createState() => DayNightSwitchState();
}

class DayNightSwitchState extends State<DayNightSwitch> {
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () => widget.onChanged(!widget.isDay),
      child: Container(
        width: screenWidth * 0.2,
        height: screenWidth * 0.1,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Color(0xFF4a4a4a),
          border: Border.all(
            color: widget.isDay ? Color(0xFFc1e7e8): Color(0xFF252e2e),
            width: 4, // Set the border width
          ),
        ),
        child: Stack(
          children: [
            AnimatedPositioned(
              duration: Duration(milliseconds: 300),
              curve: Curves.easeIn,
              left: widget.isDay ? 0 : screenWidth * 0.1,
              right: widget.isDay ? screenWidth * 0.1 : 0,
              child: Container(
                width: screenWidth * 0.079,
                height: screenWidth * 0.079,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: widget.isDay ? Color(0xFFc1e7e8): Color(0xFF252e2e),
                ),
                child: Icon(
                  widget.isDay ? Icons.sunny : Icons.mode_night_rounded,
                  color: Colors.yellowAccent,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}