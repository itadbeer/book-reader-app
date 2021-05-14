import 'package:ibr/ibr.dart';
import 'package:ibr/models/user.dart';

class CodeVerification {
  final User user;
  CodeVerification(this.user);

  Future<bool> verifyCode(String token) async {
    Response response = await post(Uri.parse(endpoint + "user/verify_login"),
        headers: headers, body: {'mobile': user.mobile, 'token': token});
    if (response.statusCode == 200) {
      String data = response.body;
      return json.decode(data);
    } else {
      throw Exception('Error: statusCode= ${response.statusCode}');
    }
  }
}
