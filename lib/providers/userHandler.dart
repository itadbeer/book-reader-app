import 'package:ibr/ibr.dart';
import '../models/user.dart';

class UserHandler extends ChangeNotifier {
  User user;
  UserHandler() {
    this.user = User();
  }

  void updateMobile(newMobile) {
    this.user.setMobile(newMobile);
  }
}
