import 'package:heroes/heroes.dart';

class User extends ManagedObject<_User> implements _User {}

class _User {
  @primaryKey //数据库主键
  int id;
  @Column(unique: true)
  String username;
  @Column(unique: true)
  int r;
  @Column(unique: true)
  int i;
  @Column(unique: true)
  int u;
}
