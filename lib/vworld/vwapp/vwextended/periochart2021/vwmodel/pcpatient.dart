import 'package:json_annotation/json_annotation.dart';
import 'package:hive/hive.dart';
part 'pcpatient.g.dart';


@HiveType(typeId: 4)
@JsonSerializable()
class PcPatient {
  PcPatient({
    this.id,
    this.fullName,
    this.gender,
    this.birthOfDate,
    this.allergy,
    this.medicalHistory,
    this.address,
    this.city,
    this.phone,
    this.occupation,
  });

  factory PcPatient.fromJson(Map<String, dynamic> json) =>
      _$PcPatientFromJson(json);

  Map<String, dynamic> toJson() => _$PcPatientToJson(this);

  @HiveField(0)
  final String id;

  @HiveField(1)
  String fullName;

  @HiveField(2)
  String gender;

  @HiveField(3)
  DateTime birthOfDate;

  @HiveField(4)
  String allergy;

  @HiveField(5)
  String medicalHistory;

  @HiveField(6)
  String address;

  @HiveField(7)
  String city;

  @HiveField(8)
  String phone;

  @HiveField(9)
  String occupation;
}
