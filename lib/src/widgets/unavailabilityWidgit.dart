import 'package:dailytask/src/core/constants.dart';
import 'package:dailytask/src/widgets/addButton.dart';
import 'package:dailytask/src/widgets/startEndWidget.dart';
import 'package:flutter/material.dart';

class UnAvailabilityWidget extends StatefulWidget {
  final Function(List) startList;
  final Function(List) endList;

  const UnAvailabilityWidget({Key key, this.endList, this.startList})
      : super(key: key);

  @override
  _UnAvailabilityWidgetState createState() => _UnAvailabilityWidgetState();
}

class _UnAvailabilityWidgetState extends State<UnAvailabilityWidget> {
  int id = 0;
  List<DateTime> start = [], end = [];
  final List<Widget> list = new List<Widget>();

  @override
  void initState() {
    super.initState();
    start.length = 1;
    end.length = 1;
    list.add(
      StartEndWidget(
        startTime: (value) {
          setState(() {
            start[0] = value;
            widget.startList(start);
          });
        },
        endTime: (value) {
          setState(() {
            end[0] = value;
            widget.endList(end);
          });
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          tileColor: white,
          contentPadding: EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 15,
          ),
          title: Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: Text("Unavailability"),
          ),
          subtitle: Column(
            children: list,
          ),
        ),
        AddButton(
          onPress: () {
            id++;
            start.length = id + 1;
            end.length = id + 1;
            setState(() {
              list.add(
                StartEndWidget(
                  startTime: (value) {
                    setState(() {
                      start[id] = value;
                      widget.startList(start);
                    });
                  },
                  endTime: (value) {
                    setState(() {
                      end[id] = value;
                      widget.endList(end);
                    });
                  },
                ),
              );
            });
          },
        )
      ],
    );
  }
}
