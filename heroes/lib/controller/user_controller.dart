import 'package:aqueduct/aqueduct.dart';
import 'package:heroes/heroes.dart';
import 'package:heroes/model/user.dart';
// class HeroesController extends ResourceController {
//   HeroesController(this.context);

//   final ManagedContext context;
//   final _heroes = [
//     {'id': 11, 'name': 'Mr. Nice'},
//     {'id': 12, 'name': 'Narco'},
//     {'id': 13, 'name': 'Bombasto'},
//     {'id': 14, 'name': 'Celeritas'},
//     {'id': 15, 'name': 'Magneta'},    
//   ];

// //   @Operation.get()
//   Future<Response> getAllHeroes() async {
//     final heroQuery = Query<Hero>(context);
//     final heroes = await heroQuery.fetch();

//     return Response.ok(heroes);
//   }


// // class HeroesController extends Controller {
// //   final _heroes = [
// //     {'id': 11, 'name': 'Mr. Nice'},
// //     {'id': 12, 'name': 'Narco'},
// //     {'id': 13, 'name': 'Bombasto'},
// //     {'id': 14, 'name': 'Celeritas'},
// //     {'id': 15, 'name': 'Magneta'},    
// //   ];
// // class HeroesController extends ResourceController {
// //    HeroesController(this.context);

// //   final ManagedContext context;  
// //    final _heroes = [
// //     {'id': 11, 'name': 'Mr. Nice'},
// //     {'id': 12, 'name': 'Narco'},
// //     {'id': 13, 'name': 'Bombasto'},
// //     {'id': 14, 'name': 'Celeritas'},
// //     {'id': 15, 'name': 'Magneta'},
// //   ];

//   // @Operation.get()
//   // Future<Response> getAllHeroes() async {
//   //   return Response.ok(_heroes);
//   // }

//   // @Operation.get('id')
//   // Future<Response> getHeroByID() async {
//   //   final id = int.parse(request.path.variables['id']);
//   //   final hero = _heroes.firstWhere((hero) => hero['id'] == id, orElse: () => null);
//   //   if (hero == null) {
//   //     return Response.notFound();
//   //   }

//   //   return Response.ok(hero);
//   // }

//   // @override
//   // Future<RequestOrResponse> handle(Request request) async {
//   //   return Response.ok(_heroes);

// // @Operation.get('id')
// // Future<Response> getHeroByID(@Bind.path('id') int id) async {
// //   final hero = _heroes.firstWhere((hero) => hero['id'] == id, orElse: () => null);

// //   if (hero == null) {
// //     return Response.notFound();
// //   }

// //   return Response.ok(hero);
// // }
// @Operation.get('id')
// Future<Response> getHeroByID(@Bind.path('id') int id) async {
//   final heroQuery = Query<Hero>(context)
//     ..where((h) => h.id).equalTo(id);    

//   final hero = await heroQuery.fetchOne();

//   if (hero == null) {
//     return Response.notFound();
//   }
//   return Response.ok(hero);
// }

// }
// //   @override
// // Future<RequestOrResponse> handle(Request request) async {
// //   if (request.path.variables.containsKey('id')) {
// //     final id = int.parse(request.path.variables['id']);
// //     final hero = _heroes.firstWhere((hero) => hero['id'] == id, orElse: () => null);
// //     if (hero == null) {
// //       return Response.notFound();
// //     }

// //     return Response.ok(hero);
// //   }

// //   return Response.ok(_heroes);
// // }
  
// import 'package:aqueduct/aqueduct.dart';
// import 'package:heroes/heroes.dart';
// import 'package:heroes/model/hero.dart';
class UserController extends ResourceController {
   UserController(this.context);

  final ManagedContext context;

@Operation.get('username')
Future<Response> getAllHeroes({@Bind.query('username') String username}) async {
  final heroQuery = Query<User>(context);
  if (username != null) {
    heroQuery.where((user) => user.username).contains(username, caseSensitive: false);
  }
  final heroes = await heroQuery.fetch();
     if (heroes != null)
     { return Response.ok("ok");}

   if (heroes == null) {
      return Response.notFound();
     }


  @Operation.get()
  Future<Response> getAllHeroes() async {
 
    final heroQuery = Query<User>(context);
    final heroes = await heroQuery.fetch();
   if (username == null) {
      return Response.notFound();
    return Response.ok(heroes);
  }
// @Operation.post()//post侧重于数据的增加，可以用来注册
//   Future<Response> postID() async {
//     final loginQuery = Query<Hero>(context)..where((h) => h.id).equalTo(id);//QUERY<__>创建新的[查询]查询将被发送到[上下文]描述的数据库。
//   }
  @Operation.post('login')
  Future<Response> getHeroByID(@Bind.path('username') String username) async {
      print(username);
    final heroQuery = Query<User>(context)..where((user) => user.username).equalTo(username);//final是不更改的变量，这里是把id赋给变量
//从request里面取数据，context帮助我们去request里面取数据
    final hero = await heroQuery.fetchOne();//fetchone从数据库中获取int类型的变量

    if (hero == null) {
      return Response.notFound();
    }
    //  if (request.path.variables.containsKey('id')) {
    // final id = int.parse(request.path.variables['id']);
    // final hero = _heroes.firstWhere((hero) => hero['id'] == id, orElse: () => null);
    // if (hero == null) {
    //   return Response.notFound();
    // }
    return Response.ok("");
  }
  @Operation.post('login')
  Future<Response> login(@Bind.path('username') String username) async {
      print(username);
//     final heroQuery = Query<User>(context)..where((user) => user.username).equalTo(username);//final是不更改的变量，这里是把id赋给变量
// //从request里面取数据，context帮助我们去request里面取数据
//     final hero = await heroQuery.fetchOne();//fetchone从数据库中获取int类型的变量

//     if (hero == null) {
//       return Response.notFound();
//     }
    //  if (request.path.variables.containsKey('id')) {
    // final id = int.parse(request.path.variables['id']);
    // final hero = _heroes.firstWhere((hero) => hero['id'] == id, orElse: () => null);
    // if (hero == null) {
    //   return Response.notFound();
    // }
    return Response.ok("");
  }
  //  @override
  // Future<RequestOrResponse> handle(Request request) async {
  //   return Response.ok(_login);
  // }
  
}
}}