import 'dart:convert';

Vendor vendorFromJson(String str) => Vendor.fromJson(json.decode(str));

String vendorToJson(Vendor data) => json.encode(data.toJson());

class Vendor {
  Vendor({
    this.status,
    this.subMessage,
    this.vendorReturn,
    this.message,
  });

  int status;
  String subMessage;
  Return vendorReturn;
  String message;

  factory Vendor.fromJson(Map<String, dynamic> json) => Vendor(
        status: json["status"],
        subMessage: json["sub_message"],
        vendorReturn: Return.fromJson(json["return"]),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "sub_message": subMessage,
        "return": vendorReturn.toJson(),
        "message": message,
      };
}

class Return {
  Return({
    this.vendorId,
    this.vendorType,
    this.receiveOrders,
    this.workdaysType,
    this.discount,
    this.availabilityList,
    this.unavailabilityList,
  });

  String vendorId;
  String vendorType;
  String receiveOrders;
  String workdaysType;
  String discount;
  List<AvailabilityList> availabilityList;
  List<UnavailabilityList> unavailabilityList;

  factory Return.fromJson(Map<String, dynamic> json) => Return(
        vendorId: json["vendorId"],
        vendorType: json["vendorType"],
        receiveOrders: json["receiveOrders"],
        workdaysType: json["workdaysType"],
        discount: json["discount"],
        availabilityList: List<AvailabilityList>.from(
            json["availabilityList"].map((x) => AvailabilityList.fromJson(x))),
        unavailabilityList: List<UnavailabilityList>.from(
            json["unavailabilityList"]
                .map((x) => UnavailabilityList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "vendorId": vendorId,
        "vendorType": vendorType,
        "receiveOrders": receiveOrders,
        "workdaysType": workdaysType,
        "discount": discount,
        "availabilityList":
            List<dynamic>.from(availabilityList.map((x) => x.toJson())),
        "unavailabilityList":
            List<dynamic>.from(unavailabilityList.map((x) => x.toJson())),
      };
}

class AvailabilityList {
  AvailabilityList({
    this.wdayId,
    this.wdayAdvId,
    this.wdayDayName,
    this.wdayFrom,
    this.wdayTo,
    this.wdayFrom2,
    this.wdayTo2,
  });

  String wdayId;
  String wdayAdvId;
  String wdayDayName;
  String wdayFrom;
  String wdayTo;
  String wdayFrom2;
  String wdayTo2;

  factory AvailabilityList.fromJson(Map<String, dynamic> json) =>
      AvailabilityList(
        wdayId: json["wday_id"],
        wdayAdvId: json["wday_adv_id"],
        wdayDayName: json["wday_day_name"],
        wdayFrom: json["wday_from"],
        wdayTo: json["wday_to"],
        wdayFrom2: json["wday_from_2"],
        wdayTo2: json["wday_to_2"],
      );

  Map<String, dynamic> toJson() => {
        "wday_id": wdayId,
        "wday_adv_id": wdayAdvId,
        "wday_day_name": wdayDayName,
        "wday_from": wdayFrom,
        "wday_to": wdayTo,
        "wday_from_2": wdayFrom2,
        "wday_to_2": wdayTo2,
      };
}

class UnavailabilityList {
  UnavailabilityList({
    this.from,
    this.to,
  });

  DateTime from;
  DateTime to;

  factory UnavailabilityList.fromJson(Map<String, dynamic> json) =>
      UnavailabilityList(
        from: DateTime.parse(json["from"]),
        to: DateTime.parse(json["to"]),
      );

  Map<String, dynamic> toJson() => {
        "from": from.toIso8601String(),
        "to": to.toIso8601String(),
      };
}
