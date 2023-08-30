import '../models/universal_data.dart';
import '../network/open_api_service.dart';
import '../network/secure_api_service.dart';

class ArticleRepository {
  final SecureApiService secureApiService;
  final OpenApiService openApiService;

  ArticleRepository({
    required this.secureApiService,
    required this.openApiService,
  });

  Future<UniversalData> getArticles() async => openApiService.getArticles();

}