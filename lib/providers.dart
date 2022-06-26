import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'controllers/auth_controller.dart';
import 'controllers/auth_status_controller.dart';

final authStatusController =
    StateNotifierProvider<AuthStatusController, AuthStatusState>(
  (ref) => AuthStatusController(ref: ref),
);

final authController = StateNotifierProvider<AuthController, AuthState>(
  (ref) => AuthController(ref: ref),
);
