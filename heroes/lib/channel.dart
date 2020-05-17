// import 'heroes.dart';
// import 'controller/heroes_controller.dart';

// /// This type initializes an application.
// ///
// /// Override methods in this class to set up routes and initialize services like
// /// database connections. See http://aqueduct.io/docs/http/channel/.
// // class HeroesChannel extends ApplicationChannel {
//   /// Initialize services in this method.
//   ///
//   /// Implement this method to initialize services, read values from [options]
//   /// and any other initialization required before constructing [entryPoint].
//   ///
//   /// This method is invoked prior to [entryPoint] being accessed.
//   // @override
//   // Future prepare() async {
//   //   logger.onRecord.listen((rec) => print("$rec ${rec.error ?? ""} ${rec.stackTrace ?? ""}"));
//   // }

//   /// Construct the request channel.
//   ///
//   /// Return an instance of some [Controller] that will be the initial receiver
//   /// of all [Request]s.
//   ///
//   /// This method is invoked after [prepare].

// class HeroesChannel extends ApplicationChannel {
//   ManagedContext context;

//   @override
//   Future prepare() async {
//     logger.onRecord.listen((rec) => print("$rec ${rec.error ?? ""} ${rec.stackTrace ?? ""}"));

//     final dataModel = ManagedDataModel.fromCurrentMirrorSystem();
//     final persistentStore = PostgreSQLPersistentStore.fromConnectionInfo(
//       "heroes_user", "password", "localhost", 5432, "heroes");

//     context = ManagedContext(dataModel, persistentStore);
//   }

//   @override
// Controller get entryPoint {
//   final router = Router();

//   router
//     .route("/heroes/[:id]")
//     .link(() => HeroesController(context));


//   router
//     .route("/example")
//     .linkFunction((request) async {
//       return new Response.ok({"key": "value"});
//   });
//     router
//     .route('/users')
//     .link(() => APIKeyValidator())
//     .link(() => Authorizer.bearer())
//     .link(() => UsersController());

//   router
//     .route('/posts')
//     .link(() => APIKeyValidator())
//     .link(() => PostsController());

//   return router;
// }

// //   @override
// // Controller get entryPoint {
// //   final router = Router();

// //   router
// //   .route('/heroes/[:id]')
// //   .link(() => HeroesController());

// //   router
// //     .route('/heroes')
// //     .link(() => HeroesController());

// //   router
// //     .route('/example')
// //     .linkFunction((request) async {
// //       return Response.ok({'key': 'value'});
// //     });

// //   return router;
// // }
// @override
// Controller get entrypoint {
//   final router = Router();

//   router
//     .route('/users')
//     .link(() => APIKeyValidator())
//     .link(() => Authorizer.bearer())
//     .link(() => UsersController());

//   router
//     .route('/posts')
//     .link(() => APIKeyValidator())
//     .link(() => PostsController());

//   return router;
// }
// }
import 'heroes.dart';
import 'controller/heroes_controller.dart';
import 'controller/home_controller.dart';
import 'controller/login_controller.dart';
import 'controller/history_controller.dart';
import 'controller/report_controller.dart';
import 'controller/experiment_controller.dart';
import 'controller/trash_controller.dart';
import 'controller/app_controller.dart';
/// This type initializes an application.
///
/// Override methods in this class to set up routes and initialize services like
/// database connections. See http://aqueduct.io/docs/http/channel/.
class HeroesChannel extends ApplicationChannel {
  /// Initialize services in this method.
  ///
  /// Implement this method to initialize services, read values from [options]
  /// and any other initialization required before constructing [entryPoint].
  ///
  /// This method is invoked prior to [entryPoint] being accessed.
 ManagedContext context;
  @override
  Future prepare() async {
    logger.onRecord.listen((rec) => print("$rec ${rec.error ?? ""} ${rec.stackTrace ?? ""}"));
    final config = HeroConfig(options.configurationFilePath);
    final dataModel = ManagedDataModel.fromCurrentMirrorSystem();
     final persistentStore = PostgreSQLPersistentStore.fromConnectionInfo(
      config.database.username,
      config.database.password,
      config.database.host,
      config.database.port,
      config.database.databaseName);


    context = ManagedContext(dataModel, persistentStore);
  }

  /// Construct the request channel.
  ///
  /// Return an instance of some [Controller] that will be the initial receiver
  /// of all [Request]s.
  ///
  /// This method is invoked after [prepare].
  @override
  Controller get entryPoint {
    final router = Router();

    // Prefer to use `link` instead of `linkFunction`.
    // See: https://aqueduct.io/docs/http/request_controller/
    router
      .route("/example")
      .linkFunction((request) async {
        return Response.ok({"key": "value"});
      });
     router
      .route('/heroes')
      .link(() => HeroesController(context));
       router
      .route('/app')
      .link(() => AppController(context));
      router
      .route('/login')
      .link(() => LoginController(context));
      router
      .route('/home')
      .link(() => HomeController(context));
      router
      .route('/experiment')
      .link(() => ExperimentController(context));
      router
      .route('/trash')
      .link(() => TrashController(context));
      router
      .route('/report')
      .link(() => ReportController(context));
        router
      .route('/history')
      .link(() => HistoryController(context));
    return router;
  }
}

class HeroConfig extends Configuration {
  HeroConfig(String path): super.fromFile(File(path));

  DatabaseConfiguration database;
}