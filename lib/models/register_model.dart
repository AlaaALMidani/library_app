class RegisterModel {
  int? status;
  String? message;
  UserData? data;
  RegisterModel.fromJSON(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (status == 200) {
      data = UserData.fromJson(json['data']);
    }
  }
}

class UserData {
  int? id;
  String? name;
  String? email;

  UserData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
   
  }
}