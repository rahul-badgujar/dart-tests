import 'package:hive/hive.dart';

abstract class HiveBox<E> {
  String name;
  HiveBox({required this.name});

  Future<void> init() async {
    if (!Hive.isBoxOpen(name)) {
      await Hive.openBox<E>(name);
    }
  }

  Box<E> get box {
    return Hive.box<E>(name);
  }

  E? get({required String key, E? defaultValue}) {
    return box.get(key, defaultValue: defaultValue);
  }

  void set({required String key, required E value}) {
    box.put(key, value);
  }

  bool containsKey({required String key}) {
    return box.containsKey(key);
  }
}
