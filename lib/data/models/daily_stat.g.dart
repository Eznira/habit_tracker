// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_stat.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetDailyHabitStatsCollection on Isar {
  IsarCollection<DailyHabitStats> get dailyHabitStats => this.collection();
}

const DailyHabitStatsSchema = CollectionSchema(
  name: r'DailyHabitStats',
  id: -3006371303652076111,
  properties: {
    r'completedCount': PropertySchema(
      id: 0,
      name: r'completedCount',
      type: IsarType.long,
    ),
    r'date': PropertySchema(
      id: 1,
      name: r'date',
      type: IsarType.dateTime,
    ),
    r'intensityLevel': PropertySchema(
      id: 2,
      name: r'intensityLevel',
      type: IsarType.long,
    ),
    r'totalHabits': PropertySchema(
      id: 3,
      name: r'totalHabits',
      type: IsarType.long,
    )
  },
  estimateSize: _dailyHabitStatsEstimateSize,
  serialize: _dailyHabitStatsSerialize,
  deserialize: _dailyHabitStatsDeserialize,
  deserializeProp: _dailyHabitStatsDeserializeProp,
  idName: r'id',
  indexes: {
    r'date': IndexSchema(
      id: -7552997827385218417,
      name: r'date',
      unique: true,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'date',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _dailyHabitStatsGetId,
  getLinks: _dailyHabitStatsGetLinks,
  attach: _dailyHabitStatsAttach,
  version: '3.1.0+1',
);

int _dailyHabitStatsEstimateSize(
  DailyHabitStats object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _dailyHabitStatsSerialize(
  DailyHabitStats object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.completedCount);
  writer.writeDateTime(offsets[1], object.date);
  writer.writeLong(offsets[2], object.intensityLevel);
  writer.writeLong(offsets[3], object.totalHabits);
}

DailyHabitStats _dailyHabitStatsDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = DailyHabitStats();
  object.completedCount = reader.readLong(offsets[0]);
  object.date = reader.readDateTime(offsets[1]);
  object.id = id;
  object.intensityLevel = reader.readLong(offsets[2]);
  object.totalHabits = reader.readLong(offsets[3]);
  return object;
}

P _dailyHabitStatsDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readDateTime(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _dailyHabitStatsGetId(DailyHabitStats object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _dailyHabitStatsGetLinks(DailyHabitStats object) {
  return [];
}

void _dailyHabitStatsAttach(
    IsarCollection<dynamic> col, Id id, DailyHabitStats object) {
  object.id = id;
}

extension DailyHabitStatsByIndex on IsarCollection<DailyHabitStats> {
  Future<DailyHabitStats?> getByDate(DateTime date) {
    return getByIndex(r'date', [date]);
  }

  DailyHabitStats? getByDateSync(DateTime date) {
    return getByIndexSync(r'date', [date]);
  }

  Future<bool> deleteByDate(DateTime date) {
    return deleteByIndex(r'date', [date]);
  }

  bool deleteByDateSync(DateTime date) {
    return deleteByIndexSync(r'date', [date]);
  }

  Future<List<DailyHabitStats?>> getAllByDate(List<DateTime> dateValues) {
    final values = dateValues.map((e) => [e]).toList();
    return getAllByIndex(r'date', values);
  }

  List<DailyHabitStats?> getAllByDateSync(List<DateTime> dateValues) {
    final values = dateValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'date', values);
  }

  Future<int> deleteAllByDate(List<DateTime> dateValues) {
    final values = dateValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'date', values);
  }

  int deleteAllByDateSync(List<DateTime> dateValues) {
    final values = dateValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'date', values);
  }

  Future<Id> putByDate(DailyHabitStats object) {
    return putByIndex(r'date', object);
  }

  Id putByDateSync(DailyHabitStats object, {bool saveLinks = true}) {
    return putByIndexSync(r'date', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByDate(List<DailyHabitStats> objects) {
    return putAllByIndex(r'date', objects);
  }

  List<Id> putAllByDateSync(List<DailyHabitStats> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'date', objects, saveLinks: saveLinks);
  }
}

extension DailyHabitStatsQueryWhereSort
    on QueryBuilder<DailyHabitStats, DailyHabitStats, QWhere> {
  QueryBuilder<DailyHabitStats, DailyHabitStats, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<DailyHabitStats, DailyHabitStats, QAfterWhere> anyDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'date'),
      );
    });
  }
}

