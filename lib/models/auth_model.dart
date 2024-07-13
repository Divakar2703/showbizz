class AuthModel {
  String? status;
  String? reason;
  AuthData? data;

  AuthModel({this.status, this.reason, this.data});

  AuthModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    reason = json['reason'];
    data = json['data'] != null ? AuthData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['reason'] = reason;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class AuthData {
  String? userId;
  String? email;
  String? type;
  String? token;

  AuthData({this.userId, this.email, this.type, this.token});

  AuthData.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    email = json['email'];
    type = json['type'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = userId;
    data['email'] = email;
    data['type'] = type;
    data['token'] = token;
    return data;
  }
}
