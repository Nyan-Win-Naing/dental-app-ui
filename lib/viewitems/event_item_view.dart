import 'package:dental_app/data/vos/event_vo.dart';
import 'package:dental_app/resources/colors.dart';
import 'package:dental_app/resources/dimens.dart';
import 'package:flutter/material.dart';

class EventItemView extends StatelessWidget {

  EventVO eventVo;

  EventItemView({required this.eventVo});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: MARGIN_LARGE),
      height: 100,
      decoration: BoxDecoration(
        color: (!eventVo.isFinish) ? Colors.white : Color.fromRGBO(255, 255, 255, 0.7),
        borderRadius: BorderRadius.circular(MARGIN_MEDIUM_2),
        boxShadow: [
          const BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.2),
            offset: Offset(0, 2),
            spreadRadius: 0,
            blurRadius: 6,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: MARGIN_LARGE),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: (!eventVo.isFinish) ? Color.fromRGBO(207, 231, 251, 1.0) : Color.fromRGBO(255, 255, 255, 0.6),
                shape: BoxShape.circle,
              ),
              child: Image.asset(
                eventVo.image,
                scale: 3,
              ),
            ),
            SizedBox(width: MARGIN_MEDIUM_2),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  eventVo.name,
                  style: TextStyle(
                    color: (!eventVo.isFinish) ? SECONDARY_DARK_COLOR : Color.fromRGBO(0, 0, 0, 0.2),
                    fontSize: MARGIN_MEDIUM_2,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: MARGIN_MEDIUM),
                Row(
                  children: [
                    Icon(
                      Icons.access_time,
                      color: (!eventVo.isFinish) ? Color.fromRGBO(0, 0, 0, 0.3) : Color.fromRGBO(0, 0, 0, 0.2),
                      size: MARGIN_MEDIUM_3,
                    ),
                    SizedBox(width: MARGIN_MEDIUM),
                    Text(
                      eventVo.time,
                      style: TextStyle(
                        color: (!eventVo.isFinish) ? Color.fromRGBO(0, 0, 0, 0.3) : Color.fromRGBO(0, 0, 0, 0.2),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
