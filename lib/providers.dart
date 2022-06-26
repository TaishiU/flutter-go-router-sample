import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'controllers/auth_controller.dart';

final authController = StateNotifierProvider<AuthController, AuthState>(
  (ref) => AuthController(read: ref.read),
);
