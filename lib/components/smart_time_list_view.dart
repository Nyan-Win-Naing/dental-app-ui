import 'package:dental_app/dummy/dummy_time_list.dart';
import 'package:dental_app/resources/colors.dart';
import 'package:dental_app/resources/dimens.dart';
import 'package:flutter/material.dart';

class SmartTimeListView extends StatefulWidget {
  List<String> timeList;
  final Function onListEndReached;

  SmartTimeListView({
    required this.timeList,
    required this.onListEndReached,
  });

  @override
  State<SmartTimeListView> createState() => _SmartTimeListViewState();
}

class _SmartTimeListViewState extends State<SmartTimeListView> {

  var _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      print("This is scroll controller");
      if(_scrollController.position.atEdge) {
        if(_scrollController.position.pixels == 0) {
          print("Start of the list reached");
        } else {
          print("End ot the list reached");
          widget.onListEndReached();
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Time",
            style: TextStyle(
                color: SECONDARY_DARK_COLOR,
                fontSize: MARGIN_MEDIUM_2,
                fontWeight: FontWeight.w500),
          ),
          Container(
            height: 400,
            // color: Colors.green,
            padding: EdgeInsets.only(
              top: MARGIN_XLARGE_2,
              bottom: MARGIN_XXLARGE,
            ),
            child: (widget.timeList.length != 0)
                ? RefreshIndicator(
                    onRefresh: () async {},
                    color: Colors.white,
                    backgroundColor: PRIMARY_COLOR,
                    child: ListView.builder(
                      controller: _scrollController,
                      itemCount: widget.timeList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: EdgeInsets.only(bottom: MARGIN_XXLARGE - 2),
                          child: Text(
                            "${widget.timeList[index]}",
                            style: TextStyle(
                              color: Color.fromRGBO(0, 0, 0, 0.3),
                              fontSize: MARGIN_MEDIUM_2,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        );
                      },
                    ),
                  )
                : Text(
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
