import 'package:dailytask/src/core/constants.dart';
import 'package:dailytask/src/models/vendor.dart';
import 'package:dailytask/src/services/network.dart';
import 'package:dailytask/src/widgets/saveButton.dart';
import 'package:dailytask/src/widgets/switchWidget.dart';
import 'package:dailytask/src/widgets/textWidget.dart';
import 'package:dailytask/src/widgets/unavailabilityWidgit.dart';
import 'package:dailytask/src/widgets/workingTimeWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SecondForm extends StatefulWidget {
  final String model;

  const SecondForm({Key key, @required this.model}) : super(key: key);

  @override
  _SecondFormState createState() => _SecondFormState();
}

class _SecondFormState extends State<SecondForm> {
  String receiveOrders = "0", workdaysType = "custom", discount;
  List day = [], dayFrom = [], dayTo = [], nightFrom = [], nightTo = [];
  List<DateTime> unavailabilityfrom = [], unavailabilityto = [];
  @override
  Widget build(BuildContext context) {
    final bool isPharmacy = widget.model == "Pharmacy" ? true : false;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SwitchWidget(
          title: isPharmacy ? "Receive prescriptions" : "Receive request",
          onChanged: (value) {
            setState(() {
              receiveOrders = value == true ? "1" : "0";
              print(receiveOrders);
            });
          },
        ),
        Divider(
          color: kBorderColor,
          height: 0.0,
        ),
        ListTile(
          tileColor: white,
          contentPadding: EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 15,
          ),
          title: Text(
            isPharmacy ? "discount on prescription" : "discount for request",
          ),
          trailing: TextWidget(
              width: 70,
              title: "%",
              length: 2,
              getValue: (value) {
                setState(() {
                  discount = value;
                  print(discount);
                });
              }),
        ),
        Divider(
          color: kBorderColor,
          height: 0.0,
        ),
        WorkingTimeWidget(
          title: "Working Time",
          isPharmacy: isPharmacy,
          workingType: (value) {
            setState(() {
              if (value == "0") workdaysType = "24/7";
              if (value == "1") workdaysType = "custom";
            });
          },
          daysList: (value) {
            setState(() {
              day.length = 1;
              day = value;
            });
          },
          dStartList: (value) {
            setState(() {
              dayFrom.length = 1;
              dayFrom = value;
            });
          },
          dEndList: (value) {
            setState(() {
              dayTo.length = 1;
              dayTo = value;
            });
          },
          nStartList: (value) {
            setState(() {
              nightFrom.length = 1;
              nightFrom = value;
            });
          },
          nEndList: (value) {
            setState(() {
              nightTo.length = 1;
              nightTo = value;
            });
          },
        ),
        Divider(
          color: kBorderColor,
          height: 0.0,
        ),
        UnAvailabilityWidget(
          startList: (value) {
            setState(() {
              unavailabilityfrom.length = 1;
              unavailabilityfrom = value;
            });
          },
          endList: (value) {
            setState(() {
              unavailabilityto = value;
            });
          },
        ),
        SaveButton(
          onPress: () async {
            if (discount != null) {
              NetworkService().postVendorData(
                Vendor(
                  vendorReturn: Return(
                    vendorType: widget.model,
                    receiveOrders: receiveOrders,
                    workdaysType: workdaysType,
                    discount: discount,
                    availabilityList: workdaysType != "custom"
                        ? []
                        : [
                            for (int j = 0; j < day.length; j++)
                              AvailabilityList(
                                wdayDayName: day[j],
                                wdayFrom: dayFrom[j],
                                wdayTo: dayTo[j],
                                wdayFrom2: nightFrom[j],
                                wdayTo2: nightTo[j],
                              ),
                          ],
                    unavailabilityList: [
                      for (int i = 0; i < unavailabilityfrom.length; i++)
                        UnavailabilityList(
                          from: unavailabilityfrom[i],
                          to: unavailabilityto[i],
                        )
                    ],
                  ),
                ),
              );
            } else {
              print("Failed");
            }
          },
        ),
      ],
    );
  }
}
