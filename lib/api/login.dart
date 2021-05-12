import 'package:ibr/ibr.dart';

class Login {
  String mobile;
  Login({this.mobile});

  Future<bool> requestVerificationCode() async {
    Response response = await post(Uri.parse(endpoint + "user/request_login"),
        headers: headers,
        body: {
          'mobile': this.mobile,
        });
    if (response.statusCode == 200) {
      return true;
    } else if (response.statusCode == 400) {
      return false;
    } else {
      throw Exception('Error: statusCode= ${response.statusCode}');
    }
  }
}
