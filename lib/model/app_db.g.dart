// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_db.dart';

// ignore_for_file: type=lint
class $CollegeDataTable extends CollegeData
    with TableInfo<$CollegeDataTable, CollegeDataData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CollegeDataTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _collegeNameMeta =
      const VerificationMeta('collegeName');
  @override
  late final GeneratedColumn<String> collegeName = GeneratedColumn<String>(
      'college_name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 255),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _facultyNameMeta =
      const VerificationMeta('facultyName');
  @override
  late final GeneratedColumn<String> facultyName = GeneratedColumn<String>(
      'faculty_name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 255),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _semesterNameMeta =
      const VerificationMeta('semesterName');
  @override
  late final GeneratedColumn<String> semesterName = GeneratedColumn<String>(
      'semester_name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 255),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _subjectNameMeta =
      const VerificationMeta('subjectName');
  @override
  late final GeneratedColumn<String> subjectName = GeneratedColumn<String>(
      'subject_name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, collegeName, facultyName, semesterName, subjectName];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'college_data';
  @override
  VerificationContext validateIntegrity(Insertable<CollegeDataData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('college_name')) {
      context.handle(
          _collegeNameMeta,
          collegeName.isAcceptableOrUnknown(
              data['college_name']!, _collegeNameMeta));
    } else if (isInserting) {
      context.missing(_collegeNameMeta);
    }
    if (data.containsKey('faculty_name')) {
      context.handle(
          _facultyNameMeta,
          facultyName.isAcceptableOrUnknown(
              data['faculty_name']!, _facultyNameMeta));
    } else if (isInserting) {
      context.missing(_facultyNameMeta);
    }
    if (data.containsKey('semester_name')) {
      context.handle(
          _semesterNameMeta,
          semesterName.isAcceptableOrUnknown(
              data['semester_name']!, _semesterNameMeta));
    } else if (isInserting) {
      context.missing(_semesterNameMeta);
    }
    if (data.containsKey('subject_name')) {
      context.handle(
          _subjectNameMeta,
          subjectName.isAcceptableOrUnknown(
              data['subject_name']!, _subjectNameMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CollegeDataData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CollegeDataData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      collegeName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}college_name'])!,
      facultyName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}faculty_name'])!,
      semesterName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}semester_name'])!,
      subjectName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}subject_name']),
    );
  }

  @override
  $CollegeDataTable createAlias(String alias) {
    return $CollegeDataTable(attachedDatabase, alias);
  }
}

class CollegeDataData extends DataClass implements Insertable<CollegeDataData> {
  final int id;
  final String collegeName;
  final String facultyName;
  final String semesterName;
  final String? subjectName;
  const CollegeDataData(
      {required this.id,
      required this.collegeName,
      required this.facultyName,
      required this.semesterName,
      this.subjectName});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['college_name'] = Variable<String>(collegeName);
    map['faculty_name'] = Variable<String>(facultyName);
    map['semester_name'] = Variable<String>(semesterName);
    if (!nullToAbsent || subjectName != null) {
      map['subject_name'] = Variable<String>(subjectName);
    }
    return map;
  }

  CollegeDataCompanion toCompanion(bool nullToAbsent) {
    return CollegeDataCompanion(
      id: Value(id),
      collegeName: Value(collegeName),
      facultyName: Value(facultyName),
      semesterName: Value(semesterName),
      subjectName: subjectName == null && nullToAbsent
          ? const Value.absent()
          : Value(subjectName),
    );
  }

  factory CollegeDataData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CollegeDataData(
      id: serializer.fromJson<int>(json['id']),
      collegeName: serializer.fromJson<String>(json['collegeName']),
      facultyName: serializer.fromJson<String>(json['facultyName']),
      semesterName: serializer.fromJson<String>(json['semesterName']),
      subjectName: serializer.fromJson<String?>(json['subjectName']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'collegeName': serializer.toJson<String>(collegeName),
      'facultyName': serializer.toJson<String>(facultyName),
      'semesterName': serializer.toJson<String>(semesterName),
      'subjectName': serializer.toJson<String?>(subjectName),
    };
  }

  CollegeDataData copyWith(
          {int? id,
          String? collegeName,
          String? facultyName,
          String? semesterName,
          Value<String?> subjectName = const Value.absent()}) =>
      CollegeDataData(
        id: id ?? this.id,
        collegeName: collegeName ?? this.collegeName,
        facultyName: facultyName ?? this.facultyName,
        semesterName: semesterName ?? this.semesterName,
        subjectName: subjectName.present ? subjectName.value : this.subjectName,
      );
  @override
  String toString() {
    return (StringBuffer('CollegeDataData(')
          ..write('id: $id, ')
          ..write('collegeName: $collegeName, ')
          ..write('facultyName: $facultyName, ')
          ..write('semesterName: $semesterName, ')
          ..write('subjectName: $subjectName')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, collegeName, facultyName, semesterName, subjectName);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CollegeDataData &&
          other.id == this.id &&
          other.collegeName == this.collegeName &&
          other.facultyName == this.facultyName &&
          other.semesterName == this.semesterName &&
          other.subjectName == this.subjectName);
}

