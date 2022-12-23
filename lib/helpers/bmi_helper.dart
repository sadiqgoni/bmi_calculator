import 'dart:math';

double calculateBMI({required double height, required double weight}) {
  double bmi = weight / pow(height / 100, 2);
  return bmi;
}
