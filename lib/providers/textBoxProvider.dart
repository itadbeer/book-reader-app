import 'package:flutter/foundation.dart';
import 'package:ibr/ibr.dart';

enum TextBoxState { normal, active, disabled }

class TextBoxProvider extends ChangeNotifier {
  TextBoxState state;
  TextBoxProvider(this.state);
  void setSate(TextBoxState newState) {
    this.state = newState;
    notifyListeners();
  }
}
