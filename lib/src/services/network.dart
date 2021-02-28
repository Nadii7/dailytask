import 'dart:convert';
import 'package:dailytask/src/models/doctor.dart';
import 'package:dailytask/src/models/vendor.dart';
import 'package:http/http.dart' as http;

class NetworkService {
  final doctorURL = 'https://rojetah.com/app_services/getDoctorSettings2';
  final vendorURL = 'https://rojetah.com/app_services/getVendorSettings2';

  Future<void> postDoctorData(Doctor doctor) async {
    final response = await http.post(
      doctorURL,
      body: json.encode({
        'return': doctor.doctorReturn,
      }),
    );
    if (response.statusCode == 200) {
      return Doctor.fromJson(json.decode(response.body));
    } else {
      return null;
    }
  }

  Future<void> postVendorData(Vendor vendor) async {
    final response = await http.post(
      vendorURL,
      body: json.encode({"return": vendor.vendorReturn}),
    );
    if (response.statusCode == 200) {
      return print(response.body);
    } else {
      return print("Kosomak");
    }
  }
}
