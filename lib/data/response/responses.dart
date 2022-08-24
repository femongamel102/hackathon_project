import 'package:json_annotation/json_annotation.dart';
part 'responses.g.dart';

@JsonSerializable()
class BaseResponse {
  @JsonKey(name: "type")
  String? type;
  @JsonKey(name: "message")
  String? message;
  @JsonKey(name: "data")
  String? data;
}

@JsonSerializable()
class UserResponse {
  @JsonKey(name: "id")
  String? id;
  @JsonKey(name: "firstName")
  String? firstName;
  @JsonKey(name: "lastName")
  String? lastName;
  @JsonKey(name: "email")
  String? email;
  @JsonKey(name: "imageUrl")
  String? imageUrl;
  @JsonKey(name: "address")
  String? address;
  @JsonKey(name: "role")
  String? role;

  UserResponse(this.id, this.firstName, this.lastName, this.email,
      this.imageUrl, this.address, this.role);

  // from json
  factory UserResponse.fromJson(Map<String, dynamic> json) =>
      _$UserResponseFromJson(json);
  // to json
  //this returns to UserResponse
  Map<String,dynamic> toJson() => _$UserResponseToJson(this);
}

@JsonSerializable()
class AuthenticationResponse extends BaseResponse {
  @JsonKey(name: "user")
  UserResponse? user;
  @JsonKey(name: "accessToken")
  String? accessToken;
  @JsonKey(name: "refreshToken")
  String? refreshToken;
  AuthenticationResponse(this.user, this.accessToken, this.refreshToken);

  // from json
  factory AuthenticationResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthenticationResponseFromJson(json);
  // to json
  //this returns to AuthenticationResponse
  Map<String,dynamic> toJson() => _$AuthenticationResponseToJson(this);
}

@JsonSerializable()
class ForgotPasswordResponse extends BaseResponse{

}
