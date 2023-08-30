import 'package:equatable/equatable.dart';
import '../data/models/article/article_model.dart';

abstract class ArticleState extends Equatable {}

class ArticleInitialState extends ArticleState {
  @override
  List<Object?> get props => [];
}

class ArticleLoadingState extends ArticleState {
  @override
  List<Object?> get props => [];
}

class ArticleSuccessState extends ArticleState {
  ArticleSuccessState({required this.articleModel});

  final List<ArticleModel> articleModel;

  @override
  List<Object?> get props => [articleModel];
}

class ArticleErrorState extends ArticleState {
  ArticleErrorState({required this.errorText});

  final String errorText;

  @override
  List<Object?> get props => [errorText];
}