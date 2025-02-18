import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

List<Map<String, dynamic>> transactionData = [
  {
    "icon": FaIcon(
      FontAwesomeIcons.burger,
      color: Colors.white,
      size: 16,
    ),
    "color": Colors.yellow[700],
    "name": "Food",
    "amount": "-￡45.00",
    "date": "Today",
  },
  {
    "icon": FaIcon(
      FontAwesomeIcons.bagShopping,
      color: Colors.white,
      size: 16,
    ),
    "color": Colors.purple[700],
    "name": "Shopping",
    "amount": "-￡205.00",
    "date": "Today",
  },
  {
    "icon": FaIcon(
      FontAwesomeIcons.bookMedical,
      color: Colors.white,
      size: 16,
    ),
    "color": Colors.green,
    "name": "Health",
    "amount": "-￡79.00",
    "date": "Yesterday",
  },
  {
    "icon": FaIcon(
      FontAwesomeIcons.plane,
      color: Colors.white,
      size: 16,
    ),
    "color": Colors.blue,
    "name": "Travel",
    "amount": "-￡690.00",
    "date": "Yesterday",
  },
];
