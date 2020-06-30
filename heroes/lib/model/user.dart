import 'package:heroes/heroes.dart';

class User extends ManagedObject<_User> implements _User {}

class _User {
  @primaryKey //数据库主键
  double id;
  @Column(unique: false)
  String username;
  @Column(unique: false)
  double r;
  @Column(unique: false)
  double i;
  @Column(unique: false)
  double u;
}
