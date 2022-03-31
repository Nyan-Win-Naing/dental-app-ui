import 'package:dental_app/resources/dimens.dart';
import 'package:dental_app/viewitems/patient_view.dart';
import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';

class PatientListHorizontalView extends StatelessWidget {
  bool isHomePage;
  Function onTapPatient;

  PatientListHorizontalView({
    required this.isHomePage,
    required this.onTapPatient,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 145,
      width: MediaQuery.of(context).size.width,
      // color: Colors.green,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.only(left: MARGIN_LARGE),
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () => onTapPatient(),
            child: Column(
              children: [
                PatientView(isHomePage: isHomePage),
              ],
            ),
          );
        },
      ),
    );
  }
}
