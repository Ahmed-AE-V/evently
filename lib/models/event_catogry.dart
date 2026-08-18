import 'package:flutter/material.dart';

class EventCategory {
  final String label;
  final IconData icon;
  const EventCategory(this.label, this.icon);
}

const categories = [
  EventCategory('All', Icons.grid_view_rounded),
  EventCategory('Sport', Icons.directions_bike_outlined),
  EventCategory('Birthday', Icons.cake_outlined),
  EventCategory('Book Club', Icons.menu_book_outlined),
  EventCategory('Meeting', Icons.groups_outlined),
  EventCategory('Exhibition', Icons.museum_outlined),
];
