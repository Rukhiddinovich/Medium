part of 'tab_box_cubit.dart';

@immutable
abstract class TabBoxState {}

class TabBoxArticleState extends TabBoxState {}

class TabBoxProfileState extends TabBoxState {}

class TabBoxLoadingState extends TabBoxState {}

class TabBoxSuccessState extends TabBoxState {
  final List<ArticleModel> articles;

  TabBoxSuccessState({required this.articles});
}

class TabBoxErrorState extends TabBoxState {
  final String errorText;

  TabBoxErrorState({required this.errorText});
}
