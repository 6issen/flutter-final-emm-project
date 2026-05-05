import 'package:drift/drift.dart';

class RoutesTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get locomotiveNumber => text()();
  TextColumn get section => text()();
  TextColumn get partnerName => text()();
  DateTimeColumn get callTime => dateTime()();
  DateTimeColumn get acceptTime => dateTime()();
  DateTimeColumn get releaseTime => dateTime().nullable()(); // Может быть null, пока не сдали
  RealColumn get startMeter => real()();
  RealColumn get endMeter => real().nullable()();
}
