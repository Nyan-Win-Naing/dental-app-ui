import 'package:dental_app/resources/colors.dart';
import 'package:dental_app/resources/dimens.dart';
import 'package:flutter/material.dart';

class PatientView extends StatelessWidget {

  bool isHomePage;


  PatientView({required this.isHomePage});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.only(right: MARGIN_MEDIUM_3),
      height: PATIENTS_LIST_VIEW_ITEM_HEIGHT,
      decoration: BoxDecoration(
        color: isHomePage ? SECONDARY_COLOR : Color.fromRGBO(255, 255, 255, 0.9),
        borderRadius: BorderRadius.circular(MARGIN_MEDIUM),
      ),
      padding: EdgeInsets.only(left: 10),
      child: Container(
        // padding: EdgeInsets.symmetric(horizontal: MARGIN_XLARGE, vertical: MARGIN_MEDIUM_3),
        padding: const EdgeInsets.only(
          top: MARGIN_MEDIUM_3,
          left: MARGIN_XLARGE,
          right: MARGIN_LARGE,
          bottom: MARGIN_MEDIUM_2,
        ),
        width: screenWidth * 2 / 3,
        height: 135,
        decoration: BoxDecoration(
          color: isHomePage ? Color.fromRGBO(28, 103, 199, 1.0) : Colors.white,
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(MARGIN_MEDIUM),
            bottomRight: Radius.circular(MARGIN_MEDIUM),
          ),
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.2),
              blurRadius: 5,
              spreadRadius: 1,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      "Office No. 248",
                      style: TextStyle(
                        color: isHomePage ? Color.fromRGBO(255, 255, 255, 0.9) : Color.fromRGBO(0, 0, 0, 0.9),
                        fontSize: MARGIN_MEDIUM_2,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      " / 3patients",
                      style: TextStyle(
                        color: isHomePage ? HINT_TEXT_COLOR : SECONDARY_DARK_COLOR,
                        fontSize: MARGIN_MEDIUM_2,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: MARGIN_MEDIUM),
                Row(
                  children: [
                    Icon(
                      Icons.access_time,
                      color: isHomePage ? HINT_TEXT_COLOR : SECONDARY_DARK_COLOR,
                    ),
                    SizedBox(width: MARGIN_MEDIUM),
                    Text(
                      "8:30 AM - 02:00 PM",
                      style: TextStyle(
                        color: isHomePage ? HINT_TEXT_COLOR : SECONDARY_DARK_COLOR,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
                SizedBox(height: MARGIN_MEDIUM),
                Row(
                  children: [
                    PatientAvatar(
                        screenHeight: screenHeight,
                        avatar: "assets/person_1.jpg"),
                    PatientAvatar(
                        screenHeight: screenHeight,
                        avatar: "assets/person_2.jpg"),
                    PatientAvatar(
                        screenHeight: screenHeight,
                        avatar: "assets/person_3.jpg"),
                  ],
                ),
              ],
            ),

            Positioned(
              // alignment: Alignment.bottomRight,
              bottom: 5,
              right: 0,
              child: Container(
                width: 35,
                height: 35,
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(93, 158, 246, 1.0),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.download_done,
                  color: Colors.white,
                  size: MARGIN_MEDIUM_3,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PatientAvatar extends StatelessWidget {
  PatientAvatar({
    required this.screenHeight,
    required this.avatar,
  });

  final double screenHeight;
  final String avatar;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: MARGIN_MEDIUM),
      child: CircleAvatar(
        radius: screenHeight / 42,
        backgroundImage: AssetImage(avatar),
      ),
    );
  }
}
