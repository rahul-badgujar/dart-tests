import 'dart:typed_data';

import 'package:crypto/crypto.dart';

class StringHash {
  static Uint8List hashBytes(Uint8List objectBytes, {Hash hash = sha256}) {
    final digest = hash.convert(objectBytes);
    final hashBytes = Uint8List.fromList(digest.bytes);
    return hashBytes;
  }

  static Uint8List foldTo4Bytes(Uint8List bytesList) {
    const FOLD_SIZE = 4;
    final length = bytesList.length;
    final resultantFold = Uint8List(FOLD_SIZE);
    for (var i = 0; i < length; ++i) {
      final correspondingIndexForFold = i % FOLD_SIZE;
      resultantFold[correspondingIndexForFold] += bytesList[i];
    }
    return resultantFold;
  }
}
