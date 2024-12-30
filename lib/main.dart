import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';
import "packages/circular_border.dart";

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
                width: 4,
              ),
      ),
      child: CustomPaint(
        painter: isDashed ? DashedCircularBorderPainter(color: widget.color, strokeWidth: 4) : null,
        child: IconButton(
          icon: Icon(
            Icons.directions_bus,
            size: isDashed ? 40 : 30, // Toggle icon size based on border style
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

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: GestureDetector(
          onTap: _launchURL,
          child: Container(
            width: screenWidth * 0.9,
            padding: const EdgeInsets.all(3.0), // Add padding if needed
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
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
              Column(
                    children: [
                      Text(
                        "Going Somewhere?",
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                      // Add more widgets to Column 1 as needed
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        "Daytime",
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                      // Add more widgets to Column 2 as needed
                    ],
                  ),
              ],
              ),
              SizedBox(
                width: screenWidth * 1, // Set the desired width here
                height: screenHeight * 0.5, // Set the desired height here
                child: WebViewWidget(
                  controller: controller,
                ),
              ),
              Text(
                "Shuttle Stops",
                  style: TextStyle(
                  fontFamily: 'DelaGothicOne',
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 5, // 5 columns
                  ),
                  itemCount: buttonData.length,
                  itemBuilder: (context, index) {
                    return Padding(
                    padding: const EdgeInsets.all(8.0), // Add margin between buttons
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
      ),
    );
  }
}