class CollegeDataCompanion extends UpdateCompanion<CollegeDataData> {
  final Value<int> id;
  final Value<String> collegeName;
  final Value<String> facultyName;
  final Value<String> semesterName;
  final Value<String?> subjectName;
  const CollegeDataCompanion({
    this.id = const Value.absent(),
    this.collegeName = const Value.absent(),
    this.facultyName = const Value.absent(),
    this.semesterName = const Value.absent(),
    this.subjectName = const Value.absent(),
  });
  CollegeDataCompanion.insert({
    this.id = const Value.absent(),
    required String collegeName,
    required String facultyName,
    required String semesterName,
    this.subjectName = const Value.absent(),
  })  : collegeName = Value(collegeName),
        facultyName = Value(facultyName),
        semesterName = Value(semesterName);
  static Insertable<CollegeDataData> custom({
    Expression<int>? id,
    Expression<String>? collegeName,
    Expression<String>? facultyName,
    Expression<String>? semesterName,
    Expression<String>? subjectName,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (collegeName != null) 'college_name': collegeName,
      if (facultyName != null) 'faculty_name': facultyName,
      if (semesterName != null) 'semester_name': semesterName,
      if (subjectName != null) 'subject_name': subjectName,
    });
  }

  CollegeDataCompanion copyWith(
      {Value<int>? id,
      Value<String>? collegeName,
      Value<String>? facultyName,
      Value<String>? semesterName,
      Value<String?>? subjectName}) {
    return CollegeDataCompanion(
      id: id ?? this.id,
      collegeName: collegeName ?? this.collegeName,
      facultyName: facultyName ?? this.facultyName,
      semesterName: semesterName ?? this.semesterName,
      subjectName: subjectName ?? this.subjectName,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (collegeName.present) {
      map['college_name'] = Variable<String>(collegeName.value);
    }
    if (facultyName.present) {
      map['faculty_name'] = Variable<String>(facultyName.value);
    }
    if (semesterName.present) {
      map['semester_name'] = Variable<String>(semesterName.value);
    }
    if (subjectName.present) {
      map['subject_name'] = Variable<String>(subjectName.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CollegeDataCompanion(')
          ..write('id: $id, ')
          ..write('collegeName: $collegeName, ')
          ..write('facultyName: $facultyName, ')
          ..write('semesterName: $semesterName, ')
          ..write('subjectName: $subjectName')
          ..write(')'))
        .toString();
  }
}

class $StudentTable extends Student with TableInfo<$StudentTable, StudentData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $StudentTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _collegeIdMeta =
      const VerificationMeta('collegeId');
  @override
  late final GeneratedColumn<int> collegeId = GeneratedColumn<int>(
      'college_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES college_data (id)'));
  static const VerificationMeta _rollNoMeta = const VerificationMeta('rollNo');
  @override
  late final GeneratedColumn<int> rollNo = GeneratedColumn<int>(
      'roll_no', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _studentNameMeta =
      const VerificationMeta('studentName');
  @override
  late final GeneratedColumn<String> studentName = GeneratedColumn<String>(
      'student_name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 255),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [collegeId, rollNo, studentName];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'student';
  @override
  VerificationContext validateIntegrity(Insertable<StudentData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('college_id')) {
      context.handle(_collegeIdMeta,
          collegeId.isAcceptableOrUnknown(data['college_id']!, _collegeIdMeta));
    } else if (isInserting) {
      context.missing(_collegeIdMeta);
    }
    if (data.containsKey('roll_no')) {
      context.handle(_rollNoMeta,
          rollNo.isAcceptableOrUnknown(data['roll_no']!, _rollNoMeta));
    }
    if (data.containsKey('student_name')) {
      context.handle(
          _studentNameMeta,
          studentName.isAcceptableOrUnknown(
              data['student_name']!, _studentNameMeta));
    } else if (isInserting) {
      context.missing(_studentNameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {rollNo};
  @override
  StudentData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return StudentData(
      collegeId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}college_id'])!,
      rollNo: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}roll_no'])!,
      studentName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}student_name'])!,
    );
  }

  @override
  $StudentTable createAlias(String alias) {
    return $StudentTable(attachedDatabase, alias);
  }
}

