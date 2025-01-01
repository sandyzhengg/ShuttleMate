import 'package:flutter/material.dart';

//Daytime and Nightime route lists
final List<Map<String, dynamic>> daytimeRoutes = [
  {
    'label': 'Friend Center & Metra', 
    'stops': [
      'Bartlett Dining Commons',
      'Campus North Residential Commons',
      'Ratner',
      'Max Palevsky Residential Commons',
      'Regenstein Library/Mansueto'
    ],
    'places': [
      ['Ratner', 'Not Ratner', '? Oh ratner'],
      ['Ratner', 'Not Ratner', '? Oh ratner'],
      ['Mansueto Library', 'Not Ratner', '? Oh ratner'],
      ['Ratner', 'Not Ratner', '? Oh ratner'],
      ['Ratner', 'Not Ratner', '? Oh ratner'],
      ['Ratner', 'Not Ratner', '? Oh ratner'],
      ['Ratner', 'Not Ratner', '? Oh ratner'],
    ],
    'color': Colors.blue,
    'abbreviation': 'FCM',
    'info': 'This route is pretty good stuff. But what is stuff? Who defines what is and what is not, what to see?',
    'times': 'Mon-Fri, 6:30am-9pm, every 10-20 min'
  },
  {
    'label': 'Drexel',
    'stops': [
      'Crown Family School of Social Work, Policy, and Practice',
      'Henry Crown',
      'Snell-Hitchcock Hall',
      'Woodlawn Residential Hall',
      'Renee Granville-Grossman Residential Commons'
    ],
    'places': [
      ['Ratner', 'Not Ratner', '? Oh ratner'],
      ['Ratner', 'Not Ratner', '? Oh ratner'],
      ['Ratner', 'Not Ratner', '? Oh ratner'],
      ['Ratner', 'Not Ratner', '? Oh ratner'],
      ['Ratner', 'Not Ratner', '? Oh ratner'],
      ['Ratner', 'Not Ratner', '? Oh ratner'],
      ['Ratner', 'Not Ratner', '? Oh ratner'],
    ],
    'color': Colors.purple,
    'abbreviation': 'DX',
    'info': 'This route is pretty good stuff. But what is stuff? Who defines what is and what is not, what to see?',
    'times': 'Mon-Fri, 6:30am-9pm, every 10-20 min'
  },
  {
    'label': 'Apostolic/Drexel',
    'stops': [
      'Apostolic Church',
      'Logan Center for the Arts',
      'Rockefeller Memorial Chapel',
      'Stagg Field',
      'Saieh Hall',
      'William Eckhardt Research Center'
    ],
    'places': [
      ['Ratner', 'Not Ratner', '? Oh ratner'],
      ['Ratner', 'Not Ratner', '? Oh ratner'],
      ['Ratner', 'Not Ratner', '? Oh ratner'],
      ['Ratner', 'Not Ratner', '? Oh ratner'],
      ['Ratner', 'Not Ratner', '? Oh ratner'],
      ['Ratner', 'Not Ratner', '? Oh ratner'],
      ['Ratner', 'Not Ratner', '? Oh ratner'],
    ],
    'color': Colors.orange,
    'abbreviation': 'AP/DX',
    'info': 'This route is pretty good stuff. But what is stuff? Who defines what is and what is not, what to see?',
    'times': 'Mon-Fri, 6:30am-9pm, every 10-20 min'
  },
  {
    'label': 'Apostolic',
    'stops': [
      'Smart Museum of Art',
      'Stony Island Metra Stop',
      'Midway Plaisance'
    ],
    'places': [
      ['Ratner', 'Not Ratner', '? Oh ratner'],
      ['Ratner', 'Not Ratner', '? Oh ratner'],
      ['Ratner', 'Not Ratner', '? Oh ratner'],
      ['Ratner', 'Not Ratner', '? Oh ratner'],
      ['Ratner', 'Not Ratner', '? Oh ratner'],
      ['Ratner', 'Not Ratner', '? Oh ratner'],
      ['Ratner', 'Not Ratner', '? Oh ratner'],
    ],
    'color': Colors.pink,
    'abbreviation': 'AP',
    'info': 'This route is pretty good stuff. But what is stuff? Who defines what is and what is not, what to see?',
    'times': 'Mon-Fri, 6:30am-9pm, every 10-20 min'
  },
  {
    'label': '53rd Street Express',
    'stops': [
      'Harper Court',
      'Shops on 53rd Street',
      'Stony Island Metra Stop'
    ],
    'places': [
      ['Ratner', 'Not Ratner', '? Oh ratner'],
      ['Ratner', 'Not Ratner', '? Oh ratner'],
      ['Ratner', 'Not Ratner', '? Oh ratner'],
      ['Ratner', 'Not Ratner', '? Oh ratner'],
      ['Ratner', 'Not Ratner', '? Oh ratner'],
      ['Ratner', 'Not Ratner', '? Oh ratner'],
      ['Ratner', 'Not Ratner', '? Oh ratner'],
    ],
    'color': Colors.green,
    'abbreviation': '53RD',
    'info': 'This route is pretty good stuff. But what is stuff? Who defines what is and what is not, what to see?',
    'times': 'Mon-Fri, 6:30am-9pm, every 10-20 min'
  },
  {
    'label': 'Midway Metra',
    'stops': [
      'Midway Plaisance',
      'International House',
      'Charles M. Harper Center (Booth School of Business)',
      'Oriental Institute Museum'
    ],
    'places': [
      ['Ratner', 'Not Ratner', '? Oh ratner'],
      ['Ratner', 'Not Ratner', '? Oh ratner'],
      ['Ratner', 'Not Ratner', '? Oh ratner'],
      ['Ratner', 'Not Ratner', '? Oh ratner'],
      ['Ratner', 'Not Ratner', '? Oh ratner'],
      ['Ratner', 'Not Ratner', '? Oh ratner'],
      ['Ratner', 'Not Ratner', '? Oh ratner'],
    ],
    'color': Colors.black,
    'abbreviation': 'MM',
    'info': 'This route is pretty good stuff. But what is stuff? Who defines what is and what is not, what to see?',
    'times': 'Mon-Fri, 6:30am-9pm, every 10-20 min'
  },
  {
    'label': 'RedLine/Arts Block',
    'stops': [
      'Garfield Red Line',
      'Garfield Green Line',
      'Arts Block',
      'Washington Park',
      'Logan Center for the Arts',
      'KPTC'
    ],
    'places': [
      ['Ratner', 'Not Ratner', '? Oh ratner'],
      ['Ratner', 'Not Ratner', '? Oh ratner'],
      ['Ratner', 'Not Ratner', '? Oh ratner'],
      ['Ratner', 'Not Ratner', '? Oh ratner'],
      ['Ratner', 'Not Ratner', '? Oh ratner'],
      ['Ratner', 'Mansueto Library', '? Oh ratner'],
      ['Ratner', 'Not Ratner', '? Oh ratner'],
    ],
    'color': Colors.red,
    'abbreviation': 'RED',
    'info': 'This route is pretty good stuff. But what is stuff? Who defines what is and what is not, what to see?',
    'times': 'Mon-Fri, 6:30am-9pm, every 10-20 min'
  },
];

