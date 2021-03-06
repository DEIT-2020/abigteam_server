import 'heroes.dart';
import 'controller/user_controller.dart';
import 'controller/report_controller.dart';
import 'controller/experiment_controller.dart';



/// This type initializes an application.
///
/// Override methods in this class to set up routes and initialize services like
/// database connections. See http://aqueduct.io/docs/http/channel/.
class AppChannel extends ApplicationChannel {

 ManagedContext context;
  @override
  Future prepare() async {
    //CORSPolicy.defaultPolicy.allowedOrigins = ["http://127.0.0.1:8080/"];
    //CORSPolicy.defaultPolicy.allowedOrigins = ["http://127.0.0.1:8080/#/login"];
    //CORSPolicy.defaultPolicy.allowedOrigins = ["http://127.0.0.1:8080/#/heroes"];
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