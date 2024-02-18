// ignore_for_file: invalid_annotation_target

/* 
* Packages

1) freezed
2) freezed_annotation
3) json_serializable

* json_annotation offers functionality of converting paramater to another type for example int to String

class IntToStringConverter implements JsonConverter<String, int> {
  const IntToStringConverter();

  @override
  String fromJson(int json) => '$json';

  @override
  int toJson(String object) => int.parse(object);
}

class NullableIntToNullableStringConverter implements JsonConverter<String?, int?> {
  const NullableIntToNullableStringConverter();

  @override
  String? fromJson(int? json) => json?.toString();

  @override
  int? toJson(String? object) => object != null ? int.parse(object) : null;
}

* E.g 

@freezed
class MarvelComic with _$MarvelComic {
  const factory MarvelComic({
    @IntToStringConverter() required String id,
    @NullableIntToNullableStringConverter() String? issueNumber,
    ...
  }) = _MarvelComic;

  factory MarvelComic.fromJson(Map<String, dynamic> json) => _$MarvelComicFromJson(json);
}

* Freezed provides unions 

@Freezed(unionKey: 'type')
class MarvelStorySummary with _$MarvelStorySummary {
  @FreezedUnionValue('cover')
  const factory MarvelStorySummary.cover({
    ...
  }) = _CoverMarvelStorySummary;

  @FreezedUnionValue('interiorStory')
  const factory MarvelStorySummary.interior({
    ...
  }) = _InteriorMarvelStorySummary;

  @FreezedUnionValue('promo')
  const factory MarvelStorySummary.promo({
    ...
  }) = _PromoMarvelStorySummary;

  factory MarvelStorySummary.fromJson(Map<String, dynamic> json) =>
      _$MarvelStorySummaryFromJson(json);
}
 
 * NOTE : To have the subset of set we can change at runtime
 https://medium.com/@foxanna/basic-and-advanced-networking-in-dart-and-flutter-the-tide-way-170fa08b9169

 
 */

import 'package:freezed_annotation/freezed_annotation.dart';

part 'person.freezed.dart';
part 'person.g.dart';

@freezed
class Employee with _$Employee {
  // To Create to Json for Internal Classes
  @JsonSerializable(explicitToJson: true)
  const factory Employee(
      {required Person person,
      @JsonKey(name: 'designation') required String designation}) = _Employee;

  factory Employee.fromJson(Map<String, dynamic> json) =>
      _$EmployeeFromJson(json);
}

@freezed
class Person with _$Person {
  @JsonSerializable(explicitToJson: true)
  const factory Person(
      {required int id,
      required String name,
      required int age,
      @Default(<String>[]) List<String> mobileDevides}) = _Person;

  factory Person.fromJson(Map<String, Object?> json) => _$PersonFromJson(json);
}

@JsonEnum()
enum MarvelComicFormat {
  @JsonValue('Comic')
  comic,
  @JsonValue('Magazine')
  magazine,
  @JsonValue('Trade Paperback')
  tradePaperback,
  @JsonValue('Hardcover')
  hardCover,
  @JsonValue('Digest')
  digest,
  @JsonValue('Graphic Novel')
  graphicNovel,
  @JsonValue('Digital Comic')
  digitalComic,
  @JsonValue('Infinite Comic')
  infiniteComic,
}
