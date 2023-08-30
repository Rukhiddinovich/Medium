import '../models/universal_data.dart';
import '../models/website/website_model.dart';
import '../network/open_api_service.dart';
import '../network/secure_api_service.dart';

class WebsiteRepository {
  final SecureApiService secureApiService;
  final OpenApiService openApiService;

  WebsiteRepository({
    required this.secureApiService,
    required this.openApiService,
  });

  Future<UniversalData> getWebsites() async => openApiService.getWebsites();

  Future<UniversalData> getWebsiteById(int websiteId) async =>
      openApiService.getWebsiteById(websiteId);

  Future<UniversalData> createWebsite(WebsiteModel newWebsite) async =>
      secureApiService.createWebsite(websiteModel: newWebsite);
}