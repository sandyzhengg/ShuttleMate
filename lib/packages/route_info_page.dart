import 'package:flutter/material.dart';

class RouteInfoPage extends StatelessWidget {
  final Map<String, dynamic> routePage;

  const RouteInfoPage({
    super.key,
    required this.routePage,
  });

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text(
              routePage['label'],
              style: TextStyle(
                fontFamily: 'DelaGothicOne',
                fontSize: screenWidth * 0.05,
                color: routePage['color'],
              ),
        ),
        backgroundColor: Colors.white,
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Color(0xFF640000),
        ),
        child: Center(
          child: Column(
            children: [
              SizedBox(height: screenWidth * 0.05),
              Text(
                routePage['times'],
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: screenWidth * 0.05,
                  color: Colors.white, // Text color matching the route
                ),
              ),
              SizedBox(height: screenWidth * 0.05),
              Row(
                children: [
                  SizedBox(width: screenWidth * 0.05),
                    Expanded(
                      flex: 2, // 1 part of the space
                      child: Container(
                      height: screenWidth * 0.15,
                      decoration: BoxDecoration(
                        color: routePage['color'],
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(
                          color: Colors.black, // Border color based on route
                          width: screenWidth * 0.01,
                          ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            routePage['abbreviation'],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'DelaGothicOne',
                              fontSize: screenWidth * 0.05,
                              fontWeight: FontWeight.bold,
                              color: Colors.white, // Text color matching the route
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: screenWidth * 0.05),
                  Expanded(
                    flex: 6, // 2 parts of the space
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'This route is pretty good stuff. But what is stuff? Who defines what is and what is not, what to see?',
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: screenWidth * 0.05,
                              color: Colors.white, // Text color matching the route
                            ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenWidth * 0.05),
              Container(
                  width: screenWidth,
                  height: screenWidth * 0.05, // Set the desired height for the rectangle
                  color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}