import 'dart:async';
import 'package:aqueduct/aqueduct.dart';   

class Migration1 extends Migration { //自动创建数据库，跟channel里面的东西一样
  @override
  Future upgrade() async {
   		database.createTable(SchemaTable("_Hero", [SchemaColumn("id", ManagedPropertyType.bigInteger, isPrimaryKey: true, autoincrement: true, isIndexed: false, isNullable: false, isUnique: false),SchemaColumn("name", ManagedPropertyType.string, isPrimaryKey: false, autoincrement: false, isIndexed: false, isNullable: false, isUnique: true)]));
  }//这张表叫hero，有一个column叫id，数字类型，是否主键，……类似的还有name
  //这些从model里面来，这一整块自动生成
  
  @override
  Future downgrade() async {}
  
  @override
  Future seed() async {
     final heroNames = ["Mr. Nice", "Narco", "Bombasto", "Celeritas", "Magneta"];

  for (final heroName in heroNames) {    
    await database.store.execute("INSERT INTO _Hero (name) VALUES (@name)", substitutionValues: {
      "name": heroName
    });
  }
  // aqueduct db upgrade --connect postgres://iflyup:729@3663@13.115.53.84:5432/heroes
  }
}
    