import 'package:dental_app/components/smart_event_list_view.dart';
import 'package:dental_app/components/smart_time_list_view.dart';
import 'package:dental_app/dummy/dummy_event_list.dart';
import 'package:dental_app/dummy/dummy_time_list.dart';
import 'package:dental_app/pages/detail_page.dart';
import 'package:dental_app/resources/colors.dart';
import 'package:dental_app/resources/dimens.dart';
import 'package:dental_app/resources/strings.dart';
import 'package:dental_app/viewitems/patient_view.dart';
import 'package:dental_app/widgets/page_category_header_view.dart';
import 'package:dental_app/widgets/patient_list_horizontal_view.dart';
import 'package:flutter/material.dart';
import 'package:dotted_line/dotted_line.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final leadingWidth = screenWidth * 2 / 3;
    final avatarRadius = screenHeight / 25;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(130.0),
        child: AppBar(
          elevation: 0,
          backgroundColor: PRIMARY_COLOR,
          automaticallyImplyLeading: false,
          flexibleSpace: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: MARGIN_LARGE),
              child:
                  AppBarSearchAndProfileSectionView(leadingWidth: leadingWidth),
            ),
          ),
        ),
      ),
      body: Container(
        color: TIME_AND_EVENT_BACKGORUND_COLOR,
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PatientSectionView(
                    screenHeight: screenHeight,
                    onTapPatient: () => _navigateToPatientDetailsScreen(context),
                  ),
                  SizedBox(height: MARGIN_LARGE),
                  TimeAndEventsSectionView(),
                  SizedBox(height: MARGIN_XXLARGE + 30),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: FooterMenuSectionView(
                  screenHeight: screenHeight, screenWidth: screenWidth),
            ),
            Positioned(
              bottom: 30,
              left: 0,
              right: 0,
              child: PlusFooterButtonSectionView(),
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

class FooterMenuSectionView extends StatelessWidget {
  const FooterMenuSectionView({
    Key? key,
    required this.screenHeight,
    required this.screenWidth,
  }) : super(key: key);

  final double screenHeight;
  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: screenHeight * 0.3 / 3,
      padding: EdgeInsets.symmetric(horizontal: MARGIN_LARGE),
      child: Row(
        children: [
          FooterMenuIconItemView(iconData: Icons.home_filled),
          SizedBox(width: screenWidth / 11),
          FooterMenuIconItemView(
              iconData: Icons.calendar_today_outlined, isSelected: true),
          SizedBox(width: screenWidth / 2.9),
          FooterMenuIconItemView(iconData: Icons.access_time),
          SizedBox(width: screenWidth / 10),
          FooterMenuIconItemView(iconData: Icons.person_outline_outlined),
        ],
      ),
    );
  }
}

class AppBarSearchAndProfileSectionView extends StatelessWidget {
  const AppBarSearchAndProfileSectionView({
    Key? key,
    required this.leadingWidth,
  }) : super(key: key);

