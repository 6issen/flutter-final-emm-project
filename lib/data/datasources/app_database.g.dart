// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $RoutesTableTable extends RoutesTable
    with TableInfo<$RoutesTableTable, RoutesTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RoutesTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _locomotiveNumberMeta =
      const VerificationMeta('locomotiveNumber');
  @override
  late final GeneratedColumn<String> locomotiveNumber = GeneratedColumn<String>(
      'locomotive_number', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _sectionMeta =
      const VerificationMeta('section');
  @override
  late final GeneratedColumn<String> section = GeneratedColumn<String>(
      'section', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _partnerNameMeta =
      const VerificationMeta('partnerName');
  @override
  late final GeneratedColumn<String> partnerName = GeneratedColumn<String>(
      'partner_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _callTimeMeta =
      const VerificationMeta('callTime');
  @override
  late final GeneratedColumn<DateTime> callTime = GeneratedColumn<DateTime>(
      'call_time', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _acceptTimeMeta =
      const VerificationMeta('acceptTime');
  @override
  late final GeneratedColumn<DateTime> acceptTime = GeneratedColumn<DateTime>(
      'accept_time', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _releaseTimeMeta =
      const VerificationMeta('releaseTime');
  @override
  late final GeneratedColumn<DateTime> releaseTime = GeneratedColumn<DateTime>(
      'release_time', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _startMeterMeta =
      const VerificationMeta('startMeter');
  @override
  late final GeneratedColumn<double> startMeter = GeneratedColumn<double>(
      'start_meter', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _endMeterMeta =
      const VerificationMeta('endMeter');
  @override
  late final GeneratedColumn<double> endMeter = GeneratedColumn<double>(
      'end_meter', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        locomotiveNumber,
        section,
        partnerName,
        callTime,
        acceptTime,
        releaseTime,
        startMeter,
        endMeter
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'routes_table';
  @override
  VerificationContext validateIntegrity(Insertable<RoutesTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('locomotive_number')) {
      context.handle(
          _locomotiveNumberMeta,
          locomotiveNumber.isAcceptableOrUnknown(
              data['locomotive_number']!, _locomotiveNumberMeta));
    } else if (isInserting) {
      context.missing(_locomotiveNumberMeta);
    }
    if (data.containsKey('section')) {
      context.handle(_sectionMeta,
          section.isAcceptableOrUnknown(data['section']!, _sectionMeta));
    } else if (isInserting) {
      context.missing(_sectionMeta);
    }
    if (data.containsKey('partner_name')) {
      context.handle(
          _partnerNameMeta,
          partnerName.isAcceptableOrUnknown(
              data['partner_name']!, _partnerNameMeta));
    } else if (isInserting) {
      context.missing(_partnerNameMeta);
    }
    if (data.containsKey('call_time')) {
      context.handle(_callTimeMeta,
          callTime.isAcceptableOrUnknown(data['call_time']!, _callTimeMeta));
    } else if (isInserting) {
      context.missing(_callTimeMeta);
    }
    if (data.containsKey('accept_time')) {
      context.handle(
          _acceptTimeMeta,
          acceptTime.isAcceptableOrUnknown(
              data['accept_time']!, _acceptTimeMeta));
    } else if (isInserting) {
      context.missing(_acceptTimeMeta);
    }
    if (data.containsKey('release_time')) {
      context.handle(
          _releaseTimeMeta,
          releaseTime.isAcceptableOrUnknown(
              data['release_time']!, _releaseTimeMeta));
    }
    if (data.containsKey('start_meter')) {
      context.handle(
          _startMeterMeta,
          startMeter.isAcceptableOrUnknown(
              data['start_meter']!, _startMeterMeta));
    } else if (isInserting) {
      context.missing(_startMeterMeta);
    }
    if (data.containsKey('end_meter')) {
      context.handle(_endMeterMeta,
          endMeter.isAcceptableOrUnknown(data['end_meter']!, _endMeterMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RoutesTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RoutesTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      locomotiveNumber: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}locomotive_number'])!,
      section: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}section'])!,
      partnerName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}partner_name'])!,
      callTime: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}call_time'])!,
      acceptTime: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}accept_time'])!,
      releaseTime: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}release_time']),
      startMeter: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}start_meter'])!,
      endMeter: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}end_meter']),
    );
  }

  @override
  $RoutesTableTable createAlias(String alias) {
    return $RoutesTableTable(attachedDatabase, alias);
  }
}

