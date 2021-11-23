import 'package:collection/collection.dart';

class PomodoroBrain {
  PomodoroBrain(
      {this.quantity, this.lPomodoro, this.lShortBreak, this.lLongBreak});

  final int? quantity;
  final int? lPomodoro;
  final int? lShortBreak;
  final int? lLongBreak;

  List<int> pomodoros = <int>[];

  List<int> calculatePomodoros() {
    for (int i = 1; i <= (quantity ?? 0); i++) {
      pomodoros.add(lPomodoro!);
      if (i % 4 == 0) {
        pomodoros.add(lLongBreak!);
      } else {
        pomodoros.add(lShortBreak!);
      }
    }
    return pomodoros;
  }

  int getPomodoroQuantity() {
    return quantity!;
  }

  int getShortBreaksQuantity() {
    //var foundElements = pomodoros.where((e) => e == lShortBreak);
    //return foundElements.length;
    int foundElements = 0;
    for (int i = 1; i <= pomodoros.length; i++) {
      if (i % 2 == 0) {
        if (i % 8 == 0) {
        } else {
          foundElements++;
        }
      }
    }
    return foundElements;
  }

  int getLongBreaksQuantity() {
    //var foundElements = pomodoros.where((e) => e == lLongBreak);
    //return foundElements.length;
    int foundElements = 0;
    for (int i = 1; i <= pomodoros.length; i++) {
      if (i % 8 == 0) {
        foundElements++;
      }
    }
    return foundElements;
  }

  int getTotalTime() {
    int time = pomodoros.sum;
    return time;
  }
}
