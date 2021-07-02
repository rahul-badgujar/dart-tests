import 'dart:convert';

import 'package:alfred/alfred.dart';
import 'package:hive/hive.dart';
import 'hive/counter_box.dart';
import 'hive/email_to_uid_box.dart';

Future<void> main() async {
  await configHive();
  await configServer();
}

Future<void> configHive() async {
  Hive.init('hive_data');
  await CounterBox().init();
  await EmailToUidBox().init();
}

Future<void> configServer() async {
  final app = Alfred();

  app.all('/example', (req, res) => 'Hello bhai... jaldi se fuck off ho jaa');

  app.post('/postreceive', (req, res) async {
    final body = await req.body;
    final bodyJson = json.decode(body.toString());
    final ts = DateTime.now();
    print('POST-RECEIVE');
    print('At: $ts');
    print('Body: $bodyJson');
  });

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

  await app.listen(3005);
}
