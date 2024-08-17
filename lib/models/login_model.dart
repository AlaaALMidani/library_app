import 'package:library_app/shared/components/constants.dart';

class LoginModel {
  int? status;
  String? token;
  String? message;
  UserData? data;
  LoginModel.fromJSON(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (status == 200) {
      token = json['token'];
      accessToken = token ; 
      data = UserData.fromJson(json['data']);
    }
  }
}

class UserData {
  int? id;
  String? name;
  String? email;
  String? wallet;
  String? role;
  UserData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    wallet = json['wallet'];
    role = json['role'];
  }
}
