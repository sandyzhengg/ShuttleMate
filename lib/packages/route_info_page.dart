import 'package:flutter/material.dart';

class RouteInfoPage extends StatelessWidget {
  final Map<String, dynamic> routePage;

  const RouteInfoPage({
    super.key,
    required this.routePage,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(routePage['label']),
        backgroundColor: routePage['color'],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              routePage['label'],
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              'Information about ${routePage['label']} will be displayed here.',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}