import 'dart:convert';

Doctor doctorFromJson(String str) => Doctor.fromJson(json.decode(str));

String doctorToJson(Doctor data) => json.encode(data.toJson());

class Doctor {
  Doctor({
    this.status,
    this.subMessage,
    this.doctorReturn,
    this.message,
  });

  int status;
  String subMessage;
  Return doctorReturn;
  String message;

  factory Doctor.fromJson(Map<String, dynamic> json) => Doctor(
        status: json["status"],
        subMessage: json["sub_message"],
        doctorReturn: Return.fromJson(json["return"]),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "sub_message": subMessage,
        "return": doctorReturn.toJson(),
        "message": message,
      };
}

class Return {
  Return({
    this.vendorId,
    this.vendorType,
    this.availabilityList,
  });

  String vendorId;
  String vendorType;
  List<AvailabilityList> availabilityList;

  factory Return.fromJson(Map<String, dynamic> json) => Return(
        vendorId: json["vendorId"],
        vendorType: json["vendorType"],
        availabilityList: List<AvailabilityList>.from(
            json["availabilityList"].map((x) => AvailabilityList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "vendorId": vendorId,
        "vendorType": vendorType,
        "availabilityList":
            List<dynamic>.from(availabilityList.map((x) => x.toJson())),
      };
}

class AvailabilityList {
  AvailabilityList({
    this.vendorAppointType,
    this.isActive,
    this.priceValue,
    this.availabilityTimeList,
  });

  String vendorAppointType;
  int isActive;
  String priceValue;
  List<AvailabilityTimeList> availabilityTimeList;

  factory AvailabilityList.fromJson(Map<String, dynamic> json) =>
      AvailabilityList(
        vendorAppointType: json["vendorAppointType"],
        isActive: json["isActive"],
        priceValue: json["priceValue"],
        availabilityTimeList: List<AvailabilityTimeList>.from(
            json["availabilityTimeList"]
                .map((x) => AvailabilityTimeList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "vendorAppointType": vendorAppointType,
        "isActive": isActive,
        "priceValue": priceValue,
        "availabilityTimeList":
            List<dynamic>.from(availabilityTimeList.map((x) => x.toJson())),
      };
}

class AvailabilityTimeList {
  AvailabilityTimeList({
    this.wdayDayName,
    this.wdayFrom,
    this.wdayTo,
    this.wdayFrom2,
    this.wdayTo2,
  });

  String wdayDayName;
  String wdayFrom;
  String wdayTo;
  String wdayFrom2;
  String wdayTo2;

  factory AvailabilityTimeList.fromJson(Map<String, dynamic> json) =>
      AvailabilityTimeList(
        wdayDayName: json["wday_day_name"],
        wdayFrom: json["wday_from"],
        wdayTo: json["wday_to"],
        wdayFrom2: json["wday_from_2"],
        wdayTo2: json["wday_to_2"],
      );

  Map<String, dynamic> toJson() => {
        "wday_day_name": wdayDayName,
        "wday_from": wdayFrom,
        "wday_to": wdayTo,
        "wday_from_2": wdayFrom2,
        "wday_to_2": wdayTo2,
      };
}
