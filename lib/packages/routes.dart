import 'package:flutter/material.dart';

final Map<String, dynamic> stopPlaces = {
    'Harper Court (NE Corner)': [],
    '53rd St & Kenwood': [],
    'Kimbark Plaza (NE Corner)': [],
    'Ellis & 53rd St.': [],
    'Ellis Garage & Ratner Athletic (West)': ['Ratner', 'Smart Museum of Art'],
    'Ellis Ave & 57th St': ['Mansueto Library', "Eckhardt", "Kersten Physics Teaching Center", "Searle Chemical Labratory"],
    'Levi Hall (W)': ['Henry Hinds Laboratory for Geophysical Sciences', "Bookstore" 'Edward H. Levi Hall'],
    'Goldblatt Pavilion': ['Student Wellness Center', "Department of Medicine"],
    'Logan Center': ['Logan Center for the Arts', 'Researching Computing Center'],
    '60th St. & Ellis (SE Corner)':  ['Burton - Judson Courts', 'Crown Family School of Social Work, Policy, and Practice', 'Edelstone Center', 'Renee Granville Grossman Residential Commons'],
    '60th St. & Woodlawn Ave (SE Corner)': ['Institute for Mathematical and Statistical Innovation', 'Harris School of Public Policy', 'Woodlawn'],
    'Keller Center EB': ['Keller Center'],
    'Press Building': ['University of Chicago Press', "Office of the University Registrar"],
    'Stony Island Parking Lot': [],
    '57th St. & Metra (NB)': ['57th St. Metra'],
    'Lake Park & 55th St. (SE Corner)': [],
    'Wyler Pavilion': ['Wyler Pavilion'],
    'Bernard Mitchell Hospital': ['Bernard Mitchell Hospital'],
    '58th Street & Drexel': ['Bernard Mitchell Hospital', 'American School', 'Kovler Hall'],
    "Comer Children's Hospital": ["Comer Children's Hospital", 'John Crerar Library'],
    '57th Street & Drexel (NB)': ['Gordon Center for Integrative Science', 'Knapp Center for Biomedical Discovery', 'John Crerar Library'],
    'Drexel Garage': ['Research Computing Center', 'The University of Chicago Human Resources Department', 'University of Chicago: Department of Safety and Security'],
    'Apostolic Lot': [],
    'Kenwood & 63rd': []
};

//Daytime and Nightime route lists
final List<Map<String, dynamic>> daytimeRoutes = [
  {
    'label': '53RD Street Express', 
    'stops': [
    'Harper Court (NE Corner)',
    '53rd St & Kenwood',
    'Kimbark Plaza (NE Corner)',
    'Ellis & 53rd St.',
    'Ellis Garage & Ratner Athletic (West)',
    'Ellis Ave & 57th St',
    'Levi Hall (W)',
    'Goldblatt Pavilion',
    'Logan Center',
    '60th St. & Ellis (SE Corner)',
    '60th St. & Woodlawn Ave (SE Corner)',
    'Keller Center EB',
    'Press Building',
    'Stony Island Parking Lot',
    '57th St. & Metra (NB)',
    'Lake Park & 55th St. (SE Corner)'
    ],
    'color': Colors.yellow,
    'abbreviation': '53RD',
    'info': 'Good for Downtown Hyde Park on 53rd and far-away university buildings',
    'times': 'Mon-Fri, 7am-6pm, 7am-8am every 30 min, 8am-10:30am every 15 minutes, 10:30am-6pm every 30 min'
  },
  {
    'label': 'Apostolic/Drexel',
    'stops': [
    'Goldblatt Pavilion',
    'Wyler Pavilion',
    'Bernard Mitchell Hospital',
    '58th Street & Drexel',
    "Comer Children's Hospital",
    '57th Street & Drexel (NB)',
    'Levi Hall (W)',
    'Drexel Garage',
    'Apostolic Lot',
    'Kenwood & 63rd'
    ],
    'color': Colors.orange,
    'abbreviation': 'AP/DX',
    'info': 'Good for the University hospital and places of worship',
    'times': 'Mon-Fri, 10am-12:30am, 10am-3pm every 15 min, 3pm-12:30am every 10 min'
  },
  {
    'label': 'Apostolic/Drexel',
    'stops': [],
    'color': Colors.orange,
    'abbreviation': 'AP/DX',
    'info': 'This route is pretty good stuff. But what is stuff? Who defines what is and what is not, what to see?',
    'times': 'Mon-Fri, 6:30am-9pm, every 10-20 min'
  },
  {
    'label': 'Apostolic',
    'stops': [],
    'color': Colors.pink,
    'abbreviation': 'AP',
    'info': 'This route is pretty good stuff. But what is stuff? Who defines what is and what is not, what to see?',
    'times': 'Mon-Fri, 6:30am-9pm, every 10-20 min'
  },
  {
    'label': '53rd Street Express',
    'stops': [],
    'color': Colors.green,
    'abbreviation': '53RD',
    'info': 'This route is pretty good stuff. But what is stuff? Who defines what is and what is not, what to see?',
    'times': 'Mon-Fri, 6:30am-9pm, every 10-20 min'
  },
  {
    'label': 'Midway Metra',
    'stops': [],
    'color': Colors.black,
    'abbreviation': 'MM',
    'info': 'This route is pretty good stuff. But what is stuff? Who defines what is and what is not, what to see?',
    'times': 'Mon-Fri, 6:30am-9pm, every 10-20 min'
  },
  {
    'label': 'RedLine/Arts Block',
    'stops': [],
    'color': Colors.red,
    'abbreviation': 'RED',
    'info': 'This route is pretty good stuff. But what is stuff? Who defines what is and what is not, what to see?',
    'times': 'Mon-Fri, 6:30am-9pm, every 10-20 min'
  },
];

final List<Map<String, dynamic>> nighttimeRoutes = [
  {
    'label': 'North Route',
    'stops': [],
    'color': Colors.lightBlue,
    'abbreviation': 'NORTH',
    'info': 'This route is pretty good stuff. But what is stuff? Who defines what is and what is not, what to see?',
    'times': 'Mon-Fri, 6:30am-9pm, every 10-20 min'
  },
  {
    'label': 'South Route',
    'stops': [],
    'color': Colors.red,
    'abbreviation': 'SOUTH',
    'info': 'This route is pretty good stuff. But what is stuff? Who defines what is and what is not, what to see?',
    'times': 'Mon-Fri, 6:30am-9pm, every 10-20 min'
  },
  {
    'label': 'East Route',
    'stops': [],
    'color': Colors.green,
    'abbreviation': 'EAST',
    'info': 'This route is pretty good stuff. But what is stuff? Who defines what is and what is not, what to see?',
    'times': 'Mon-Fri, 6:30am-9pm, every 10-20 min'
  },
  {
    'label': 'Central Route',
    'stops': [],
    'color': Colors.orange,
    'abbreviation': 'CEN',
    'info': 'This route is pretty good stuff. But what is stuff? Who defines what is and what is not, what to see?',
    'times': 'Mon-Fri, 6:30am-9pm, every 10-20 min'
  },
  {
    'label': 'Regents Express',
    'stops': [],
    'color': Colors.purple,
    'abbreviation': 'RE',
    'info': 'This route is pretty good stuff. But what is stuff? Who defines what is and what is not, what to see?',
    'times': 'Mon-Fri, 6:30am-9pm, every 10-20 min'
  },
];