final List<Map<String, dynamic>> nighttimeRoutes = [
  {
    'label': 'North Route',
    'stops': [
      'Ratner',
      'Campus North Residential Commons',
      'Max Palevsky Residential Commons',
      'Bartlett Dining Commons',
      'Regenstein Library/Mansueto',
      'Snell-Hitchcock Hall',
      'Stuart Hall'
    ],
    'places': [
      ['Ratner', 'Not Ratner', '? Oh ratner'],
      ['Ratner', 'Not Ratner', '? Oh ratner'],
      ['Ratner', 'Not Ratner', '? Oh ratner'],
      ['Ratner', 'Not Ratner', '? Oh ratner'],
      ['Ratner', 'Not Ratner', '? Oh ratner'],
      ['Ratner', 'Not Ratner', '? Oh ratner'],
      ['Ratner', 'Not Ratner', '? Oh ratner'],
    ],
    'color': Colors.lightBlue,
    'abbreviation': 'NORTH',
    'info': 'This route is pretty good stuff. But what is stuff? Who defines what is and what is not, what to see?',
    'times': 'Mon-Fri, 6:30am-9pm, every 10-20 min'
  },
  {
    'label': 'South Route',
    'stops': [
      'Woodlawn Residential Commons',
      'Renee Granville-Grossman Residential Commons',
      'Logan Center for the Arts',
      'Rockefeller Memorial Chapel',
      'Midway Plaisance'
    ],
    'places': [
      ['Ratner', 'Not Ratner', '? Oh ratner'],
      ['Ratner', 'Not Ratner', '? Oh ratner'],
      ['Ratner', 'Not Ratner', '? Oh ratner'],
      ['Ratner', 'Not Ratner', '? Oh ratner'],
      ['Ratner', 'Not Ratner', '? Oh ratner'],
      ['Ratner', 'Not Ratner', '? Oh ratner'],
      ['Ratner', 'Not Ratner', '? Oh ratner'],
    ],
    'color': Colors.red,
    'abbreviation': 'SOUTH',
    'info': 'This route is pretty good stuff. But what is stuff? Who defines what is and what is not, what to see?',
    'times': 'Mon-Fri, 6:30am-9pm, every 10-20 min'
  },
  {
    'label': 'East Route',
    'stops': [
      'International House',
      'Saieh Hall',
      'Harper Memorial Library'
    ],
    'color': Colors.green,
    'abbreviation': 'EAST',
    'times': 'Mon-Fri, 6:30am-9pm, every 10-20 min'
  },
  {
    'label': 'Central Route',
    'stops': [
      'Charles M. Harper Center (Booth School of Business)',
      'KPTC',
      'Eckhardt Research Center',
      'Oriental Institute Museum'
    ],
    'places': [
      ['Ratner', 'Not Ratner', '? Oh ratner'],
      ['Ratner', 'Not Ratner', '? Oh ratner'],
      ['Ratner', 'Not Ratner', '? Oh ratner'],
      ['Ratner', 'Not Ratner', '? Oh ratner'],
      ['Ratner', 'Not Ratner', '? Oh ratner'],
      ['Ratner', 'Not Ratner', '? Oh ratner'],
      ['Ratner', 'Not Ratner', '? Oh ratner'],
    ],
    'color': Colors.orange,
    'abbreviation': 'CEN',
    'info': 'This route is pretty good stuff. But what is stuff? Who defines what is and what is not, what to see?',
    'times': 'Mon-Fri, 6:30am-9pm, every 10-20 min'
  },
  {
    'label': 'Regents Express',
    'stops': [
      'University of Chicago Medicine',
      'Gleacher Center',
      'Stony Island Metra Stop'
    ],
    'places': [
      ['Ratner', 'Not Ratner', '? Oh ratner'],
      ['Ratner', 'Not Ratner', '? Oh ratner'],
      ['Ratner', 'Not Ratner', '? Oh ratner'],
      ['Ratner', 'Not Ratner', '? Oh ratner'],
      ['Ratner', 'Not Ratner', '? Oh ratner'],
      ['Ratner', 'Not Ratner', '? Oh ratner'],
      ['Ratner', 'Not Ratner', '? Oh ratner'],
    ],
    'color': Colors.purple,
    'abbreviation': 'RE',
    'times': 'Mon-Fri, 6:30am-9pm, every 10-20 min'
  },
];