class RoutesTableData extends DataClass implements Insertable<RoutesTableData> {
  final int id;
  final String locomotiveNumber;
  final String section;
  final String partnerName;
  final DateTime callTime;
  final DateTime acceptTime;
  final DateTime? releaseTime;
  final double startMeter;
  final double? endMeter;
  const RoutesTableData(
      {required this.id,
      required this.locomotiveNumber,
      required this.section,
      required this.partnerName,
      required this.callTime,
      required this.acceptTime,
      this.releaseTime,
      required this.startMeter,
      this.endMeter});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['locomotive_number'] = Variable<String>(locomotiveNumber);
    map['section'] = Variable<String>(section);
    map['partner_name'] = Variable<String>(partnerName);
    map['call_time'] = Variable<DateTime>(callTime);
    map['accept_time'] = Variable<DateTime>(acceptTime);
    if (!nullToAbsent || releaseTime != null) {
      map['release_time'] = Variable<DateTime>(releaseTime);
    }
    map['start_meter'] = Variable<double>(startMeter);
    if (!nullToAbsent || endMeter != null) {
      map['end_meter'] = Variable<double>(endMeter);
    }
    return map;
  }

  RoutesTableCompanion toCompanion(bool nullToAbsent) {
    return RoutesTableCompanion(
      id: Value(id),
      locomotiveNumber: Value(locomotiveNumber),
      section: Value(section),
      partnerName: Value(partnerName),
      callTime: Value(callTime),
      acceptTime: Value(acceptTime),
      releaseTime: releaseTime == null && nullToAbsent
          ? const Value.absent()
          : Value(releaseTime),
      startMeter: Value(startMeter),
      endMeter: endMeter == null && nullToAbsent
          ? const Value.absent()
          : Value(endMeter),
    );
  }

  factory RoutesTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RoutesTableData(
      id: serializer.fromJson<int>(json['id']),
      locomotiveNumber: serializer.fromJson<String>(json['locomotiveNumber']),
      section: serializer.fromJson<String>(json['section']),
      partnerName: serializer.fromJson<String>(json['partnerName']),
      callTime: serializer.fromJson<DateTime>(json['callTime']),
      acceptTime: serializer.fromJson<DateTime>(json['acceptTime']),
      releaseTime: serializer.fromJson<DateTime?>(json['releaseTime']),
      startMeter: serializer.fromJson<double>(json['startMeter']),
      endMeter: serializer.fromJson<double?>(json['endMeter']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'locomotiveNumber': serializer.toJson<String>(locomotiveNumber),
      'section': serializer.toJson<String>(section),
      'partnerName': serializer.toJson<String>(partnerName),
      'callTime': serializer.toJson<DateTime>(callTime),
      'acceptTime': serializer.toJson<DateTime>(acceptTime),
      'releaseTime': serializer.toJson<DateTime?>(releaseTime),
      'startMeter': serializer.toJson<double>(startMeter),
      'endMeter': serializer.toJson<double?>(endMeter),
    };
  }

  RoutesTableData copyWith(
          {int? id,
          String? locomotiveNumber,
          String? section,
          String? partnerName,
          DateTime? callTime,
          DateTime? acceptTime,
          Value<DateTime?> releaseTime = const Value.absent(),
          double? startMeter,
          Value<double?> endMeter = const Value.absent()}) =>
      RoutesTableData(
        id: id ?? this.id,
        locomotiveNumber: locomotiveNumber ?? this.locomotiveNumber,
        section: section ?? this.section,
        partnerName: partnerName ?? this.partnerName,
        callTime: callTime ?? this.callTime,
        acceptTime: acceptTime ?? this.acceptTime,
        releaseTime: releaseTime.present ? releaseTime.value : this.releaseTime,
        startMeter: startMeter ?? this.startMeter,
        endMeter: endMeter.present ? endMeter.value : this.endMeter,
      );
  RoutesTableData copyWithCompanion(RoutesTableCompanion data) {
    return RoutesTableData(
      id: data.id.present ? data.id.value : this.id,
      locomotiveNumber: data.locomotiveNumber.present
          ? data.locomotiveNumber.value
          : this.locomotiveNumber,
      section: data.section.present ? data.section.value : this.section,
      partnerName:
          data.partnerName.present ? data.partnerName.value : this.partnerName,
      callTime: data.callTime.present ? data.callTime.value : this.callTime,
      acceptTime:
          data.acceptTime.present ? data.acceptTime.value : this.acceptTime,
      releaseTime:
          data.releaseTime.present ? data.releaseTime.value : this.releaseTime,
      startMeter:
          data.startMeter.present ? data.startMeter.value : this.startMeter,
      endMeter: data.endMeter.present ? data.endMeter.value : this.endMeter,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RoutesTableData(')
          ..write('id: $id, ')
          ..write('locomotiveNumber: $locomotiveNumber, ')
          ..write('section: $section, ')
          ..write('partnerName: $partnerName, ')
          ..write('callTime: $callTime, ')
          ..write('acceptTime: $acceptTime, ')
          ..write('releaseTime: $releaseTime, ')
          ..write('startMeter: $startMeter, ')
          ..write('endMeter: $endMeter')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, locomotiveNumber, section, partnerName,
      callTime, acceptTime, releaseTime, startMeter, endMeter);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RoutesTableData &&
          other.id == this.id &&
          other.locomotiveNumber == this.locomotiveNumber &&
          other.section == this.section &&
          other.partnerName == this.partnerName &&
          other.callTime == this.callTime &&
          other.acceptTime == this.acceptTime &&
          other.releaseTime == this.releaseTime &&
          other.startMeter == this.startMeter &&
          other.endMeter == this.endMeter);
}

