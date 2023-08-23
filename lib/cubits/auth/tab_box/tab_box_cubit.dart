import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medium_project/cubits/auth/tab_box/tab_box_state.dart';


class TabBoxCubit extends Cubit<TabBoxState> {
  TabBoxCubit() : super(ProfileScreenState());

  updateScreen({required int index}) {
    if (index == 0) {
      emit(ProfileScreenState());
    } else {
      emit(LoginScreenState());
    }
  }
}