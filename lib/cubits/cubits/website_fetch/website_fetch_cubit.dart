import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import '../../../data/models/status/form_status.dart';
import '../../../data/models/universal_data.dart';
import '../../../data/models/website/website_model.dart';
import '../../../data/repository/website_repository.dart';
import '../../../utils/constants/constants.dart';
import '../../../utils/ui_utils/loading_dialog.dart';

part 'website_fetch_state.dart';

class WebsiteFetchCubit extends Cubit<WebsiteFetchState> {
  WebsiteFetchCubit({required this.websiteRepository})
      : super(const WebsiteFetchState(websites: []));

  final WebsiteRepository websiteRepository;

  getWebsites(BuildContext context) async {
    emit(
      state.copyWith(
        status: FormStatus.loading,
        statusText: "",
      ),
    );
    showLoading(context: context);
    UniversalData response = await websiteRepository.getWebsites();
    if (context.mounted) {
      hideLoading(context: context);
    }
    if (response.error.isEmpty) {
      emit(
        state.copyWith(
          status: FormStatus.success,
          statusText: StatusTextConstants.gotAllWebsite,
          websites: response.data as List<WebsiteModel>,
        ),
      );
    } else {
      emit(state.copyWith(
        status: FormStatus.failure,
        statusText: response.error,
      ));
    }
  }

  getWebsiteById(int websiteId) async {
    emit(state.copyWith(
      status: FormStatus.loading,
      statusText: "",
    ));
    UniversalData response = await websiteRepository.getWebsiteById(websiteId);
    if (response.error.isEmpty) {
      emit(
        state.copyWith(
          status: FormStatus.success,
          statusText: StatusTextConstants.gotWebsiteById,
          websiteDetail: response.data as WebsiteModel,
        ),
      );
    } else {
      emit(state.copyWith(
        status: FormStatus.failure,
        statusText: response.error,
      ));
    }
  }
}