import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

import "packages/circular_border.dart";
import "packages/dropdown_options.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ShuttleMate',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'ShuttleMate'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

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

class _MyHomePageState extends State<MyHomePage> {
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..loadRequest(
        Uri.parse('https://chicago.passiogo.com/'),
      );
  }

  Future<void> _launchURL() async {
    final Uri url = Uri.parse('https://chicago.passiogo.com/');
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  final List<Map<String, dynamic>> buttonData = [
    {'label': 'Central', 'color': Colors.orange},
    {'label': 'East', 'color': Colors.green},
    {'label': 'Friend Center/Metra', 'color': Colors.brown},
    {'label': 'Gleacher Express', 'color': Colors.black},
    {'label': 'North', 'color': Colors.blue},
    {'label': 'Red Line/Arts Block', 'color': Colors.red},
    {'label': 'South', 'color': Colors.deepOrangeAccent},
  ];

  String dropdownValue = 'Mansueto Library';
 
  @override
  Widget build(BuildContext context) {
  final double screenWidth = MediaQuery.of(context).size.width;
  final double screenHeight = MediaQuery.of(context).size.height;

  bool isDay = false;

  return Scaffold(
    appBar: AppBar(
      title: GestureDetector(
        onTap: _launchURL,
        child: Container(
          width: screenWidth * 0.9,
          height: 400,
          padding: const EdgeInsets.all(5), // Add padding if needed
          child: Image.asset(
            'assets/ShuttleMateLogo.png',
            fit: BoxFit.contain, // Ensure the image fits within the container
          ),
        ),
      ),
      backgroundColor: Color(0xFF800000),
    ),
    body: Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF800000), Color(0xFF4C0202)],
          begin: Alignment.topLeft,
          end: Alignment.bottomLeft,
        ),
      ),
      child: Column(
        children: <Widget>[
          // First section with Dropdown and Text
          SizedBox(
            height: screenHeight * 0.125,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text(
                      "Going Somewhere?",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: screenWidth * 0.05,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: screenWidth * 0.025),
                    DropdownButtonHideUnderline(
                      child: Container(
                        width: screenWidth * 0.5,
                        height: screenWidth * 0.1,
                        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(color: Color(0xFF303030), width: 4),
                        ),
                        child: DropdownButton<String>(
                          isExpanded: true,
                          value: dropdownValue,
                          icon: const Icon(Icons.arrow_drop_down),
                          iconSize: 24,
                          style: const TextStyle(color: Colors.black),
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownValue = newValue!;
                            });
                          },
                          items: dropdownOptions.map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Row(
                                children: [
                                  Text(
                                    value,
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 7,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "Daytime",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: screenWidth * 0.05,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 5), // Add padding between the Text and ToggleButtons
                    DayNightSwitch(
                      isDay: isDay,
                      onChanged: (value) {
                          setState(() {
                            isDay = value;
                          });
                      }),
                  ],
                ),
              ],
            ),
          ),
          // WebView Container
          Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.black,
                  width: 5, // Set the desired border width here
                ),
              ),
            ),
            child: SizedBox(
              width: screenWidth * 1,
              height: screenHeight * 0.45,
              child: WebViewWidget(controller: controller),
            ),
          ),
          // Shuttle Stops Text
          SizedBox(
            height: screenHeight * 0.05,
            child: Text(
              "Shuttle Stops",
              style: TextStyle(
                fontFamily: 'DelaGothicOne',
                fontSize: screenWidth * 0.05,
                color: Colors.white,
              ),
            ),
          ),
          // GridView with buttons
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5, // 5 columns
              ),
              itemCount: buttonData.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.all(screenWidth * 0.02), // Add margin between buttons
                  child: Tooltip(
                    message: '${buttonData[index]['label']}', // Display button index and label
                    child: BorderToggleButton(
                      label: buttonData[index]['label'],
                      color: buttonData[index]['color'],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    ),
  );
}
}

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
    return GestureDetector(
      onTap: () {
        widget.onChanged(!widget.isDay);
      },
      child: Container(
        width: 60,
        height: 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: widget.isDay ? Colors.yellow : Colors.blueGrey,
        ),
        child: Stack(
          children: [
            AnimatedPositioned(
              duration: Duration(milliseconds: 300),
              curve: Curves.easeIn,
              left: widget.isDay ? 0 : 30,
              right: widget.isDay ? 30 : 0,
              child: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: widget.isDay
                    ? Icon(Icons.wb_sunny, color: Colors.yellow)
                    : Icon(Icons.nights_stay, color: Colors.blueGrey),
              ),
            ),
          ],
        ),
      ),
    );
  }
}