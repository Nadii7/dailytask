import 'package:dailytask/src/core/constants.dart';
import 'package:dailytask/src/widgets/addButton.dart';
import 'package:dailytask/src/widgets/dayTimeWidget.dart';
import 'package:flutter/material.dart';

import 'radioWidget.dart';

class WorkingTimeWidget extends StatefulWidget {
  final String title;
  final bool isPharmacy;
  final Function(List) daysList, dStartList, dEndList, nStartList, nEndList;
  final Function(String) workingType;

  const WorkingTimeWidget(
      {Key key,
      this.title,
      this.daysList,
      this.dStartList,
      this.dEndList,
      this.nStartList,
      this.nEndList,
      this.isPharmacy = false,
      this.workingType})
      : super(key: key);
  @override
  _WorkingTimeWidgetState createState() => _WorkingTimeWidgetState();
}

class _WorkingTimeWidgetState extends State<WorkingTimeWidget> {
  bool isEnabled = true;
  int id = 0;
  List<String> days = [],
      dayStart = [],
      dayEnd = [],
      nightStart = [],
      nightEnd = [];
  final List<Widget> list = new List<Widget>();

  @override
  void initState() {
    super.initState();
    days.length = 1;
    dayStart.length = 1;
    dayEnd.length = 1;
    nightStart.length = 1;
    nightEnd.length = 1;
    list.add(
      DayTimeWidget(
        dayData: (value) {
          setState(() {
            days[0] = value;
            widget.daysList(days);
          });
        },
        dayStart: (value) {
          setState(() {
            dayStart[0] = "${value.hour}:${value.minute}";
            widget.dStartList(dayStart);
          });
        },
        dayEnd: (value) {
          setState(() {
            dayEnd[0] = "${value.hour}:${value.minute}";
            widget.dEndList(dayEnd);
          });
        },
        nightStart: (value) {
          setState(() {
            nightStart[0] = "${value.hour}:${value.minute}";
            widget.nStartList(nightStart);
          });
        },
        nightEnd: (value) {
          setState(() {
            nightEnd[0] = "${value.hour}:${value.minute}";
            widget.nEndList(nightEnd);
          });
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            tileColor: white,
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(widget.title),
                ),
                widget.isPharmacy
                    ? RadioWidget(
                        getSelected: (value) {
                          widget.workingType("$value");
                          if (value == 0) {
                            setState(() {
                              isEnabled = false;
                            });
                          } else if (value == 1) {
                            setState(() {
                              isEnabled = true;
                            });
                          }
                        },
                      )
                    : SizedBox(),
              ],
            ),
            subtitle: Column(
              children: isEnabled ? list : [],
            ),
          ),
          isEnabled
              ? AddButton(
                  onPress: () {
                    id++;
                    days.length = id + 1;
                    dayStart.length = id + 1;
                    dayEnd.length = id + 1;
                    nightStart.length = id + 1;
                    nightEnd.length = id + 1;
                    setState(() {
                      list.add(
                        DayTimeWidget(
                          dayData: (value) {
                            setState(() {
                              days[id] = value;
                              widget.daysList(days);
                            });
                          },
                          dayStart: (value) {
                            setState(() {
                              dayStart[id] = "${value.hour}:${value.minute}";
                              widget.dStartList(dayStart);
                            });
                          },
                          dayEnd: (value) {
                            setState(() {
                              dayEnd[id] = "${value.hour}:${value.minute}";
                              widget.dEndList(dayEnd);
                            });
                          },
                          nightStart: (value) {
                            setState(() {
                              nightStart[id] = "${value.hour}:${value.minute}";
                              widget.nStartList(nightStart);
                            });
                          },
                          nightEnd: (value) {
                            setState(() {
                              nightEnd[id] = "${value.hour}:${value.minute}";
                              widget.nEndList(nightEnd);
                            });
                          },
                        ),
                      );
                    });
                  },
                )
              : SizedBox(),
        ],
      ),
    );
  }
}