class RoutesTableCompanion extends UpdateCompanion<RoutesTableData> {
  final Value<int> id;
  final Value<String> locomotiveNumber;
  final Value<String> section;
  final Value<String> partnerName;
  final Value<DateTime> callTime;
  final Value<DateTime> acceptTime;
  final Value<DateTime?> releaseTime;
  final Value<double> startMeter;
  final Value<double?> endMeter;
  const RoutesTableCompanion({
    this.id = const Value.absent(),
    this.locomotiveNumber = const Value.absent(),
    this.section = const Value.absent(),
    this.partnerName = const Value.absent(),
    this.callTime = const Value.absent(),
    this.acceptTime = const Value.absent(),
    this.releaseTime = const Value.absent(),
    this.startMeter = const Value.absent(),
    this.endMeter = const Value.absent(),
  });
  RoutesTableCompanion.insert({
    this.id = const Value.absent(),
    required String locomotiveNumber,
    required String section,
    required String partnerName,
    required DateTime callTime,
    required DateTime acceptTime,
    this.releaseTime = const Value.absent(),
    required double startMeter,
    this.endMeter = const Value.absent(),
  })  : locomotiveNumber = Value(locomotiveNumber),
        section = Value(section),
        partnerName = Value(partnerName),
        callTime = Value(callTime),
        acceptTime = Value(acceptTime),
        startMeter = Value(startMeter);
  static Insertable<RoutesTableData> custom({
    Expression<int>? id,
    Expression<String>? locomotiveNumber,
    Expression<String>? section,
    Expression<String>? partnerName,
    Expression<DateTime>? callTime,
    Expression<DateTime>? acceptTime,
    Expression<DateTime>? releaseTime,
    Expression<double>? startMeter,
    Expression<double>? endMeter,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (locomotiveNumber != null) 'locomotive_number': locomotiveNumber,
      if (section != null) 'section': section,
      if (partnerName != null) 'partner_name': partnerName,
      if (callTime != null) 'call_time': callTime,
      if (acceptTime != null) 'accept_time': acceptTime,
      if (releaseTime != null) 'release_time': releaseTime,
      if (startMeter != null) 'start_meter': startMeter,
      if (endMeter != null) 'end_meter': endMeter,
    });
  }

  RoutesTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? locomotiveNumber,
      Value<String>? section,
      Value<String>? partnerName,
      Value<DateTime>? callTime,
      Value<DateTime>? acceptTime,
      Value<DateTime?>? releaseTime,
      Value<double>? startMeter,
      Value<double?>? endMeter}) {
    return RoutesTableCompanion(
      id: id ?? this.id,
      locomotiveNumber: locomotiveNumber ?? this.locomotiveNumber,
      section: section ?? this.section,
      partnerName: partnerName ?? this.partnerName,
      callTime: callTime ?? this.callTime,
      acceptTime: acceptTime ?? this.acceptTime,
      releaseTime: releaseTime ?? this.releaseTime,
      startMeter: startMeter ?? this.startMeter,
      endMeter: endMeter ?? this.endMeter,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (locomotiveNumber.present) {
      map['locomotive_number'] = Variable<String>(locomotiveNumber.value);
    }
    if (section.present) {
      map['section'] = Variable<String>(section.value);
    }
    if (partnerName.present) {
      map['partner_name'] = Variable<String>(partnerName.value);
    }
    if (callTime.present) {
      map['call_time'] = Variable<DateTime>(callTime.value);
    }
    if (acceptTime.present) {
      map['accept_time'] = Variable<DateTime>(acceptTime.value);
    }
    if (releaseTime.present) {
      map['release_time'] = Variable<DateTime>(releaseTime.value);
    }
    if (startMeter.present) {
      map['start_meter'] = Variable<double>(startMeter.value);
    }
    if (endMeter.present) {
      map['end_meter'] = Variable<double>(endMeter.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RoutesTableCompanion(')
          ..write('id: $id, ')
          ..write('locomotiveNumber: $locomotiveNumber, ')
          ..write('section: $section, ')
          ..write('partnerName: $partnerName, ')
          ..write('callTime: $callTime, ')
          ..write('acceptTime: $acceptTime, ')
          ..write('releaseTime: $releaseTime, ')
          ..write('startMeter: $startMeter, ')
          ..write('endMeter: $endMeter')
          ..write(')'))
        .toString();
  }
}

class $StationsTableTable extends StationsTable
    with TableInfo<$StationsTableTable, StationsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $StationsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _routeIdMeta =
      const VerificationMeta('routeId');
  @override
  late final GeneratedColumn<int> routeId = GeneratedColumn<int>(
      'route_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES routes_table (id)'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _arrivalTimeMeta =
      const VerificationMeta('arrivalTime');
  @override
  late final GeneratedColumn<DateTime> arrivalTime = GeneratedColumn<DateTime>(
      'arrival_time', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _departureTimeMeta =
      const VerificationMeta('departureTime');
  @override
  late final GeneratedColumn<DateTime> departureTime =
      GeneratedColumn<DateTime>('departure_time', aliasedName, false,
          type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, routeId, name, arrivalTime, departureTime];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'stations_table';
  @override
  VerificationContext validateIntegrity(Insertable<StationsTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('route_id')) {
      context.handle(_routeIdMeta,
          routeId.isAcceptableOrUnknown(data['route_id']!, _routeIdMeta));
    } else if (isInserting) {
      context.missing(_routeIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('arrival_time')) {
      context.handle(
          _arrivalTimeMeta,
          arrivalTime.isAcceptableOrUnknown(
              data['arrival_time']!, _arrivalTimeMeta));
    } else if (isInserting) {
      context.missing(_arrivalTimeMeta);
    }
    if (data.containsKey('departure_time')) {
      context.handle(
          _departureTimeMeta,
          departureTime.isAcceptableOrUnknown(
              data['departure_time']!, _departureTimeMeta));
    } else if (isInserting) {
      context.missing(_departureTimeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  StationsTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return StationsTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      routeId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}route_id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      arrivalTime: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}arrival_time'])!,
      departureTime: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}departure_time'])!,
    );
  }

  @override
  $StationsTableTable createAlias(String alias) {
    return $StationsTableTable(attachedDatabase, alias);
  }
}

class StationsTableData extends DataClass
    implements Insertable<StationsTableData> {
  final int id;
  final int routeId;
  final String name;
  final DateTime arrivalTime;
  final DateTime departureTime;
  const StationsTableData(
      {required this.id,
      required this.routeId,
      required this.name,
      required this.arrivalTime,
      required this.departureTime});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['route_id'] = Variable<int>(routeId);
    map['name'] = Variable<String>(name);
    map['arrival_time'] = Variable<DateTime>(arrivalTime);
    map['departure_time'] = Variable<DateTime>(departureTime);
    return map;
  }

  StationsTableCompanion toCompanion(bool nullToAbsent) {
    return StationsTableCompanion(
      id: Value(id),
      routeId: Value(routeId),
      name: Value(name),
      arrivalTime: Value(arrivalTime),
      departureTime: Value(departureTime),
    );
  }

  factory StationsTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return StationsTableData(
      id: serializer.fromJson<int>(json['id']),
      routeId: serializer.fromJson<int>(json['routeId']),
      name: serializer.fromJson<String>(json['name']),
      arrivalTime: serializer.fromJson<DateTime>(json['arrivalTime']),
      departureTime: serializer.fromJson<DateTime>(json['departureTime']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'routeId': serializer.toJson<int>(routeId),
      'name': serializer.toJson<String>(name),
      'arrivalTime': serializer.toJson<DateTime>(arrivalTime),
      'departureTime': serializer.toJson<DateTime>(departureTime),
    };
  }

  StationsTableData copyWith(
          {int? id,
          int? routeId,
          String? name,
          DateTime? arrivalTime,
          DateTime? departureTime}) =>
      StationsTableData(
        id: id ?? this.id,
        routeId: routeId ?? this.routeId,
        name: name ?? this.name,
        arrivalTime: arrivalTime ?? this.arrivalTime,
        departureTime: departureTime ?? this.departureTime,
      );
  StationsTableData copyWithCompanion(StationsTableCompanion data) {
    return StationsTableData(
      id: data.id.present ? data.id.value : this.id,
      routeId: data.routeId.present ? data.routeId.value : this.routeId,
      name: data.name.present ? data.name.value : this.name,
      arrivalTime:
          data.arrivalTime.present ? data.arrivalTime.value : this.arrivalTime,
      departureTime: data.departureTime.present
          ? data.departureTime.value
          : this.departureTime,
    );
  }

  @override
  String toString() {
    return (StringBuffer('StationsTableData(')
          ..write('id: $id, ')
          ..write('routeId: $routeId, ')
          ..write('name: $name, ')
          ..write('arrivalTime: $arrivalTime, ')
          ..write('departureTime: $departureTime')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, routeId, name, arrivalTime, departureTime);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is StationsTableData &&
          other.id == this.id &&
          other.routeId == this.routeId &&
          other.name == this.name &&
          other.arrivalTime == this.arrivalTime &&
          other.departureTime == this.departureTime);
}

