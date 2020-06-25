import 'package:aqueduct/aqueduct.dart';
import 'package:heroes/heroes.dart';
import 'package:heroes/model/user.dart';
class ReportController extends ResourceController {
  ReportController(this.context);

  final ManagedContext context;

//    @Operation.get('username')
//   Future<Response> getHeroByID(@Bind.query('username') int username) async {
//     final userQuery = Query<User>(context)..where((user) => user.username).equalTo(username);//final是不更改的变量，这里是把id赋给变量
// //从request里面取数据，context帮助我们去request里面取数据
//     final hero = await userQuery.fetchOne();//fetchone从数据库中获取int类型的变量

//     if (hero == null) {
//       return Response.notFound();
//     }
// }
@Operation.get('username')
Future<Response> getAllHeroes({@Bind.query('username') String username}) async {
  final heroQuery = Query<User>(context);
  if (username != null) {
    heroQuery.where((user) => user.username).contains(username, caseSensitive: false);
  }
  final heroes = await heroQuery.fetch();

  return Response.ok(heroes);
}
}