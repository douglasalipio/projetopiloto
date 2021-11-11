import 'package:flutter_test/flutter_test.dart';
import 'package:projeto_piloto/data/auth/models/auth_model.dart';
import 'package:projeto_piloto/data/auth/models/auth_model_to_auth_mapper.dart';

void main() {
  final mapper = AuthModelToUserMapper();
  test('should map from a user model to use', () async {
    // arrange
    final userModel =
        AuthModel(email: "douglas@gmail.com", displayName: "displayName", profileUrl: "url");
    // act
    final expected = mapper.map(userModel);
    // assert
    expect(expected.email, userModel.email);
    expect(expected.displayName, userModel.displayName);
  });
}
