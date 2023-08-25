part of 'tab_box_cubit.dart';

@immutable
abstract class TabBoxState extends Equatable {}

class TabBoxArticleState extends TabBoxState {
  @override
  List<Object?> get props => [];
}

class TabBoxProfileState extends TabBoxState {
  @override
  List<Object?> get props => [];
}

class TabBoxLoadingState extends TabBoxState {
  @override
  List<Object?> get props => [];
}

class TabBoxSuccessState extends TabBoxState {
  final List<ArticleModel> articles;

  TabBoxSuccessState({required this.articles});

  @override
  List<Object?> get props => [];
}

class TabBoxErrorState extends TabBoxState {
  final String errorText;

  TabBoxErrorState({required this.errorText});

  @override
  List<Object?> get props => [];
}
