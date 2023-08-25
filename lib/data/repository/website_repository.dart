import 'package:medium_project/data/network/api_service.dart';
import '../models/universal_data.dart';
import '../models/website/website_model.dart';

class WebsiteRepository {
  final ApiService apiService;

  WebsiteRepository({required this.apiService});

  Future<UniversalData> getWebsites() async => apiService.getWebsites();

  Future<UniversalData> getWebsiteById(int websiteId) async =>
      apiService.getWebsiteById(websiteId);

  Future<UniversalData> createWebsite(WebsiteModel newWebsite) async =>
      apiService.createWebsite(websiteModel: newWebsite);
}
