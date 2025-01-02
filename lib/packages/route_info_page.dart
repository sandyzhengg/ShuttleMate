import 'package:flutter/material.dart';
import 'routes.dart';

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
        toolbarHeight: screenHeight * 0.05,
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
                  fontSize: screenWidth * 0.05  * ((300 - routePage['times'].length) / 300),
                  color: Colors.white, // Text color matching the route
                ),
              ),
              SizedBox(height: screenWidth * 0.05),
              Row(
                children: [
                  SizedBox(width: screenWidth * 0.05),
                    Expanded(
                      flex: 1, // 1 part of the space
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
                              fontSize: screenWidth * 0.15 / routePage['abbreviation'].length,
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
                    flex: 3, // 2 parts of the space
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          routePage['info'],
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
              Expanded(
                child: Stack(
                  children: [
                    Positioned(
                      left: screenWidth * 0.4825, // Center the vertical line
                      top: 0,
                      bottom: 0,
                      child: Container(
                        width: screenWidth * 0.035,
                        color: Colors.white,
                      ),
                    ),
                    ListView.builder(
                      itemCount: routePage['stops'].length,
                      itemBuilder: (context, index) {
                        return Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(width: screenWidth * 0.05),
                            Container(
                              width: screenWidth * 0.4, // Set the desired width for the text box
                              height: screenWidth * 0.25,
                              constraints: BoxConstraints(
                                maxWidth: screenWidth * 0.4, // Limit the maximum width
                              ),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  routePage['stops'][index],
                                  style: TextStyle(
                                    fontFamily: 'DelaGothicOne',
                                    fontSize: screenWidth * 0.04,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white, // Text color matching the route
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: screenWidth * 0.1,
                              height: screenWidth * 0.1,
                              decoration: BoxDecoration(
                                color: routePage['color'],
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.white,
                                  width: screenWidth * 0.02,
                                ),
                              ),
                            ),
                            SizedBox(width: screenWidth * 0.05),
                            Container(
                              width: screenWidth * 0.4, // Set the desired width for the text box
                              height: screenWidth * 0.25,
                              constraints: BoxConstraints(
                                maxWidth: screenWidth * 0.4, // Limit the maximum width
                              ),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  stopPlaces[routePage['stops'][index]].map((place) => '* $place').join('\n'),
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: screenWidth * 0.03,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white, // Text color matching the route
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}