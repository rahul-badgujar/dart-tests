import 'package:alfred/alfred.dart';
import 'package:hive/hive.dart';

import 'hive/counter_box.dart';
import 'hive/email_to_uid_box.dart';

Future<void> main() async {
  Hive.init('hive_data');
  await CounterBox().init();
  await EmailToUidBox().init();
  final app = Alfred();

  app.all('/example', (req, res) => 'Hello world');

  app.get('/uidForEmail/:email', (req, res) {
    final email = req.params['email'];
    int? uid;
    if (email != null) {
      uid = EmailToUidBox().addEmail(email: email);
    }
    return {
      'email': email,
      'uid': uid,
    };
  });

  await app.listen(8000);
}
