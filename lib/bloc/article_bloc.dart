import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/models/article/article_model.dart';
import '../data/models/universal_data.dart';
import '../data/repository/article_repository.dart';
import 'article_event.dart';
import 'article_state.dart';

class ArticleBloc extends Bloc<ArticleEvent, ArticleState> {
  ArticleBloc({required this.articleRepository})
      : super(ArticleInitialState()) {
    on<GetArticles>(_getArticles);
    // on<GetArticleById>(_getArticleById);
  }

  final ArticleRepository articleRepository;

  Future<void> _getArticles(
    GetArticles event,
    Emitter<ArticleState> emit,
  ) async {
    emit(ArticleLoadingState());
    UniversalData response = await articleRepository.getArticles();
    if (response.error.isEmpty) {
      emit(ArticleSuccessState(articleModel: response.data as List<ArticleModel>));
    } else {
      emit(ArticleErrorState(errorText: response.error));
    }
  }

// Future<void> _getArticleById(
//   GetArticleById event,
//   Emitter<ArticleState> emit,
// ) async {
//   emit(ArticleLoadingState());
//   UniversalData response = await articleRepository.getArticleById(articleId:event.articleId);
//   if (response.error.isEmpty) {
//     emit(ArticleSuccessState(articles: response.data as List<ArticleModel>));
//   } else {
//     emit(ArticleErrorState(errorText: response.error));
//   }
// }
}
