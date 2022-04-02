import 'package:dental_app/dummy/dummy_time_list.dart';
import 'package:dental_app/resources/colors.dart';
import 'package:dental_app/resources/dimens.dart';
import 'package:flutter/material.dart';

class SmartTimeListView extends StatelessWidget {
  List<String> timeList;

  SmartTimeListView({
    required this.timeList,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Time",
            style: TextStyle(
                color: SECONDARY_DARK_COLOR,
                fontSize: MARGIN_MEDIUM_2,
                fontWeight: FontWeight.w500),
          ),
          Container(
            padding: const EdgeInsets.only(
              top: MARGIN_XLARGE_2,
              // bottom: MARGIN_XXLARGE,
            ),
            child: (timeList.length != 0)
                ? ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: timeList.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: EdgeInsets.only(bottom: MARGIN_XXLARGE - 2),
                  child: Text(
                    "${timeList[index]}",
                    style: TextStyle(
                      color: Color.fromRGBO(0, 0, 0, 0.3),
                      fontSize: MARGIN_MEDIUM_2,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                );
              },
            )
                : const Text(
              "No data in time list",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black45,
                fontSize: MARGIN_MEDIUM_2,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}