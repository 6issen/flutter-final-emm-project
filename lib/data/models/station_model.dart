import 'package:drift/drift.dart';
import 'route_model.dart';

class StationsTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get routeId => integer().references(RoutesTable, #id)();
  TextColumn get name => text()();
  DateTimeColumn get arrivalTime => dateTime()();
  DateTimeColumn get departureTime => dateTime()();
}