import 'heroes.dart';
import 'controller/user_controller.dart';
import 'controller/report_controller.dart';
import 'controller/experiment_controller.dart';
import 'controller/heroes_controller.dart';



/// This type initializes an application.
///
/// Override methods in this class to set up routes and initialize services like
/// database connections. See http://aqueduct.io/docs/http/channel/.
class AppChannel extends ApplicationChannel {

 ManagedContext context;
  @override
  Future prepare() async {
    CORSPolicy.defaultPolicy.allowedOrigins = ["http://127.0.0.1:8082/"];
    logger.onRecord.listen((rec) => print("$rec ${rec.error ?? ""} ${rec.stackTrace ?? ""}"));
    final config = UserConfig(options.configurationFilePath);//连接config里面的数据库
    final dataModel = ManagedDataModel.fromCurrentMirrorSystem();//代码到数据库的映射
     final persistentStore = PostgreSQLPersistentStore.fromConnectionInfo(
      config.database.username,
      config.database.password,
      config.database.host,
      config.database.port,
      config.database.databaseName);


    context = ManagedContext(dataModel, persistentStore);
  }

 
  @override
  Controller get entryPoint {
    final router = Router();
     router
      .route("/example")
      .linkFunction((request) async {
        return Response.ok({"key": "value"});
      });

      router
    .route("/user/[:username]")
    .link(() => UserController(context));

      router
      .route("/experiment/[:username]")
      .link(()=>ExperimentController(context));
      
      router
    .route("/report/[:username]")
    .link(() => ReportController(context));
    
    
    // router
    // .route("/user/[:username]")
    // .link(()=> UserController(context));
      // router
      // .route("/user")
      //  .linkFunction((request) async {
      //   return Response.ok({"key": "value"});
      // });
      // .link(() => UserController(context))

      // router
      // .route("/experiment/[:username]")
      // .link(() => ExperimentController(context));

       // router
      // .route("/heroes")
      // .link(() => HeroesController(context));
      
      
    return router;
  }
}

class UserConfig extends Configuration {
  UserConfig(String path): super.fromFile(File(path));

  DatabaseConfiguration database;
}