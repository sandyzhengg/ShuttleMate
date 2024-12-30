import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.greenAccent),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  bool isDaytime = true;

  Future<void> _launchURL() async {
    final Uri url = Uri.parse('https://chicago.passiogo.com/');
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    String imagePath;
    if (isDaytime) {
      imagePath = 'assets/daytime.png';
    } else {
      imagePath = 'assets/nighttime.png';
    }

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF800000), Color(0xFF4C0202)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              GestureDetector(
                onTap: _launchURL,
                child: Image.asset(
                  'assets/ShuttleMateLogo.png',
                  width: screenWidth * 0.9,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Daytime', style: TextStyle(color: Colors.white)),
                  Switch(
                    value: isDaytime,
                    onChanged: (value) {
                      setState(() {
                        isDaytime = value;
                      });
                    },
                    activeColor: Colors.yellow,
                    inactiveThumbColor: Colors.blueGrey,
                  ),
                  const Text('Nighttime', style: TextStyle(color: Colors.white)),
                ],
              ),
              const SizedBox(height: 20),
              Image.asset(
                imagePath,
                width: screenWidth * 0.9,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
