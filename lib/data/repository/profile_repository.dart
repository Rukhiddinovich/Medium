import 'package:medium_project/data/network/api_service.dart';
import '../models/universal_data.dart';

class ProfileRepository{
  final ApiService apiService;

  ProfileRepository({required this.apiService});
  Future<UniversalData>getUserData()async=>apiService.getProfileData();
}