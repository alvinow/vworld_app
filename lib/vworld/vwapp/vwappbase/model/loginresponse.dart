import 'package:vworld_app/vworld/vwapp/vwappbase/model/userlogin.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:hive/hive.dart';
part 'loginresponse.g.dart';

@HiveType(typeId: 6)
@JsonSerializable()
class LoginResponse{

  LoginResponse({
    this.success:false,
    this.authenticated:false,
    this.loginsessionId,
    this.userProfile,

  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);

  @HiveField(0)
  final bool success;

  @HiveField(1)
  final bool authenticated;

  @HiveField(2)
  @JsonKey(name: 'loginsession_id')
  final String loginsessionId;

  @HiveField(3)
  final Userlogin userProfile;








}