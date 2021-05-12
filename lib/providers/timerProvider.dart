import 'dart:async';
import 'package:ibr/ibr.dart';

class TimerProvider extends ChangeNotifier {
  StreamSubscription periodicSub;
  int counter;
  TimerProvider({this.counter});
  void startTimer() {
    periodicSub = new Stream.periodic(const Duration(seconds: 1))
        .take(counter)
        .listen((_) => {countDown()});
  }

  countDown() {
    counter--;
    notifyListeners();
  }
}
