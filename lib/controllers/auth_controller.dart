import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

part 'auth_controller.freezed.dart';

enum AuthStatus { none, notSignedIn, signedIn }

@freezed
abstract class AuthState with _$AuthState {
  const factory AuthState({
    @Default(AuthStatus.notSignedIn) AuthStatus status,
  }) = _AuthState;
}

class AuthController extends StateNotifier<AuthState> {
  AuthController({required this.read}) : super(const AuthState()) {
    onAuthStateChanged();
  }

  final Reader read;

  final passwordController = TextEditingController();
  final _secureStorage = const FlutterSecureStorage();

  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }

  Future<void> onAuthStateChanged() async {
    print('初期status: ${state.status}');
    const storage = FlutterSecureStorage();
    // storage.deleteAll();
    // final token = await storage.read(key: 'accessToken');
    // if (token == null) {
    //   print('tokenがnullです');
    //   state = state.copyWith(status: AuthStatus.notSignedIn);
    // } else {
    //   print('tokenを保存しています！');
    //   print('token: $token');
    //   state = state.copyWith(
    //     status: AuthStatus.signedIn,
    //     token: token,
    //   );
    // }
  }

  void login() {
    state = state.copyWith(status: AuthStatus.signedIn);
    print('login()');
    print('status: ${state.status}');
  }

  // void changeLoginButtonStatus() {
  //   state = state.copyWith(
  //     isLoginButtonDisabled: passwordController.text.isEmpty,
  //   );
  // }

  // void switchObscure() {
  //   if (state.isObscure) {
  //     state = state.copyWith(isObscure: false);
  //   } else {
  //     state = state.copyWith(isObscure: true);
  //   }
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

  Future<void> _writeLoginData({
    required String accessToken,
  }) async {
    await Future.wait([
      _secureStorage.write(key: 'accessToken', value: accessToken),
    ]);
  }
}
