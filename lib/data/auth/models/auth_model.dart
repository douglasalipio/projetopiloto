import 'package:projeto_piloto/domain/auth/entities/auth.dart';

class AuthModel extends Auth {
  final String email;
  final String profileUrl;
  final String displayName;

  AuthModel(
      {required this.email,
      required this.profileUrl,
      required this.displayName})
      : super(email, displayName, profileUrl);
}

extension UserModelMapper on AuthModel {
  Auth get mapper => Auth(this.email, this.displayName, this.profileUrl);
}
