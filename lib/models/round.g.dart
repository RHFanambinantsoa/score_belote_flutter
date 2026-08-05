// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'round.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetRoundCollection on Isar {
  IsarCollection<Round> get rounds => this.collection();
}

const RoundSchema = CollectionSchema(
  name: r'Round',
  id: 8762410198825043196,
  properties: {
    r'gameVariant': PropertySchema(
      id: 0,
      name: r'gameVariant',
      type: IsarType.string,
      enumMap: _RoundgameVariantEnumValueMap,
    ),
    r'isCapot': PropertySchema(
      id: 1,
      name: r'isCapot',
      type: IsarType.bool,
    ),
    r'isDefending': PropertySchema(
      id: 2,
      name: r'isDefending',
      type: IsarType.bool,
    ),
    r'roundStatus': PropertySchema(
      id: 3,
      name: r'roundStatus',
      type: IsarType.string,
      enumMap: _RoundroundStatusEnumValueMap,
    ),
    r'score': PropertySchema(
      id: 4,
      name: r'score',
      type: IsarType.long,
    ),
    r'winnerTeam': PropertySchema(
      id: 5,
      name: r'winnerTeam',
      type: IsarType.string,
      enumMap: _RoundwinnerTeamEnumValueMap,
    )
  },
  estimateSize: _roundEstimateSize,
  serialize: _roundSerialize,
  deserialize: _roundDeserialize,
  deserializeProp: _roundDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _roundGetId,
  getLinks: _roundGetLinks,
  attach: _roundAttach,
  version: '3.1.0+1',
);

int _roundEstimateSize(
  Round object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.gameVariant.name.length * 3;
  bytesCount += 3 + object.roundStatus.name.length * 3;
  bytesCount += 3 + object.winnerTeam.name.length * 3;
  return bytesCount;
}

void _roundSerialize(
  Round object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.gameVariant.name);
  writer.writeBool(offsets[1], object.isCapot);
  writer.writeBool(offsets[2], object.isDefending);
  writer.writeString(offsets[3], object.roundStatus.name);
  writer.writeLong(offsets[4], object.score);
  writer.writeString(offsets[5], object.winnerTeam.name);
}

Round _roundDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Round(
    gameVariant:
        _RoundgameVariantValueEnumMap[reader.readStringOrNull(offsets[0])] ??
            GameVariant.clubs,
    isCapot: reader.readBool(offsets[1]),
    isDefending: reader.readBool(offsets[2]),
    roundStatus:
        _RoundroundStatusValueEnumMap[reader.readStringOrNull(offsets[3])] ??
            RoundStatus.normal,
    score: reader.readLong(offsets[4]),
    winnerTeam:
        _RoundwinnerTeamValueEnumMap[reader.readStringOrNull(offsets[5])] ??
            TeamType.teamA,
  );
  object.id = id;
  return object;
}

P _roundDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (_RoundgameVariantValueEnumMap[reader.readStringOrNull(offset)] ??
          GameVariant.clubs) as P;
    case 1:
      return (reader.readBool(offset)) as P;
    case 2:
      return (reader.readBool(offset)) as P;
    case 3:
      return (_RoundroundStatusValueEnumMap[reader.readStringOrNull(offset)] ??
          RoundStatus.normal) as P;
    case 4:
      return (reader.readLong(offset)) as P;
    case 5:
      return (_RoundwinnerTeamValueEnumMap[reader.readStringOrNull(offset)] ??
          TeamType.teamA) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _RoundgameVariantEnumValueMap = {
  r'clubs': r'clubs',
  r'diamonds': r'diamonds',
  r'hearts': r'hearts',
  r'spades': r'spades',
  r'noTrump': r'noTrump',
  r'allTrump': r'allTrump',
};
const _RoundgameVariantValueEnumMap = {
  r'clubs': GameVariant.clubs,
  r'diamonds': GameVariant.diamonds,
  r'hearts': GameVariant.hearts,
  r'spades': GameVariant.spades,
  r'noTrump': GameVariant.noTrump,
  r'allTrump': GameVariant.allTrump,
};
const _RoundroundStatusEnumValueMap = {
  r'normal': r'normal',
  r'doubled': r'doubled',
  r'redoubled': r'redoubled',
};
const _RoundroundStatusValueEnumMap = {
  r'normal': RoundStatus.normal,
  r'doubled': RoundStatus.doubled,
  r'redoubled': RoundStatus.redoubled,
};
const _RoundwinnerTeamEnumValueMap = {
  r'teamA': r'teamA',
  r'teamB': r'teamB',
};
const _RoundwinnerTeamValueEnumMap = {
  r'teamA': TeamType.teamA,
  r'teamB': TeamType.teamB,
};

