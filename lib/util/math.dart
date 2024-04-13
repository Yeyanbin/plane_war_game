
import 'dart:math';

final random = Random();


double getRandomNumber({double min = 0, double max = 1}) {
  var randomNum = random.nextDouble() * (max - min);
  return randomNum + min;
}
