import 'dart:math';
import 'string_extensions.dart';

extension Int on int {
  String get bitsString {
    var bitsString = '';
    var value = this;
    while (value > 0) {
      final bit = (value & 1) == 1;
      if (bit == true) {
        bitsString = '1' + bitsString;
      } else {
        bitsString = '0' + bitsString;
      }
      value >>= 1;
    }
    return bitsString;
  }

  int reducedToFixedBits(int length) {
    var value = this;
    final maxPossibleValue = pow(2, length).toInt();
    value %= maxPossibleValue;
    return value;
  }

  String toFixedBitsString(int length) {
    var value = this;
    if (value.isNegative) value *= -1;
    value = value.reducedToFixedBits(length);
    final bitsString = value.bitsString;
    final paddedString = bitsString.padToFixedLength(length);
    return paddedString;
  }
}
