import 'package:ibr/ibr.dart';

class SearchHandler extends ChangeNotifier {
  int charLength = 0;
  void setCharLength(int length) {
    this.charLength = length;
    notifyListeners();
  }
}
