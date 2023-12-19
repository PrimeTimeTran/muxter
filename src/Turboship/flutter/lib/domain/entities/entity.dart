import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'entity.g.dart';

// {
//   "fanScore": 8.91,
//   "languages": [
//     "Swift",
//     "PHP",
//     "R",
//     "Python",
//     "Dart",
//     "Rust"
//   ],
//   "bookAppearances": [
//   ],
//   "topSpells": [
//   ],
//   "potions": 4,
//   "charms": 4,
//   "dada": 2,
//   "apparition": false,
//   "__v": 0
// }

@JsonSerializable()
class Entity extends Equatable {
  final String? id;
  final String? email;
  final String? firstName;
  final String? lastName;
  final String? gender;
  final String? city;
  final String? country;
  final String? jobTitle;
  final String? industry;
  final String? house;
  final String? patronus;
  final String? dob;
  final String? avatarUrl;
  // final double? fanScore;
  // final List? languages;
  // final List<int>? bookAppearances;
  // final List<double>? topSpells;
  // final int? potions;
  // final int? charms;
  // final int? data;
  // final bool? apparition;
  const Entity({
    this.id,
    this.email,
    this.firstName,
    this.lastName,
    this.gender,
    this.city,
    this.country,
    this.jobTitle,
    this.industry,
    this.house,
    this.patronus,
    this.dob,
    this.avatarUrl,
    // this.fanScore,
    // this.languages,
    // this.bookAppearances,
    // this.topSpells,
    // this.potions,
    // this.charms,
    // this.data,
    // this.apparition,
  });
  factory Entity.fromJson(Map<String, dynamic> json) => _$EntityFromJson(json);

  @override
  List<Object?> get props => [
        id,
        email,
        firstName,
        lastName,
        gender,
        city,
        country,
        jobTitle,
        industry,
        house,
        patronus,
        dob,
        avatarUrl,
        // fanScore,
        // languages,
        // bookAppearances,
        // topSpells,
        // potions,
        // charms,
        // data,
        // apparition,
      ];

  Map<String, dynamic> toJson() => _$EntityToJson(this);
}
