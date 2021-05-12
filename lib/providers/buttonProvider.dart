import 'package:ibr/ibr.dart';

enum ButtonState { normal, active, disabled }

class ButtonProvider extends ChangeNotifier {
  ButtonState state;
  ButtonProvider(this.state);
  void setSate(ButtonState newState) {
    this.state = newState;
    notifyListeners();
  }
}
