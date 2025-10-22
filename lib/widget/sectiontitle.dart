import 'package:customertech/utility/colors.dart';
import 'package:flutter/material.dart';

Widget buildSectionTitle(
  BuildContext context,
  String title,
  String? action,
) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 18,
            color: Color(0xFF1F2937),
          ),
        ),
        if (action != null)
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              foregroundColor: kPrimaryColorLight,
              padding: EdgeInsets.zero,
            ),
            child: Text(action),
          ),
      ],
    ),
  );
}