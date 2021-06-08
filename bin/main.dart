import 'package:alfred/alfred.dart';
import 'package:hive/hive.dart';
import 'hive/counter_box.dart';
import 'hive/email_to_uid_box.dart';
import 'models/user.dart';

Future<void> main() async {
  await configHive();
  //await configServer();
  final user =
      User(name: 'Rahul Badgujar', email: 'rahul@tenfins', city: 'Nashik');
  print('User object 32 bit hash: ${user.hash32bitString}');
  print('User object 32 bit hash: ${user.hash32bitString.length}');
}

Future<void> configHive() async {
  Hive.init('hive_data');
  await CounterBox().init();
  await EmailToUidBox().init();
}

Future<void> configServer() async {
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