extension DailyHabitStatsQueryWhere
    on QueryBuilder<DailyHabitStats, DailyHabitStats, QWhereClause> {
  QueryBuilder<DailyHabitStats, DailyHabitStats, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<DailyHabitStats, DailyHabitStats, QAfterWhereClause>
      idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<DailyHabitStats, DailyHabitStats, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<DailyHabitStats, DailyHabitStats, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<DailyHabitStats, DailyHabitStats, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DailyHabitStats, DailyHabitStats, QAfterWhereClause> dateEqualTo(
      DateTime date) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'date',
        value: [date],
      ));
    });
  }

  QueryBuilder<DailyHabitStats, DailyHabitStats, QAfterWhereClause>
      dateNotEqualTo(DateTime date) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'date',
              lower: [],
              upper: [date],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'date',
              lower: [date],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'date',
              lower: [date],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'date',
              lower: [],
              upper: [date],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<DailyHabitStats, DailyHabitStats, QAfterWhereClause>
      dateGreaterThan(
    DateTime date, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'date',
        lower: [date],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<DailyHabitStats, DailyHabitStats, QAfterWhereClause>
      dateLessThan(
    DateTime date, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'date',
        lower: [],
        upper: [date],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<DailyHabitStats, DailyHabitStats, QAfterWhereClause> dateBetween(
    DateTime lowerDate,
    DateTime upperDate, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'date',
        lower: [lowerDate],
        includeLower: includeLower,
        upper: [upperDate],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension DailyHabitStatsQueryFilter
    on QueryBuilder<DailyHabitStats, DailyHabitStats, QFilterCondition> {
  QueryBuilder<DailyHabitStats, DailyHabitStats, QAfterFilterCondition>
      completedCountEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'completedCount',
        value: value,
      ));
    });
  }

  QueryBuilder<DailyHabitStats, DailyHabitStats, QAfterFilterCondition>
      completedCountGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'completedCount',
        value: value,
      ));
    });
  }

  QueryBuilder<DailyHabitStats, DailyHabitStats, QAfterFilterCondition>
      completedCountLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'completedCount',
        value: value,
      ));
    });
  }

  QueryBuilder<DailyHabitStats, DailyHabitStats, QAfterFilterCondition>
      completedCountBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'completedCount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DailyHabitStats, DailyHabitStats, QAfterFilterCondition>
      dateEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<DailyHabitStats, DailyHabitStats, QAfterFilterCondition>
      dateGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<DailyHabitStats, DailyHabitStats, QAfterFilterCondition>
      dateLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<DailyHabitStats, DailyHabitStats, QAfterFilterCondition>
      dateBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'date',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DailyHabitStats, DailyHabitStats, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<DailyHabitStats, DailyHabitStats, QAfterFilterCondition>
      idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<DailyHabitStats, DailyHabitStats, QAfterFilterCondition>
      idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<DailyHabitStats, DailyHabitStats, QAfterFilterCondition>
      idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DailyHabitStats, DailyHabitStats, QAfterFilterCondition>
      intensityLevelEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'intensityLevel',
        value: value,
      ));
    });
  }

  QueryBuilder<DailyHabitStats, DailyHabitStats, QAfterFilterCondition>
      intensityLevelGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'intensityLevel',
        value: value,
      ));
    });
  }

  QueryBuilder<DailyHabitStats, DailyHabitStats, QAfterFilterCondition>
      intensityLevelLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'intensityLevel',
        value: value,
      ));
    });
  }

  QueryBuilder<DailyHabitStats, DailyHabitStats, QAfterFilterCondition>
      intensityLevelBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'intensityLevel',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DailyHabitStats, DailyHabitStats, QAfterFilterCondition>
      totalHabitsEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalHabits',
        value: value,
      ));
    });
  }

  QueryBuilder<DailyHabitStats, DailyHabitStats, QAfterFilterCondition>
      totalHabitsGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalHabits',
        value: value,
      ));
    });
  }

  QueryBuilder<DailyHabitStats, DailyHabitStats, QAfterFilterCondition>
      totalHabitsLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalHabits',
        value: value,
      ));
    });
  }

  QueryBuilder<DailyHabitStats, DailyHabitStats, QAfterFilterCondition>
      totalHabitsBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalHabits',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension DailyHabitStatsQueryObject
    on QueryBuilder<DailyHabitStats, DailyHabitStats, QFilterCondition> {}

