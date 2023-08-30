import '../models/universal_data.dart';
import '../network/secure_api_service.dart';

class ProfileRepository {
  final SecureApiService apiService;

  ProfileRepository({required this.apiService});

  Future<UniversalData> getUserData() async => apiService.getProfileData();
}