import 'package:ibr/ibr.dart';

bool isLoggedIn() {
  return GetStorage().read('mobile') != null &&
      GetStorage().read('mobile') != '';
}

void requiredLogin(BuildContext context) {
  if (!isLoggedIn()) {
    print("your are not logged in!");
    Navigator.pushReplacementNamed(context, '/login');
  } else {
    print("you'r logged in!");
  }
}