extension DailyHabitStatsQueryLinks
    on QueryBuilder<DailyHabitStats, DailyHabitStats, QFilterCondition> {}

extension DailyHabitStatsQuerySortBy
    on QueryBuilder<DailyHabitStats, DailyHabitStats, QSortBy> {
  QueryBuilder<DailyHabitStats, DailyHabitStats, QAfterSortBy>
      sortByCompletedCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completedCount', Sort.asc);
    });
  }

  QueryBuilder<DailyHabitStats, DailyHabitStats, QAfterSortBy>
      sortByCompletedCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completedCount', Sort.desc);
    });
  }

  QueryBuilder<DailyHabitStats, DailyHabitStats, QAfterSortBy> sortByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<DailyHabitStats, DailyHabitStats, QAfterSortBy>
      sortByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<DailyHabitStats, DailyHabitStats, QAfterSortBy>
      sortByIntensityLevel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'intensityLevel', Sort.asc);
    });
  }

  QueryBuilder<DailyHabitStats, DailyHabitStats, QAfterSortBy>
      sortByIntensityLevelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'intensityLevel', Sort.desc);
    });
  }

  QueryBuilder<DailyHabitStats, DailyHabitStats, QAfterSortBy>
      sortByTotalHabits() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalHabits', Sort.asc);
    });
  }

  QueryBuilder<DailyHabitStats, DailyHabitStats, QAfterSortBy>
      sortByTotalHabitsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalHabits', Sort.desc);
    });
  }
}

extension DailyHabitStatsQuerySortThenBy
    on QueryBuilder<DailyHabitStats, DailyHabitStats, QSortThenBy> {
  QueryBuilder<DailyHabitStats, DailyHabitStats, QAfterSortBy>
      thenByCompletedCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completedCount', Sort.asc);
    });
  }

  QueryBuilder<DailyHabitStats, DailyHabitStats, QAfterSortBy>
      thenByCompletedCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completedCount', Sort.desc);
    });
  }

  QueryBuilder<DailyHabitStats, DailyHabitStats, QAfterSortBy> thenByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<DailyHabitStats, DailyHabitStats, QAfterSortBy>
      thenByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<DailyHabitStats, DailyHabitStats, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<DailyHabitStats, DailyHabitStats, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<DailyHabitStats, DailyHabitStats, QAfterSortBy>
      thenByIntensityLevel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'intensityLevel', Sort.asc);
    });
  }

  QueryBuilder<DailyHabitStats, DailyHabitStats, QAfterSortBy>
      thenByIntensityLevelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'intensityLevel', Sort.desc);
    });
  }

  QueryBuilder<DailyHabitStats, DailyHabitStats, QAfterSortBy>
      thenByTotalHabits() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalHabits', Sort.asc);
    });
  }

  QueryBuilder<DailyHabitStats, DailyHabitStats, QAfterSortBy>
      thenByTotalHabitsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalHabits', Sort.desc);
    });
  }
}

extension DailyHabitStatsQueryWhereDistinct
    on QueryBuilder<DailyHabitStats, DailyHabitStats, QDistinct> {
  QueryBuilder<DailyHabitStats, DailyHabitStats, QDistinct>
      distinctByCompletedCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'completedCount');
    });
  }

  QueryBuilder<DailyHabitStats, DailyHabitStats, QDistinct> distinctByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'date');
    });
  }

  QueryBuilder<DailyHabitStats, DailyHabitStats, QDistinct>
      distinctByIntensityLevel() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'intensityLevel');
    });
  }

  QueryBuilder<DailyHabitStats, DailyHabitStats, QDistinct>
      distinctByTotalHabits() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalHabits');
    });
  }
}

extension DailyHabitStatsQueryProperty
    on QueryBuilder<DailyHabitStats, DailyHabitStats, QQueryProperty> {
  QueryBuilder<DailyHabitStats, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<DailyHabitStats, int, QQueryOperations>
      completedCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'completedCount');
    });
  }

  QueryBuilder<DailyHabitStats, DateTime, QQueryOperations> dateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'date');
    });
  }

  QueryBuilder<DailyHabitStats, int, QQueryOperations>
      intensityLevelProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'intensityLevel');
    });
  }

  QueryBuilder<DailyHabitStats, int, QQueryOperations> totalHabitsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalHabits');
    });
  }
}
