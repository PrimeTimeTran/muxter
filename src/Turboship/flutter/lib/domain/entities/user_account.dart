import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_account.g.dart';

@JsonSerializable()
class BaseInfo extends Equatable {
  final double rate;
  final double plSum;
  final double plPercent;
  final double totalSum;
  final double transfersSum;

  const BaseInfo({
    required this.rate,
    required this.plSum,
    required this.totalSum,
    required this.plPercent,
    required this.transfersSum,
  });

  factory BaseInfo.fromJson(Map<String, dynamic> json) =>
      _$BaseInfoFromJson(json);

  @override
  List<Object?> get props => [
        rate,
        plSum,
        plPercent,
        totalSum,
        transfersSum,
      ];

  Map<String, dynamic> toJson() => _$BaseInfoToJson(this);
}

@JsonSerializable()
class UserAccount extends Equatable {
  final double plSum;

  final double plPercent;
  final double totalSum;
  final double transfersSum;
  final BaseInfo safe;

  const UserAccount({
    required this.plSum,
    required this.plPercent,
    required this.totalSum,
    required this.transfersSum,
    required this.safe,
  });

  factory UserAccount.fromJson(Map<String, dynamic> json) =>
      _$UserAccountFromJson(json);

  @override
  List<Object?> get props => [
        plSum,
        safe,
        plPercent,
        totalSum,
        transfersSum,
      ];

  Map<String, dynamic> toJson() => _$UserAccountToJson(this);
}
