import 'dart:typed_data';
import '../extensions/int_extensions.dart';
import '../extensions/string_extensions.dart';

import '../hashing/string_hash.dart';

abstract class Model {
  String get hash32bitString {
    var hashString = '';
    hash32bit.forEach((e) {
      final bitsString = e.toFixedBitsString(8);
      hashString += bitsString;
    });
    return hashString;
  }

  Uint8List get hash32bit {
    final objectConvertedToString = toString();
    final objectBytes = objectConvertedToString.encodedToUint8List;
    final hashedBytes = StringHash.hashBytes(objectBytes);
    final foldOf4Bytes = StringHash.foldTo4Bytes(hashedBytes);
    return foldOf4Bytes;
  }

  @override
  String toString() {
    return toMap().toString();
  }

  Map<String, dynamic> toMap();
}
