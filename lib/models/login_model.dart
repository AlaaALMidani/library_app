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
      data = UserData.fromJSON(json[data]);
    }
  }
}

class UserData {
  int? id;
  String? name;
  String? email;
  String? wallet;
  String? role;
  UserData.fromJSON(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    wallet = json['wallet'];
    role = json['role'];
  }
}
