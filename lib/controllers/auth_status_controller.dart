import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

part 'auth_status_controller.freezed.dart';

enum AuthStatus { none, notSignedIn, signedIn }

@freezed
abstract class AuthStatusState with _$AuthStatusState {
  const factory AuthStatusState({
    @Default(AuthStatus.notSignedIn) AuthStatus status,
  }) = _AuthStatusState;
}

class AuthStatusController extends StateNotifier<AuthStatusState> {
  AuthStatusController({required this.ref}) : super(const AuthStatusState()) {
    // onAuthStatusStateChanged();
  }

  final Ref ref;

  @override
  void dispose() {
    super.dispose();
  }

  void changeAuthStatus(AuthStatus status) {
    state = state.copyWith(status: status);
    print('changeAuthStatus()');
    print('status: ${state.status}');
  }
}
