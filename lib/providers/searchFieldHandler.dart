import 'package:ibr/ibr.dart';

class SearchHandler extends ChangeNotifier {
  int charLength = 0;
  String text = "";

  void setText(String newText) {
    text = newText;
    notifyListeners();
  }

  void setCharLength(int length) {
    this.charLength = length;
    notifyListeners();
  }
}
