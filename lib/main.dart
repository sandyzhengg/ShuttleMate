import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

import "packages/dropdown_options.dart";
import "packages/day_night_toggle.dart";

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

class _MyHomePageState extends State<MyHomePage> {
  //Daytime and Nightime route lists
  final List<Map<String, dynamic>> daytimeRoutes = [
    {'label': 'Friend Center & Metra', 'stops': ['Bartlett Dining Commons', 'Campus North Residential Commons', 'Ratner', 'Max Palevsky Residential Commons', 'Regenstein Library/Mansueto'], 'color': Colors.blue},
    {'label': 'Drexel', 'stops': ['Crown Family School of Social Work, Policy, and Practice', 'Henry Crown', 'Snell-Hitchcock Hall', 'Woodlawn Residential Hall', 'Renee Granville-Grossman Residential Commons'],'color': Colors.purple},
    {'label': 'Apostolic/Drexel', 'stops': ['Apostolic Church', 'Logan Center for the Arts', 'Rockefeller Memorial Chapel', 'Stagg Field', 'Saieh Hall', 'William Eckhardt Research Center'],'color': Colors.orange},
    {'label': 'Apostolic', 'stops': ['Smart Museum of Art', 'Stony Island Metra Stop', 'Midway Plaisance'],'color': Colors.pink},
    {'label': '53rd Street Express', 'stops': ['Harper Court', 'Shops on 53rd Street', 'Stony Island Metra Stop'],'color': Colors.green},
    {'label': 'Midway Metra', 'stops': ['Midway Plaisance', 'International House', 'Charles M. Harper Center (Booth School of Business)', 'Oriental Institute Museum'],'color': Colors.black},
    {'label': 'RedLine/Arts Block', 'stops': ['Garfield Red Line', 'Garfield Green Line', 'Arts Block', 'Washington Park', 'Logan Center for the Arts', 'KPTC'],'color':Colors.red},
  ];

  final List<Map<String, dynamic>> nighttimeRoutes = [
    {'label': 'North Route', 'stops': ['Ratner', 'Campus North Residential Commons', 'Max Palevsky Residential Commons', 'Bartlett Dining Commons', 'Regenstein Library/Mansueto', 'Snell-Hitchcock Hall', 'Stuart Hall'],'color': Colors.lightBlue},
    {'label': 'South Route', 'stops': ['Woodlawn Residential Commons', 'Renee Granville-Grossman Residential Commons', 'Logan Center for the Arts', 'Rockefeller Memorial Chapel', 'Midway Plaisance'],'color': Colors.red},
    {'label': 'East Route', 'stops': ['International House', 'Saieh Hall', 'Harper Memorial Library'],'color': Colors.green},
    {'label': 'Central Route', 'stops': ['Charles M. Harper Center (Booth School of Business)', 'KPTC', 'Eckhardt Research Center', 'Oriental Institute Museum'],'color': Colors.orange},
    {'label': 'Regents Express', 'stops': ['University of Chicago Medicine', 'Gleacher Center', 'Stony Island Metra Stop'],'color': Colors.purple},
  ];
  late final WebViewController controller;

  bool isDay = true;

  List<Map<String, dynamic>> get currentRoutes => isDay ? daytimeRoutes : nighttimeRoutes;


  @override
  void initState() {
  super.initState();

  controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setNavigationDelegate(
      NavigationDelegate(
        onPageStarted: (String url) {
          print('Page started loading: $url');
        },
        onPageFinished: (String url) {
          print('Page finished loading: $url');
        },
        onWebResourceError: (error) {
          print('Error loading page: ${error.description}');
        },
      ),
    )
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

  //Replaced with NightTime and DayTime Lists
  //final List<Map<String, dynamic>> buttonData = [
    //{'label': 'Central', 'color': Colors.orange},
    //{'label': 'East', 'color': Colors.green},
    //{'label': 'Friend Center/Metra', 'color': Colors.brown},
    //{'label': 'Gleacher Express', 'color': Colors.black},
    //{'label': 'North', 'color': Colors.blue},
    //{'label': 'Red Line/Arts Block', 'color': Colors.red},
    //{'label': 'South', 'color': Colors.deepOrangeAccent},
  //];


  String dropdownValue = 'Mansueto Library';
 
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
            height: 400,
            padding: const EdgeInsets.all(5), // Add padding if needed
            child: Image.asset(
              'assets/ShuttleMateLogo.png',
              fit: BoxFit.contain, // Ensure the image fits within the container
            ),
          ),
        ),
        backgroundColor: isDay ? Color(0xFF640000) : Color(0xFF410000),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: (isDay ? [Color(0xFF640000), Color(0xFF410000)] : [Color(0xFF410000), Color(0xFF1e0000)]),
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
                        color: isDay ?Colors.white : Colors.yellowAccent,
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
                          border: Border.all(color: isDay ? Color(0xFFc1e7e8): Color(0xFF252e2e), width: 4),
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
                // Day/Night Toggle Switch
                Column(
                  children: [
                    Text(
                      isDay ? "Daytime" : "Nightride",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: screenWidth * 0.05,
                        color: isDay ?Colors.white : Colors.yellowAccent,
                      ),
                    ),
                    SizedBox(height: screenWidth * 0.025), // Add padding between the Text and ToggleButtons
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
              height: screenHeight * 0.5,
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
                color: isDay ?Colors.white : Colors.yellowAccent,
              ),
            ),
          ),
          // GridView with buttons   
          Expanded(
  child: GridView.builder(
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 6, // 6 columns
      crossAxisSpacing: screenWidth * 0.01,
      mainAxisSpacing: screenWidth * 0.025,
    ),
    itemCount: currentRoutes.length,
    itemBuilder: (context, index) {
      final route = currentRoutes[index];
      return GestureDetector(
        onTap: () => _showRouteStops(route),
        child: Container(
          width: screenWidth * 0.45,
          height: screenWidth * 0.45,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            border: Border.all(
              color: route['color'], // Border color based on route
              width: screenWidth * 0.01,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.directions_bus, // Bus icon
                size: screenWidth * 0.05, // Adjust the size of the icon
                color: route['color'], // Icon color matching the route
              ),
              Text(
                route['label'],
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: screenWidth * 0.015,
                  fontWeight: FontWeight.bold,
                  color: route['color'], // Text color matching the route
                ),
              ),
            ],
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

//show stops method
void _showRouteStops(Map<String, dynamic> route) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              route['label'],
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            ...route['stops'].map<Widget>((stop) {
              return ListTile(
                leading: Icon(Icons.place, color: route['color']),
                title: Text(stop),
              );
            }).toList(),
          ],
        ),
      );
    },
  );
}

}