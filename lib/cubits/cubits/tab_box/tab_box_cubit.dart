import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:medium_project/presentation/tab_box/acticle/article_screen.dart';
import 'package:medium_project/presentation/tab_box/profile/profile_screen.dart';
import 'package:meta/meta.dart';
import '../../../data/models/article/article_model.dart';
import '../../../data/models/universal_data.dart';
import '../../../data/repository/auth_repository.dart';
part 'tab_box_state.dart';

class TabBoxCubit extends Cubit<TabBoxState> {
  TabBoxCubit({required this.authRepository}) : super(TabBoxArticleState());

  final AuthRepository authRepository;

  List<Widget> screens = [
    ArticlesScreen(),
    ProfileScreen(),
  ];
  int currentScreenIndex=0;

  selectHomeState() {
    emit(TabBoxArticleState());
    currentScreenIndex=0;
  }

  selectProfileState() {
    emit(TabBoxProfileState());
    currentScreenIndex=1;
  }

  Future<void> getArticles() async {
    emit(TabBoxLoadingState());
    UniversalData universalData =
    await authRepository.getArticles();
    if (universalData.error.isEmpty) {
      emit(TabBoxSuccessState(articles: universalData.data as List<ArticleModel>));
    } else {
      emit(
        TabBoxErrorState(errorText: universalData.error),
      );
    }
  }
}