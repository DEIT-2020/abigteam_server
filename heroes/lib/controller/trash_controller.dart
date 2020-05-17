import 'package:aqueduct/aqueduct.dart';
import 'package:heroes/heroes.dart';
import 'package:heroes/model/hero.dart';

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
class TrashController extends ResourceController {
  
  
}
