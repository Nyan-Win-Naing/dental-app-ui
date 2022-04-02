import 'package:dental_app/data/vos/event_vo.dart';
import 'package:dental_app/dummy/dummy_event_list.dart';
import 'package:dental_app/resources/colors.dart';
import 'package:dental_app/resources/dimens.dart';
import 'package:dental_app/viewitems/event_item_view.dart';
import 'package:flutter/material.dart';

class SmartEventListView extends StatelessWidget {
  List<EventVO> eventList;

  SmartEventListView({
    required this.eventList,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: TIME_AND_EVENT_BACKGORUND_COLOR,
      // color: Colors.pink,
      width: MediaQuery.of(context).size.width * 2.2 / 3,
      height: 580,
      child: Stack(
        children: [
          (eventList.length != 0)
              ? Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              color: HOME_PAGE_UNFINISHED_EVENTS_LIST_BACKGROUND_COLOR,
              height: 420,
            ),
          )
              : Container(),
          Column(
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
                padding: const EdgeInsets.only(
                  left: MARGIN_MEDIUM_2,
                  top: MARGIN_XLARGE,
                  right: MARGIN_MEDIUM_2,
                ),
                child: (eventList.length != 0)
                    ? ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: eventList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return EventItemView(
                        eventVo: eventList[index]);
                  },
                )
                    : const Text(
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
        ],
      ),
    );
  }
}
