import 'model.dart';

class User extends Model {
  String name;
  String email;
  String city;

  User({required this.name, required this.email, required this.city});

  @override
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'city': city,
    };
  }
}
