import 'package:dental_app/custom_painter/custom_painter_demo.dart';
import 'package:dental_app/resources/colors.dart';
import 'package:dental_app/resources/dimens.dart';
import 'package:dental_app/widgets/page_category_header_view.dart';
import 'package:dental_app/widgets/patient_list_horizontal_view.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(APP_BAR_HEIGHT),
        child: AppBar(
          elevation: 0,
          backgroundColor: PRIMARY_COLOR,
          automaticallyImplyLeading: false,
          flexibleSpace: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: MARGIN_LARGE),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child:
                        AppBarIconItemView(iconData: Icons.arrow_back_rounded),
                  ),
                  Text(
                    "Today",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: MARGIN_MEDIUM_3,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Row(
                    children: [
                      AppBarIconItemView(
                          iconData: Icons.search, isActionIcon: true),
                      SizedBox(width: MARGIN_MEDIUM_2),
                      AppBarIconItemView(
                          iconData: Icons.menu_rounded, isActionIcon: true),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: TIME_AND_EVENT_BACKGORUND_COLOR,
        child: Stack(
          children: [
            Container(
              height: screenHeight * 1.2 / 2,
              child: Stack(
                children: [
                  Column(
                    children: [
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(horizontal: MARGIN_LARGE),
                        height: screenHeight * 0.6 / 2,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                PRIMARY_COLOR,
                                Color.fromRGBO(36, 102, 194, 1.0),
                                // Color.fromRGBO(94, 126, 173, 1.0),
                              ]),
                        ),
                        child: PageCategoryHeaderView(
                            title: "Office No. 248", description: "3 patients"),
                      ),
                      Container(
                        width: double.infinity,
                        height: screenHeight * 0.6 / 2,
                        color: PRIMARY_COLOR_DARK,
                      )
                    ],
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      height: 330,
                      width: 330,
                      child: CustomPainterDemo(),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 60,
              child: PatientListHorizontalView(
                isHomePage: false,
                onTapPatient: () => _navigateToPatientDetailsScreen(context),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToPatientDetailsScreen(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => DetailPage()));
  }
}

class AppBarIconItemView extends StatelessWidget {
  IconData iconData;
  bool isActionIcon;

  AppBarIconItemView({required this.iconData, this.isActionIcon = false});

  @override
  Widget build(BuildContext context) {
    return Icon(
      iconData,
      color: Colors.white,
      size: !isActionIcon ? MARGIN_XLARGE : MARGIN_LARGE,
    );
  }
}