  final double leadingWidth;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: leadingWidth,
          height: 55,
          padding: const EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_3),
          decoration: BoxDecoration(
            color: const Color.fromRGBO(255, 255, 255, 0.2),
            borderRadius: BorderRadius.circular(MARGIN_LARGE),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Center(
                child: Container(
                  width: leadingWidth * 1.7 / 3,
                  child: const TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: HOME_PAGE_SEARCH_HINT_TEXT,
                      hintStyle: TextStyle(
                        color: HINT_TEXT_COLOR,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              const Icon(
                Icons.search,
                color: Colors.white,
              ),
            ],
          ),
        ),
        Stack(
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage("assets/profile_photo.jpg"),
                  fit: BoxFit.contain,
                ),
                borderRadius: BorderRadius.all(Radius.circular(50.0)),
                border: Border.all(
                  color: Colors.white,
                  width: 4.0,
                ),
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: const Center(
                  child: Text(
                    "4",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class TimeAndEventsSectionView extends StatelessWidget {
  const TimeAndEventsSectionView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.blue,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              TIME_AND_EVENT_BACKGORUND_COLOR,
              HOME_PAGE_UNFINISHED_EVENTS_LIST_BACKGROUND_COLOR,
            ]),
      ),
      height: 450,
      child: Padding(
        padding: EdgeInsets.only(left: MARGIN_LARGE),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SmartTimeListView(
              timeList: timeList,
              onListEndReached: () {
                _showSnackBar(context, 'Loading more data from time list');
              },
            ),
            const Padding(
              padding: EdgeInsets.only(top: 10),
              child: DividerForTimeAndEventSectionView(),
            ),
            // SizedBox(width: MARGIN_MEDIUM),
            SmartEventListView(
              eventList: eventList,
              onListEndReached: () {
                _showSnackBar(context, "Loading more data from event list");
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showSnackBar(BuildContext context, String message) {
    final scaffold = Scaffold.of(context);
    scaffold.showSnackBar(
      SnackBar(
        backgroundColor: PRIMARY_COLOR_DARK,
        content: Text(message, textAlign: TextAlign.center),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}

class DividerForTimeAndEventSectionView extends StatelessWidget {
  const DividerForTimeAndEventSectionView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const DottedLine(
          direction: Axis.vertical,
          lineLength: 145,
          lineThickness: 2.0,
          dashLength: 4.0,
          dashColor: Color.fromRGBO(0, 0, 0, 0.3),
          dashRadius: 0.0,
          dashGapLength: 10.0,
          dashGapColor: Colors.transparent,
          dashGapRadius: 0.0,
        ),
        Container(
          width: 15,
          height: 15,
          decoration: BoxDecoration(
              color: PRIMARY_COLOR,
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 3),
              boxShadow: const [
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.5),
                  offset: Offset(0, 1),
                  spreadRadius: 1,
                  blurRadius: 2,
                ),
              ]),
        ),
        const DottedLine(
          direction: Axis.vertical,
          lineLength: 200,
          lineThickness: 2.0,
          dashLength: 4.0,
          dashColor: Color.fromRGBO(0, 0, 0, 0.1),
          dashRadius: 0.0,
          dashGapLength: 0.0,
          dashGapColor: Colors.transparent,
          dashGapRadius: 0.0,
        ),
      ],
    );
  }
}

class FooterMenuIconItemView extends StatelessWidget {
  IconData iconData;
  bool isSelected;

  FooterMenuIconItemView({
    required this.iconData,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Icon(
      iconData,
      color: isSelected ? SECONDARY_COLOR : HOME_PAGE_FOOTER_MENU_ITEM_COLOR,
      size: MARGIN_XLARGE_2,
    );
  }
}

class PlusFooterButtonSectionView extends StatelessWidget {
  const PlusFooterButtonSectionView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: const BoxDecoration(
          color: WHITE_SECONDARY,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.3),
              offset: Offset(0, 3),
              blurRadius: 10,
              spreadRadius: 0.1,
            ),
          ]),
      child: Center(
        child: Container(
          width: 60,
          height: 60,
          decoration: const BoxDecoration(
              color: HOME_PAGE_PLUS_BACKGROUND_COLOR,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.3),
                  blurRadius: 2,
                  spreadRadius: 0.05,
                ),
              ]),
          child: Center(
            child: Icon(
              Icons.add,
              color: Colors.white,
              size: MARGIN_XLARGE,
            ),
          ),
        ),
      ),
    );
  }
}

class PatientSectionView extends StatelessWidget {
  const PatientSectionView({
    Key? key,
    required this.screenHeight,
    required this.onTapPatient,
  }) : super(key: key);

  final double screenHeight;
  final Function onTapPatient;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeight * 0.85 / 3,
      color: TIME_AND_EVENT_BACKGORUND_COLOR,
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: MARGIN_LARGE),
            color: PRIMARY_COLOR,
            // color: Colors.pink,
            height: screenHeight * 0.6 / 3,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                PageCategoryHeaderView(
                    title: "My Patients", description: "12 total"),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(66, 139, 249, 1.0),
                    borderRadius: BorderRadius.circular(MARGIN_MEDIUM),
                  ),
                  child: DropdownButton<String>(
                    dropdownColor: PRIMARY_COLOR,
                    value: "Today",
                    icon: const Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.white,
                    ),
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                    items: <String>["Today", "Tomorrow"].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                        ),
                      );
                    }).toList(),
                    onChanged: (_) {},
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: PatientListHorizontalView(
              isHomePage: true,
              onTapPatient: () => onTapPatient(),
            ),
          ),
        ],
      ),
    );
  }
}
