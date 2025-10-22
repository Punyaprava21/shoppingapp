import 'package:customertech/widget/categoriesgrid.dart';
import 'package:customertech/widget/header.dart';
import 'package:customertech/widget/mostbooked.dart';
import 'package:customertech/widget/popular_services.dart';
import 'package:customertech/widget/promobanner.dart';
import 'package:customertech/widget/searchbar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final String userName;

  const HomeScreen({Key? key, required this.userName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildHeader(context, userName: userName),
              const SizedBox(height: 10),
              buildSearchBar(context),
              const SizedBox(height: 14),
              buildPromoBanner(context),
              const SizedBox(height: 18),
              const SizedBox(height: 10),
              buildPopularServices(context),
              const SizedBox(height: 10),
              const SizedBox(height: 18),
              buildCategoriesGrid(context),
              const SizedBox(height: 10),
              const SizedBox(height: 18),
              buildMostBookedServices(context),
              const SizedBox(height: 22),
            ],
          ),
        ),
      ),
    );
  }
}
