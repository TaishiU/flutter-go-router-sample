import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:go_router_sample/controllers/auth_status_controller.dart';
import 'package:go_router_sample/providers.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

part 'auth_controller.freezed.dart';

@freezed
abstract class AuthState with _$AuthState {
  const factory AuthState({
    @Default(true) bool isObscure,
    @Default('') String email,
    @Default('') String password,
    @Default('') String emailError,
    @Default('') String passwordError,
  }) = _AuthState;
}

class AuthController extends StateNotifier<AuthState> {
  AuthController({required this.ref}) : super(const AuthState()) {
    onAuthStateChanged();
  }

  final Ref ref;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _secureStorage = const FlutterSecureStorage();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    print('AuthController) dispose()が呼ばれました！');
    super.dispose();
  }

  Future<void> onAuthStateChanged() async {
    print('ログイン状態判断メソッド: onAuthStateChanged()');
    // await deleteStorage();
    await readStorage();
  }

  Future<void> deleteStorage() async {
    _secureStorage.deleteAll();
  }

  Future<void> readStorage() async {
    final email = await _secureStorage.read(key: 'email');
    final password = await _secureStorage.read(key: 'password');

    if (email != null && password != null) {
      ref
          .read(authStatusController.notifier)
          .changeAuthStatus(AuthStatus.signedIn);
    }
  }

  void onChangedEmail(String email) {
    state = state.copyWith(email: email);
  }

  void onChangedPassword(String password) {
    state = state.copyWith(password: password);
  }

  void switchObscure() {
    state = state.copyWith(isObscure: !state.isObscure);
  }

  Future<void> login() async {
    if (state.email == '' || state.password == '') {
      return;
    }
    await writeLoginData(
      email: state.email,
      password: state.password,
    );
    ref
        .read(authStatusController.notifier)
        .changeAuthStatus(AuthStatus.signedIn);
  }

  Future<void> logout() async {
    ref
        .read(authStatusController.notifier)
        .changeAuthStatus(AuthStatus.notSignedIn);
    await deleteLoginData();
  }

  // void changeLoginButtonStatus() {
  //   state = state.copyWith(
  //     isLoginButtonDisabled: passwordController.text.isEmpty,
  //   );
  // }

  // Future<bool> login() async {
  //   try {
  //     final _baseUrl = environment['soonAppApi']!;
  //
  //     final body = {'password': passwordController.text};
  //
  //     final response = await http.post(
  //       Uri.parse('${_baseUrl}intercoms/sign_in'),
  //       body: body,
  //     );
  //
  //     final data = jsonDecode(response.body) as Map<String, dynamic>;
  //
  //     if (response.statusCode == 200) {
  //       state = state.copyWith(
  //         status: AuthStatus.signedIn,
  //         token: data['token'],
  //       );
  //       await _writeLoginData(accessToken: data['token']);
  //       passwordController.clear();
  //       return true;
  //     } else {
  //       state = state.copyWith(
  //         loginError: true,
  //         errorMessage: data['result'],
  //       );
  //       return false;
  //     }
  //   } catch (e) {
  //     print('エラー発生: $e');
  //     throw Exception(e);
  //   }
  // }

  Future<void> writeLoginData({
    required String email,
    required String password,
  }) async {
    await Future.wait([
      _secureStorage.write(key: 'email', value: email),
      _secureStorage.write(key: 'password', value: password),
    ]);
  }

  Future<void> deleteLoginData() async {
    await Future.wait([
      _secureStorage.delete(key: 'email'),
      _secureStorage.delete(key: 'password'),
    ]);
  }
}
