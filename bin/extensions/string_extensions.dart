import 'dart:convert';
import 'dart:typed_data';

extension BinaryString on String {
  String padToFixedLength(int fixedBitsLength, {String paddingChar = '0'}) {
    final value = this;
    return value.padLeft(fixedBitsLength, paddingChar);
  }

  Uint8List get encodedToUint8List {
    final objectToString = this;
    final objectBytes = Utf8Encoder().convert(objectToString);
    return objectBytes;
  }
}