class StudentData extends DataClass implements Insertable<StudentData> {
  final int collegeId;
  final int rollNo;
  final String studentName;
  const StudentData(
      {required this.collegeId,
      required this.rollNo,
      required this.studentName});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['college_id'] = Variable<int>(collegeId);
    map['roll_no'] = Variable<int>(rollNo);
    map['student_name'] = Variable<String>(studentName);
    return map;
  }

  StudentCompanion toCompanion(bool nullToAbsent) {
    return StudentCompanion(
      collegeId: Value(collegeId),
      rollNo: Value(rollNo),
      studentName: Value(studentName),
    );
  }

  factory StudentData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return StudentData(
      collegeId: serializer.fromJson<int>(json['collegeId']),
      rollNo: serializer.fromJson<int>(json['rollNo']),
      studentName: serializer.fromJson<String>(json['studentName']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'collegeId': serializer.toJson<int>(collegeId),
      'rollNo': serializer.toJson<int>(rollNo),
      'studentName': serializer.toJson<String>(studentName),
    };
  }

  StudentData copyWith({int? collegeId, int? rollNo, String? studentName}) =>
      StudentData(
        collegeId: collegeId ?? this.collegeId,
        rollNo: rollNo ?? this.rollNo,
        studentName: studentName ?? this.studentName,
      );
  @override
  String toString() {
    return (StringBuffer('StudentData(')
          ..write('collegeId: $collegeId, ')
          ..write('rollNo: $rollNo, ')
          ..write('studentName: $studentName')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(collegeId, rollNo, studentName);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is StudentData &&
          other.collegeId == this.collegeId &&
          other.rollNo == this.rollNo &&
          other.studentName == this.studentName);
}

class StudentCompanion extends UpdateCompanion<StudentData> {
  final Value<int> collegeId;
  final Value<int> rollNo;
  final Value<String> studentName;
  const StudentCompanion({
    this.collegeId = const Value.absent(),
    this.rollNo = const Value.absent(),
    this.studentName = const Value.absent(),
  });
  StudentCompanion.insert({
    required int collegeId,
    this.rollNo = const Value.absent(),
    required String studentName,
  })  : collegeId = Value(collegeId),
        studentName = Value(studentName);
  static Insertable<StudentData> custom({
    Expression<int>? collegeId,
    Expression<int>? rollNo,
    Expression<String>? studentName,
  }) {
    return RawValuesInsertable({
      if (collegeId != null) 'college_id': collegeId,
      if (rollNo != null) 'roll_no': rollNo,
      if (studentName != null) 'student_name': studentName,
    });
  }