Id _roundGetId(Round object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _roundGetLinks(Round object) {
  return [];
}

void _roundAttach(IsarCollection<dynamic> col, Id id, Round object) {
  object.id = id;
}

extension RoundQueryWhereSort on QueryBuilder<Round, Round, QWhere> {
  QueryBuilder<Round, Round, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension RoundQueryWhere on QueryBuilder<Round, Round, QWhereClause> {
  QueryBuilder<Round, Round, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Round, Round, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Round, Round, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Round, Round, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Round, Round, QAfterWhereClause> idBetween(
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
}

extension RoundQueryFilter on QueryBuilder<Round, Round, QFilterCondition> {
  QueryBuilder<Round, Round, QAfterFilterCondition> gameVariantEqualTo(
    GameVariant value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'gameVariant',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Round, Round, QAfterFilterCondition> gameVariantGreaterThan(
    GameVariant value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'gameVariant',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Round, Round, QAfterFilterCondition> gameVariantLessThan(
    GameVariant value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'gameVariant',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Round, Round, QAfterFilterCondition> gameVariantBetween(
    GameVariant lower,
    GameVariant upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'gameVariant',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Round, Round, QAfterFilterCondition> gameVariantStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'gameVariant',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Round, Round, QAfterFilterCondition> gameVariantEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'gameVariant',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Round, Round, QAfterFilterCondition> gameVariantContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'gameVariant',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Round, Round, QAfterFilterCondition> gameVariantMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'gameVariant',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Round, Round, QAfterFilterCondition> gameVariantIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'gameVariant',
        value: '',
      ));
    });
  }

  QueryBuilder<Round, Round, QAfterFilterCondition> gameVariantIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'gameVariant',
        value: '',
      ));
    });
  }

  QueryBuilder<Round, Round, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Round, Round, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Round, Round, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Round, Round, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Round, Round, QAfterFilterCondition> isCapotEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isCapot',
        value: value,
      ));
    });
  }

  QueryBuilder<Round, Round, QAfterFilterCondition> isDefendingEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isDefending',
        value: value,
      ));
    });
  }

  QueryBuilder<Round, Round, QAfterFilterCondition> roundStatusEqualTo(
    RoundStatus value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'roundStatus',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Round, Round, QAfterFilterCondition> roundStatusGreaterThan(
    RoundStatus value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'roundStatus',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Round, Round, QAfterFilterCondition> roundStatusLessThan(
    RoundStatus value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'roundStatus',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Round, Round, QAfterFilterCondition> roundStatusBetween(
    RoundStatus lower,
    RoundStatus upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'roundStatus',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Round, Round, QAfterFilterCondition> roundStatusStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'roundStatus',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Round, Round, QAfterFilterCondition> roundStatusEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'roundStatus',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Round, Round, QAfterFilterCondition> roundStatusContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'roundStatus',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Round, Round, QAfterFilterCondition> roundStatusMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'roundStatus',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Round, Round, QAfterFilterCondition> roundStatusIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'roundStatus',
        value: '',
      ));
    });
  }

  QueryBuilder<Round, Round, QAfterFilterCondition> roundStatusIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'roundStatus',
        value: '',
      ));
    });
  }

  QueryBuilder<Round, Round, QAfterFilterCondition> scoreEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'score',
        value: value,
      ));
    });
  }

  QueryBuilder<Round, Round, QAfterFilterCondition> scoreGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'score',
        value: value,
      ));
    });
  }

  QueryBuilder<Round, Round, QAfterFilterCondition> scoreLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'score',
        value: value,
      ));
    });
  }

  QueryBuilder<Round, Round, QAfterFilterCondition> scoreBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'score',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Round, Round, QAfterFilterCondition> winnerTeamEqualTo(
    TeamType value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'winnerTeam',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Round, Round, QAfterFilterCondition> winnerTeamGreaterThan(
    TeamType value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'winnerTeam',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Round, Round, QAfterFilterCondition> winnerTeamLessThan(
    TeamType value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'winnerTeam',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Round, Round, QAfterFilterCondition> winnerTeamBetween(
    TeamType lower,
    TeamType upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'winnerTeam',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Round, Round, QAfterFilterCondition> winnerTeamStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'winnerTeam',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Round, Round, QAfterFilterCondition> winnerTeamEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'winnerTeam',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Round, Round, QAfterFilterCondition> winnerTeamContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'winnerTeam',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Round, Round, QAfterFilterCondition> winnerTeamMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'winnerTeam',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Round, Round, QAfterFilterCondition> winnerTeamIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'winnerTeam',
        value: '',
      ));
    });
  }

  QueryBuilder<Round, Round, QAfterFilterCondition> winnerTeamIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'winnerTeam',
        value: '',
      ));
    });
  }
}

extension RoundQueryObject on QueryBuilder<Round, Round, QFilterCondition> {}

extension RoundQueryLinks on QueryBuilder<Round, Round, QFilterCondition> {}

