import 'package:aqueduct/aqueduct.dart';
import 'package:heroes/heroes.dart';
import 'package:heroes/model/user.dart';
// import 'package:heroes/model/experiment.dart';

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
class ExperimentController extends ResourceController {
  ExperimentController(this.context);

  final ManagedContext context;
  //（前端给我们一对id；数组）

@Operation.post('username')
Future<Response> createNote() async {
  final Map<String,dynamic> body = await request.body.decode();
  final query = Query<User>(context)
    ..values.username = body['username'] as String
    ..values.i = body['i'] as double 
    ..values.r =body['r'] as double
    ..values.u = body['u'] as double;

  final inserteduser = await query.insert();

  return Response.ok(inserteduser);
}
}
  //  @Operation.post()
  //     FutureOr <Response> createChat(@Bind.body() Chat chat) async {
  //       // POST /project

  //       print("post");
  //       final Map<String, dynamic> body = await request.body.decode();
  //       final name =body['name'] as String;
  //       print(" 1) name ==> $name");

  //       //return Response.ok({"key": "value"});
  //     }
//   @Operation.post()//添加一篇文章
//   FutureOr<Response> insertExperiment(
//       @Bind.body() Experiment time) async {
//     Experiment.time = DateTime.now();
//   //  Experiment.u= new   
// //插入一条数据
//     final result = await context.insertObject<Experiment>(time);
//     return Response.ok(result);
//   }
  // @Operation.post()
  // Future<Response> addCity(@Bind.body() City city) async {
  //   final insertedCity = await context.insertObject(city);

  //   return Response.ok(insertedCity);
  // }
//    @Operation.post() //添加一篇文章
//   FutureOr<Response> insertArticle(
//       @Bind.body(ignore: ["createData"]) Article article) async {
// //这里可以直接转为实体，但需要注意的是@Bind.body里的参数含义如下
// //ignore表示忽略哪些字段
// //reject表示拒绝接收哪些字段
// //require表示哪些字段必须有
// //啥都不填表示参数如果不传则为空
//     article.createDate = DateTime.now();
// //插入一条数据
//     final result = await context.insertObject<Article>(article);
//     return Result.data(result);
//     return Response.ok(hero);
//   }