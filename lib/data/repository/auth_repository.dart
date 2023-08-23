import '../local/storage_repository/storage_repository.dart';
import '../models/universal_data.dart';
import '../models/user/user_model.dart';
import '../network/api_service.dart';

class AuthRepository {
  final ApiService apiService;

  AuthRepository({required this.apiService});

  Future<UniversalData> sendCodeToGmail({
    required String gmail,
    required String password,
  }) async =>
      apiService.sendCodeToGmail(
        gmail: gmail,
        password: password,
      );

  Future<UniversalData> confirmCode({required String code}) async =>
      apiService.confirmCode(code: code);

  Future<UniversalData> registerUser({required UserModel userModel}) async =>
      apiService.registerUser(userModel: userModel);

  Future<UniversalData> loginUser({
    required String gmail,
    required String password,
  }) async =>
      apiService.loginUser(
        gmail: gmail,
        password: password,
      );

  String getToken() => StorageRepository.getString("token");

  Future<bool?> deleteToken() async => StorageRepository.deleteString("token");

  Future<void> setToken(String newToken) async =>
      StorageRepository.putString("token", newToken);
}
