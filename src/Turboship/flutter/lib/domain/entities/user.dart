import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User extends Equatable {
  const User({
    required this.id,
    required this.fullName,
    required this.email,
    this.dateOfBirth,
    this.gender,
    this.referralCode,
    this.isEmailVerified = false,
    this.hasSignedContract = false,
  });

  final String id;
  final String email;
  final String fullName;
  final DateTime? dateOfBirth;
  final Gender? gender;
  final String? referralCode;
  final bool isEmailVerified;
  final bool hasSignedContract;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  User copyWith({
    String? fullName,
    String? email,
    DateTime? dateOfBirth,
    Gender? gender,
    bool? isEmailVerified,
    bool? hasSignedContract,
  }) {
    return User(
      id: id,
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      gender: gender ?? this.gender,
      referralCode: referralCode,
      isEmailVerified: isEmailVerified ?? this.isEmailVerified,
      hasSignedContract: hasSignedContract ?? this.hasSignedContract,
    );
  }

  @override
  List<Object?> get props => [
        id,
        email,
        fullName,
        isEmailVerified,
        hasSignedContract,
        referralCode,
        gender,
        dateOfBirth,
      ];
}

enum Gender { male, female, other }