extension RoundQuerySortBy on QueryBuilder<Round, Round, QSortBy> {
  QueryBuilder<Round, Round, QAfterSortBy> sortByGameVariant() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gameVariant', Sort.asc);
    });
  }

  QueryBuilder<Round, Round, QAfterSortBy> sortByGameVariantDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gameVariant', Sort.desc);
    });
  }

  QueryBuilder<Round, Round, QAfterSortBy> sortByIsCapot() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCapot', Sort.asc);
    });
  }

  QueryBuilder<Round, Round, QAfterSortBy> sortByIsCapotDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCapot', Sort.desc);
    });
  }

  QueryBuilder<Round, Round, QAfterSortBy> sortByIsDefending() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDefending', Sort.asc);
    });
  }

  QueryBuilder<Round, Round, QAfterSortBy> sortByIsDefendingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDefending', Sort.desc);
    });
  }

  QueryBuilder<Round, Round, QAfterSortBy> sortByRoundStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'roundStatus', Sort.asc);
    });
  }

  QueryBuilder<Round, Round, QAfterSortBy> sortByRoundStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'roundStatus', Sort.desc);
    });
  }

  QueryBuilder<Round, Round, QAfterSortBy> sortByScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'score', Sort.asc);
    });
  }

  QueryBuilder<Round, Round, QAfterSortBy> sortByScoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'score', Sort.desc);
    });
  }

  QueryBuilder<Round, Round, QAfterSortBy> sortByWinnerTeam() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'winnerTeam', Sort.asc);
    });
  }

  QueryBuilder<Round, Round, QAfterSortBy> sortByWinnerTeamDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'winnerTeam', Sort.desc);
    });
  }
}

extension RoundQuerySortThenBy on QueryBuilder<Round, Round, QSortThenBy> {
  QueryBuilder<Round, Round, QAfterSortBy> thenByGameVariant() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gameVariant', Sort.asc);
    });
  }

  QueryBuilder<Round, Round, QAfterSortBy> thenByGameVariantDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gameVariant', Sort.desc);
    });
  }

  QueryBuilder<Round, Round, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Round, Round, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Round, Round, QAfterSortBy> thenByIsCapot() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCapot', Sort.asc);
    });
  }

  QueryBuilder<Round, Round, QAfterSortBy> thenByIsCapotDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCapot', Sort.desc);
    });
  }

  QueryBuilder<Round, Round, QAfterSortBy> thenByIsDefending() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDefending', Sort.asc);
    });
  }

  QueryBuilder<Round, Round, QAfterSortBy> thenByIsDefendingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDefending', Sort.desc);
    });
  }

  QueryBuilder<Round, Round, QAfterSortBy> thenByRoundStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'roundStatus', Sort.asc);
    });
  }

  QueryBuilder<Round, Round, QAfterSortBy> thenByRoundStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'roundStatus', Sort.desc);
    });
  }

  QueryBuilder<Round, Round, QAfterSortBy> thenByScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'score', Sort.asc);
    });
  }

  QueryBuilder<Round, Round, QAfterSortBy> thenByScoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'score', Sort.desc);
    });
  }

  QueryBuilder<Round, Round, QAfterSortBy> thenByWinnerTeam() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'winnerTeam', Sort.asc);
    });
  }

  QueryBuilder<Round, Round, QAfterSortBy> thenByWinnerTeamDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'winnerTeam', Sort.desc);
    });
  }
}

extension RoundQueryWhereDistinct on QueryBuilder<Round, Round, QDistinct> {
  QueryBuilder<Round, Round, QDistinct> distinctByGameVariant(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'gameVariant', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Round, Round, QDistinct> distinctByIsCapot() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isCapot');
    });
  }

  QueryBuilder<Round, Round, QDistinct> distinctByIsDefending() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isDefending');
    });
  }

  QueryBuilder<Round, Round, QDistinct> distinctByRoundStatus(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'roundStatus', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Round, Round, QDistinct> distinctByScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'score');
    });
  }

  QueryBuilder<Round, Round, QDistinct> distinctByWinnerTeam(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'winnerTeam', caseSensitive: caseSensitive);
    });
  }
}

extension RoundQueryProperty on QueryBuilder<Round, Round, QQueryProperty> {
  QueryBuilder<Round, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Round, GameVariant, QQueryOperations> gameVariantProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'gameVariant');
    });
  }

  QueryBuilder<Round, bool, QQueryOperations> isCapotProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isCapot');
    });
  }

  QueryBuilder<Round, bool, QQueryOperations> isDefendingProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isDefending');
    });
  }

  QueryBuilder<Round, RoundStatus, QQueryOperations> roundStatusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'roundStatus');
    });
  }

  QueryBuilder<Round, int, QQueryOperations> scoreProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'score');
    });
  }

  QueryBuilder<Round, TeamType, QQueryOperations> winnerTeamProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'winnerTeam');
    });
  }
}