class StationsTableCompanion extends UpdateCompanion<StationsTableData> {
  final Value<int> id;
  final Value<int> routeId;
  final Value<String> name;
  final Value<DateTime> arrivalTime;
  final Value<DateTime> departureTime;
  const StationsTableCompanion({
    this.id = const Value.absent(),
    this.routeId = const Value.absent(),
    this.name = const Value.absent(),
    this.arrivalTime = const Value.absent(),
    this.departureTime = const Value.absent(),
  });
  StationsTableCompanion.insert({
    this.id = const Value.absent(),
    required int routeId,
    required String name,
    required DateTime arrivalTime,
    required DateTime departureTime,
  })  : routeId = Value(routeId),
        name = Value(name),
        arrivalTime = Value(arrivalTime),
        departureTime = Value(departureTime);
  static Insertable<StationsTableData> custom({
    Expression<int>? id,
    Expression<int>? routeId,
    Expression<String>? name,
    Expression<DateTime>? arrivalTime,
    Expression<DateTime>? departureTime,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (routeId != null) 'route_id': routeId,
      if (name != null) 'name': name,
      if (arrivalTime != null) 'arrival_time': arrivalTime,
      if (departureTime != null) 'departure_time': departureTime,
    });
  }

  StationsTableCompanion copyWith(
      {Value<int>? id,
      Value<int>? routeId,
      Value<String>? name,
      Value<DateTime>? arrivalTime,
      Value<DateTime>? departureTime}) {
    return StationsTableCompanion(
      id: id ?? this.id,
      routeId: routeId ?? this.routeId,
      name: name ?? this.name,
      arrivalTime: arrivalTime ?? this.arrivalTime,
      departureTime: departureTime ?? this.departureTime,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (routeId.present) {
      map['route_id'] = Variable<int>(routeId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (arrivalTime.present) {
      map['arrival_time'] = Variable<DateTime>(arrivalTime.value);
    }
    if (departureTime.present) {
      map['departure_time'] = Variable<DateTime>(departureTime.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('StationsTableCompanion(')
          ..write('id: $id, ')
          ..write('routeId: $routeId, ')
          ..write('name: $name, ')
          ..write('arrivalTime: $arrivalTime, ')
          ..write('departureTime: $departureTime')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $RoutesTableTable routesTable = $RoutesTableTable(this);
  late final $StationsTableTable stationsTable = $StationsTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [routesTable, stationsTable];
}

typedef $$RoutesTableTableCreateCompanionBuilder = RoutesTableCompanion
    Function({
  Value<int> id,
  required String locomotiveNumber,
  required String section,
  required String partnerName,
  required DateTime callTime,
  required DateTime acceptTime,
  Value<DateTime?> releaseTime,
  required double startMeter,
  Value<double?> endMeter,
});
typedef $$RoutesTableTableUpdateCompanionBuilder = RoutesTableCompanion
    Function({
  Value<int> id,
  Value<String> locomotiveNumber,
  Value<String> section,
  Value<String> partnerName,
  Value<DateTime> callTime,
  Value<DateTime> acceptTime,
  Value<DateTime?> releaseTime,
  Value<double> startMeter,
  Value<double?> endMeter,
});

final class $$RoutesTableTableReferences
    extends BaseReferences<_$AppDatabase, $RoutesTableTable, RoutesTableData> {
  $$RoutesTableTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$StationsTableTable, List<StationsTableData>>
      _stationsTableRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.stationsTable,
              aliasName: $_aliasNameGenerator(
                  db.routesTable.id, db.stationsTable.routeId));

  $$StationsTableTableProcessedTableManager get stationsTableRefs {
    final manager = $$StationsTableTableTableManager($_db, $_db.stationsTable)
        .filter((f) => f.routeId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_stationsTableRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$RoutesTableTableFilterComposer
    extends Composer<_$AppDatabase, $RoutesTableTable> {
  $$RoutesTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get locomotiveNumber => $composableBuilder(
      column: $table.locomotiveNumber,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get section => $composableBuilder(
      column: $table.section, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get partnerName => $composableBuilder(
      column: $table.partnerName, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get callTime => $composableBuilder(
      column: $table.callTime, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get acceptTime => $composableBuilder(
      column: $table.acceptTime, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get releaseTime => $composableBuilder(
      column: $table.releaseTime, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get startMeter => $composableBuilder(
      column: $table.startMeter, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get endMeter => $composableBuilder(
      column: $table.endMeter, builder: (column) => ColumnFilters(column));

  Expression<bool> stationsTableRefs(
      Expression<bool> Function($$StationsTableTableFilterComposer f) f) {
    final $$StationsTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.stationsTable,
        getReferencedColumn: (t) => t.routeId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$StationsTableTableFilterComposer(
              $db: $db,
              $table: $db.stationsTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$RoutesTableTableOrderingComposer
    extends Composer<_$AppDatabase, $RoutesTableTable> {
  $$RoutesTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get locomotiveNumber => $composableBuilder(
      column: $table.locomotiveNumber,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get section => $composableBuilder(
      column: $table.section, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get partnerName => $composableBuilder(
      column: $table.partnerName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get callTime => $composableBuilder(
      column: $table.callTime, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get acceptTime => $composableBuilder(
      column: $table.acceptTime, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get releaseTime => $composableBuilder(
      column: $table.releaseTime, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get startMeter => $composableBuilder(
      column: $table.startMeter, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get endMeter => $composableBuilder(
      column: $table.endMeter, builder: (column) => ColumnOrderings(column));
}

class $$RoutesTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $RoutesTableTable> {
  $$RoutesTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get locomotiveNumber => $composableBuilder(
      column: $table.locomotiveNumber, builder: (column) => column);

  GeneratedColumn<String> get section =>
      $composableBuilder(column: $table.section, builder: (column) => column);

  GeneratedColumn<String> get partnerName => $composableBuilder(
      column: $table.partnerName, builder: (column) => column);

  GeneratedColumn<DateTime> get callTime =>
      $composableBuilder(column: $table.callTime, builder: (column) => column);

  GeneratedColumn<DateTime> get acceptTime => $composableBuilder(
      column: $table.acceptTime, builder: (column) => column);

  GeneratedColumn<DateTime> get releaseTime => $composableBuilder(
      column: $table.releaseTime, builder: (column) => column);

  GeneratedColumn<double> get startMeter => $composableBuilder(
      column: $table.startMeter, builder: (column) => column);

  GeneratedColumn<double> get endMeter =>
      $composableBuilder(column: $table.endMeter, builder: (column) => column);

  Expression<T> stationsTableRefs<T extends Object>(
      Expression<T> Function($$StationsTableTableAnnotationComposer a) f) {
    final $$StationsTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.stationsTable,
        getReferencedColumn: (t) => t.routeId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$StationsTableTableAnnotationComposer(
              $db: $db,
              $table: $db.stationsTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$RoutesTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $RoutesTableTable,
    RoutesTableData,
    $$RoutesTableTableFilterComposer,
    $$RoutesTableTableOrderingComposer,
    $$RoutesTableTableAnnotationComposer,
    $$RoutesTableTableCreateCompanionBuilder,
    $$RoutesTableTableUpdateCompanionBuilder,
    (RoutesTableData, $$RoutesTableTableReferences),
    RoutesTableData,
    PrefetchHooks Function({bool stationsTableRefs})> {
  $$RoutesTableTableTableManager(_$AppDatabase db, $RoutesTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RoutesTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RoutesTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RoutesTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> locomotiveNumber = const Value.absent(),
            Value<String> section = const Value.absent(),
            Value<String> partnerName = const Value.absent(),
            Value<DateTime> callTime = const Value.absent(),
            Value<DateTime> acceptTime = const Value.absent(),
            Value<DateTime?> releaseTime = const Value.absent(),
            Value<double> startMeter = const Value.absent(),
            Value<double?> endMeter = const Value.absent(),
          }) =>
              RoutesTableCompanion(
            id: id,
            locomotiveNumber: locomotiveNumber,
            section: section,
            partnerName: partnerName,
            callTime: callTime,
            acceptTime: acceptTime,
            releaseTime: releaseTime,
            startMeter: startMeter,
            endMeter: endMeter,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String locomotiveNumber,
            required String section,
            required String partnerName,
            required DateTime callTime,
            required DateTime acceptTime,
            Value<DateTime?> releaseTime = const Value.absent(),
            required double startMeter,
            Value<double?> endMeter = const Value.absent(),
          }) =>
              RoutesTableCompanion.insert(
            id: id,
            locomotiveNumber: locomotiveNumber,
            section: section,
            partnerName: partnerName,
            callTime: callTime,
            acceptTime: acceptTime,
            releaseTime: releaseTime,
            startMeter: startMeter,
            endMeter: endMeter,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$RoutesTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({stationsTableRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (stationsTableRefs) db.stationsTable
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (stationsTableRefs)
                    await $_getPrefetchedData<RoutesTableData,
                            $RoutesTableTable, StationsTableData>(
                        currentTable: table,
                        referencedTable: $$RoutesTableTableReferences
                            ._stationsTableRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$RoutesTableTableReferences(db, table, p0)
                                .stationsTableRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.routeId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$RoutesTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $RoutesTableTable,
    RoutesTableData,
    $$RoutesTableTableFilterComposer,
    $$RoutesTableTableOrderingComposer,
    $$RoutesTableTableAnnotationComposer,
    $$RoutesTableTableCreateCompanionBuilder,
    $$RoutesTableTableUpdateCompanionBuilder,
    (RoutesTableData, $$RoutesTableTableReferences),
    RoutesTableData,
    PrefetchHooks Function({bool stationsTableRefs})>;
typedef $$StationsTableTableCreateCompanionBuilder = StationsTableCompanion
    Function({
  Value<int> id,
  required int routeId,
  required String name,
  required DateTime arrivalTime,
  required DateTime departureTime,
});
typedef $$StationsTableTableUpdateCompanionBuilder = StationsTableCompanion
    Function({
  Value<int> id,
  Value<int> routeId,
  Value<String> name,
  Value<DateTime> arrivalTime,
  Value<DateTime> departureTime,
});

final class $$StationsTableTableReferences extends BaseReferences<_$AppDatabase,
    $StationsTableTable, StationsTableData> {
  $$StationsTableTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $RoutesTableTable _routeIdTable(_$AppDatabase db) =>
      db.routesTable.createAlias(
          $_aliasNameGenerator(db.stationsTable.routeId, db.routesTable.id));

  $$RoutesTableTableProcessedTableManager get routeId {
    final $_column = $_itemColumn<int>('route_id')!;

    final manager = $$RoutesTableTableTableManager($_db, $_db.routesTable)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_routeIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$StationsTableTableFilterComposer
    extends Composer<_$AppDatabase, $StationsTableTable> {
  $$StationsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get arrivalTime => $composableBuilder(
      column: $table.arrivalTime, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get departureTime => $composableBuilder(
      column: $table.departureTime, builder: (column) => ColumnFilters(column));

  $$RoutesTableTableFilterComposer get routeId {
    final $$RoutesTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.routeId,
        referencedTable: $db.routesTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$RoutesTableTableFilterComposer(
              $db: $db,
              $table: $db.routesTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$StationsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $StationsTableTable> {
  $$StationsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get arrivalTime => $composableBuilder(
      column: $table.arrivalTime, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get departureTime => $composableBuilder(
      column: $table.departureTime,
      builder: (column) => ColumnOrderings(column));

  $$RoutesTableTableOrderingComposer get routeId {
    final $$RoutesTableTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.routeId,
        referencedTable: $db.routesTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$RoutesTableTableOrderingComposer(
              $db: $db,
              $table: $db.routesTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$StationsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $StationsTableTable> {
  $$StationsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<DateTime> get arrivalTime => $composableBuilder(
      column: $table.arrivalTime, builder: (column) => column);

  GeneratedColumn<DateTime> get departureTime => $composableBuilder(
      column: $table.departureTime, builder: (column) => column);

  $$RoutesTableTableAnnotationComposer get routeId {
    final $$RoutesTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.routeId,
        referencedTable: $db.routesTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$RoutesTableTableAnnotationComposer(
              $db: $db,
              $table: $db.routesTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$StationsTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $StationsTableTable,
    StationsTableData,
    $$StationsTableTableFilterComposer,
    $$StationsTableTableOrderingComposer,
    $$StationsTableTableAnnotationComposer,
    $$StationsTableTableCreateCompanionBuilder,
    $$StationsTableTableUpdateCompanionBuilder,
    (StationsTableData, $$StationsTableTableReferences),
    StationsTableData,
    PrefetchHooks Function({bool routeId})> {
  $$StationsTableTableTableManager(_$AppDatabase db, $StationsTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$StationsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$StationsTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$StationsTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> routeId = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<DateTime> arrivalTime = const Value.absent(),
            Value<DateTime> departureTime = const Value.absent(),
          }) =>
              StationsTableCompanion(
            id: id,
            routeId: routeId,
            name: name,
            arrivalTime: arrivalTime,
            departureTime: departureTime,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int routeId,
            required String name,
            required DateTime arrivalTime,
            required DateTime departureTime,
          }) =>
              StationsTableCompanion.insert(
            id: id,
            routeId: routeId,
            name: name,
            arrivalTime: arrivalTime,
            departureTime: departureTime,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$StationsTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({routeId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (routeId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.routeId,
                    referencedTable:
                        $$StationsTableTableReferences._routeIdTable(db),
                    referencedColumn:
                        $$StationsTableTableReferences._routeIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$StationsTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $StationsTableTable,
    StationsTableData,
    $$StationsTableTableFilterComposer,
    $$StationsTableTableOrderingComposer,
    $$StationsTableTableAnnotationComposer,
    $$StationsTableTableCreateCompanionBuilder,
    $$StationsTableTableUpdateCompanionBuilder,
    (StationsTableData, $$StationsTableTableReferences),
    StationsTableData,
    PrefetchHooks Function({bool routeId})>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$RoutesTableTableTableManager get routesTable =>
      $$RoutesTableTableTableManager(_db, _db.routesTable);
  $$StationsTableTableTableManager get stationsTable =>
      $$StationsTableTableTableManager(_db, _db.stationsTable);
}
