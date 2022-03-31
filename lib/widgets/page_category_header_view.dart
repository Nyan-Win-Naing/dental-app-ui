import 'package:dental_app/resources/colors.dart';
import 'package:dental_app/resources/dimens.dart';
import 'package:flutter/material.dart';

class PageCategoryHeaderView extends StatelessWidget {

  String title;
  String description;


  PageCategoryHeaderView({required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: MARGIN_MEDIUM_3,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: MARGIN_SMALL),
        Text(
          description,
          style: const TextStyle(
            color: HINT_TEXT_COLOR,
            fontSize: MARGIN_MEDIUM_2,
          ),
        ),
      ],
    );
  }
}
