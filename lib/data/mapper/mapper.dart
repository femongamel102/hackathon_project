import 'package:hackathon_project/app/constants.dart';
import 'package:hackathon_project/app/extensions.dart';
import 'package:hackathon_project/data/response/responses.dart';
import 'package:hackathon_project/domain/model/models.dart';

extension UserResponseMapper on UserResponse? {
  User toDomain() {
    return User(
        this?.id.orEmpty() ?? Constants.empty,
        this?.firstName.orEmpty() ?? Constants.empty,
        this?.lastName.orEmpty() ?? Constants.empty,
        this?.email.orEmpty() ?? Constants.empty,
        this?.imageUrl.orEmpty() ?? Constants.empty);
  }
}

extension AuthenticationResponseMapper on AuthenticationResponse? {
  Authentication toDomain() {
    return Authentication(
      this?.user.toDomain(),
    );
  }
}
