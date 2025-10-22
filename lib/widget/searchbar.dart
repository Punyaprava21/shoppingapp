import 'package:customertech/screen/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget buildSearchBar(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    child: GestureDetector(
      onTap: () {
        Get.to(() => const SearchScreen());
      },
      child: Container(
        height: 46,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10),
          ],
        ),
        child: const TextField(
          enabled: false, 
          decoration: InputDecoration(
            hintText: "Search for services...",
            hintStyle: TextStyle(color: Colors.grey),
            prefixIcon: Icon(Icons.search, color: Colors.grey),
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(top: 10),
          ),
        ),
      ),
    ),
  );
}