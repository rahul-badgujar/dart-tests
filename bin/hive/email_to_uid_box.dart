import 'counter_box.dart';
import 'hive_box.dart';

class EmailToUidBox extends HiveBox<int> {
  EmailToUidBox._() : super(name: 'emailToUid');
  static final instance = EmailToUidBox._();
  factory EmailToUidBox() {
    return instance;
  }

  int? addEmail({required String email}) {
    final alreadyPresent = isEmailAlreadyPresent(email);
    if (alreadyPresent) {
      return getUidForEmail(email);
    } else {
      return addEmailAllotingNewUid(email);
    }
  }

  int? getUidForEmail(String email) {
    return get(key: email);
  }

  int addEmailAllotingNewUid(String email) {
    final nextUid = CounterBox().nextUidForEmail;
    set(key: email, value: nextUid);
    CounterBox().moveToNextUidForEmail();
    return nextUid;
  }

  bool isEmailAlreadyPresent(String email) => containsKey(key: email);
}
