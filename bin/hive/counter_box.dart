import 'hive_box.dart';

class CounterBox extends HiveBox<int> {
  // singleton
  CounterBox._() : super(name: 'counterBox');
  static final instance = CounterBox._();
  factory CounterBox() {
    return instance;
  }

  static const String KEY_NEXT_UID_FOR_EMAIL = 'nextUidForEmail';

  int get nextUidForEmail {
    final value = get(key: KEY_NEXT_UID_FOR_EMAIL, defaultValue: 100);
    return value ?? 100;
  }

  void moveToNextUidForEmail() {
    final currentUid = nextUidForEmail;
    set(key: KEY_NEXT_UID_FOR_EMAIL, value: currentUid + 1);
  }
}
