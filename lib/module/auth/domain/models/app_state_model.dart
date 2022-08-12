import 'package:robust_chat/lib.dart';

import '../../../../utils/view_state.dart';

class AppStateModel {
  final ViewState viewState;
  final String? message;

  AppStateModel({
    this.viewState = ViewState.idle,
    this.message,
  });
}
