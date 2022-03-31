import 'package:dental_app/data/vos/event_vo.dart';
import 'package:dental_app/resources/colors.dart';
import 'package:dental_app/resources/dimens.dart';
import 'package:dental_app/viewitems/event_item_view.dart';
import 'package:flutter/material.dart';

class SmartEventListView extends StatefulWidget {
  List<EventVO> eventList;
  final Function onListEndReached;

  SmartEventListView({
    required this.eventList,
    required this.onListEndReached,
  });

  @override
  State<SmartEventListView> createState() => _SmartEventListViewState();
}

class _SmartEventListViewState extends State<SmartEventListView> {

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
      color: TIME_AND_EVENT_BACKGORUND_COLOR,
      width: MediaQuery.of(context).size.width * 2.2 / 3,
      child: Stack(
        children: [
          (widget.eventList.length != 0)
              ? Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    color: HOME_PAGE_UNFINISHED_EVENTS_LIST_BACKGROUND_COLOR,
                    height: 290,
                  ),
                )
              : Container(),
          Align(
            alignment: Alignment.topCenter,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: MARGIN_MEDIUM_2),
                  child: Text(
                    "Events",
                    style: TextStyle(
                        color: SECONDARY_DARK_COLOR,
                        fontSize: MARGIN_MEDIUM_2,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Container(
                  height: 400,
                  padding: const EdgeInsets.only(
                    left: MARGIN_MEDIUM_2,
                    top: MARGIN_XLARGE,
                    bottom: MARGIN_XXLARGE,
                    right: MARGIN_MEDIUM_2,
                  ),
                  child: (widget.eventList.length != 0)
                      ? RefreshIndicator(
                          onRefresh: () async {},
                          color: Colors.white,
                          backgroundColor: PRIMARY_COLOR,
                          child: ListView.builder(
                            controller: _scrollController,
                            itemCount: 4,
                            itemBuilder: (BuildContext context, int index) {
                              return EventItemView(eventVo: widget.eventList[index]);
                            },
                          ),
                        )
                      : Text(
                          "No data in event list",
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
          ),
        ],
      ),
    );
  }
}
