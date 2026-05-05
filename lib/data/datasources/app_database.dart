// Слой: data | Назначение: Drift AppDatabase — singleton, таблицы, маппер-расширения
import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:emm_final_project/data/models/route_model.dart';
import 'package:emm_final_project/data/models/station_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
part 'app_database.g.dart';

@DriftDatabase(tables: [RoutesTable, StationsTable])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}
