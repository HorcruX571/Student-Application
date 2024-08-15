import 'package:assignment/features/auth/data/models/user_model.dart';
import 'package:assignment/core/network/api_service.dart';

class AuthRepository {
  final ApiService apiService;

  AuthRepository({required this.apiService});

  Future<UserModel> login(String email, String password) async {
    try {
      final response = await apiService.post(
        endpoint: '/u/login',
        data: {'email': email, 'password': password},
      );
      return UserModel.fromJson(response);
    } catch (e) {
      print('Login error: $e');
      rethrow;
    }
  }

  Future<UserModel> signup(String email, String password) async {
    try {
      final response = await apiService.post(
        endpoint: '/u/register',
        data: {'email': email, 'password': password},
      );
      return UserModel.fromJson(response);
    } catch (e) {
      print('Signup error: $e');
      rethrow;
    }
  }
}
