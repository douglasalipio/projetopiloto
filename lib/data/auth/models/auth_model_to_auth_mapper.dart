

import 'package:projeto_piloto/domain/auth/entities/auth.dart';
import 'package:projeto_piloto/domain/auth/mapper.dart';

import 'auth_model.dart';

class AuthModelToUserMapper implements Mapper<AuthModel, Auth> {

  @override
  Auth map(AuthModel from) =>
      Auth(from.email, from.displayName, from.profileUrl);
}
