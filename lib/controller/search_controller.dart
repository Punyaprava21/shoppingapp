import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchController extends GetxController {
  final searchController = TextEditingController();
  final searchText = "".obs;

  // Sample recent searches
  final recentSearches = [
    {
      'title': 'Fan installation',
      'price': 'Starts at ₹89',
      'category': 'Electrician',
    },
    {'title': 'AC Service', 'price': 'Starts at ₹299', 'category': 'AC Repair'},
  ];

  // Sample trending searches
  final trendingSearches = [
    'Professional cleaning',
    'Electricians',
    'Salon',
    'Carpenters',
    'Massage for men',
    'Washing machine repair',
    'Refrigerator repair',
    'Microwave repair',
    'Furniture assembly',
    'Ro repair',
  ];

  void updateSearch(String value) => searchText.value = value;

  void selectTrending(String value) {
    searchController.text = value;
    searchText.value = value;
  }
}