  StudentCompanion copyWith(
      {Value<int>? collegeId, Value<int>? rollNo, Value<String>? studentName}) {
    return StudentCompanion(
      collegeId: collegeId ?? this.collegeId,
      rollNo: rollNo ?? this.rollNo,
      studentName: studentName ?? this.studentName,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (collegeId.present) {
      map['college_id'] = Variable<int>(collegeId.value);
    }
    if (rollNo.present) {
      map['roll_no'] = Variable<int>(rollNo.value);
    }
    if (studentName.present) {
      map['student_name'] = Variable<String>(studentName.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('StudentCompanion(')
          ..write('collegeId: $collegeId, ')
          ..write('rollNo: $rollNo, ')
          ..write('studentName: $studentName')
          ..write(')'))
        .toString();
  }
}

class $AttendanceTable extends Attendance
    with TableInfo<$AttendanceTable, AttendanceData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AttendanceTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _attendanceDateMeta =
      const VerificationMeta('attendanceDate');
  @override
  late final GeneratedColumn<DateTime> attendanceDate =
      GeneratedColumn<DateTime>('attendance_date', aliasedName, true,
          type: DriftSqlType.dateTime,
          requiredDuringInsert: false,
          clientDefault: () => DateTime.now());
  static const VerificationMeta _isPresentMeta =
      const VerificationMeta('isPresent');
  @override
  late final GeneratedColumn<bool> isPresent = GeneratedColumn<bool>(
      'is_present', aliasedName, true,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_present" IN (0, 1))'),
      defaultValue: const Constant(true));
  @override
  List<GeneratedColumn> get $columns => [attendanceDate, isPresent];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'attendance';
  @override
  VerificationContext validateIntegrity(Insertable<AttendanceData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('attendance_date')) {
      context.handle(
          _attendanceDateMeta,
          attendanceDate.isAcceptableOrUnknown(
              data['attendance_date']!, _attendanceDateMeta));
    }
    if (data.containsKey('is_present')) {
      context.handle(_isPresentMeta,
          isPresent.isAcceptableOrUnknown(data['is_present']!, _isPresentMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  AttendanceData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AttendanceData(
      attendanceDate: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}attendance_date']),
      isPresent: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_present']),
    );
  }

  @override
  $AttendanceTable createAlias(String alias) {
    return $AttendanceTable(attachedDatabase, alias);
  }
}

class AttendanceData extends DataClass implements Insertable<AttendanceData> {
  final DateTime? attendanceDate;
  final bool? isPresent;
  const AttendanceData({this.attendanceDate, this.isPresent});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || attendanceDate != null) {
      map['attendance_date'] = Variable<DateTime>(attendanceDate);
    }
    if (!nullToAbsent || isPresent != null) {
      map['is_present'] = Variable<bool>(isPresent);
    }
    return map;
  }

  AttendanceCompanion toCompanion(bool nullToAbsent) {
    return AttendanceCompanion(
      attendanceDate: attendanceDate == null && nullToAbsent
          ? const Value.absent()
          : Value(attendanceDate),
      isPresent: isPresent == null && nullToAbsent
          ? const Value.absent()
          : Value(isPresent),
    );
  }

  factory AttendanceData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AttendanceData(
      attendanceDate: serializer.fromJson<DateTime?>(json['attendanceDate']),
      isPresent: serializer.fromJson<bool?>(json['isPresent']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'attendanceDate': serializer.toJson<DateTime?>(attendanceDate),
      'isPresent': serializer.toJson<bool?>(isPresent),
    };
  }

  AttendanceData copyWith(
          {Value<DateTime?> attendanceDate = const Value.absent(),
          Value<bool?> isPresent = const Value.absent()}) =>
      AttendanceData(
        attendanceDate:
            attendanceDate.present ? attendanceDate.value : this.attendanceDate,
        isPresent: isPresent.present ? isPresent.value : this.isPresent,
      );
  @override
  String toString() {
    return (StringBuffer('AttendanceData(')
          ..write('attendanceDate: $attendanceDate, ')
          ..write('isPresent: $isPresent')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(attendanceDate, isPresent);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AttendanceData &&
          other.attendanceDate == this.attendanceDate &&
          other.isPresent == this.isPresent);
}

class AttendanceCompanion extends UpdateCompanion<AttendanceData> {
  final Value<DateTime?> attendanceDate;
  final Value<bool?> isPresent;
  final Value<int> rowid;
  const AttendanceCompanion({
    this.attendanceDate = const Value.absent(),
    this.isPresent = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AttendanceCompanion.insert({
    this.attendanceDate = const Value.absent(),
    this.isPresent = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  static Insertable<AttendanceData> custom({
    Expression<DateTime>? attendanceDate,
    Expression<bool>? isPresent,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (attendanceDate != null) 'attendance_date': attendanceDate,
      if (isPresent != null) 'is_present': isPresent,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AttendanceCompanion copyWith(
      {Value<DateTime?>? attendanceDate,
      Value<bool?>? isPresent,
      Value<int>? rowid}) {
    return AttendanceCompanion(
      attendanceDate: attendanceDate ?? this.attendanceDate,
      isPresent: isPresent ?? this.isPresent,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (attendanceDate.present) {
      map['attendance_date'] = Variable<DateTime>(attendanceDate.value);
    }
    if (isPresent.present) {
      map['is_present'] = Variable<bool>(isPresent.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AttendanceCompanion(')
          ..write('attendanceDate: $attendanceDate, ')
          ..write('isPresent: $isPresent, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDb extends GeneratedDatabase {
  _$AppDb(QueryExecutor e) : super(e);
  late final $CollegeDataTable collegeData = $CollegeDataTable(this);
  late final $StudentTable student = $StudentTable(this);
  late final $AttendanceTable attendance = $AttendanceTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [collegeData, student, attendance];
}
