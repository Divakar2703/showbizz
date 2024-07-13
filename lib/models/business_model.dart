class BusinessModel {
  String? status;
  List<Business>? business;

  BusinessModel({this.status, this.business});

  BusinessModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['business'] != null) {
      business = <Business>[];
      json['business'].forEach((v) {
        business!.add(new Business.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.business != null) {
      data['business'] = this.business!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Business {
  int? id;
  String? businessName;
  String? token;
  String? email;
  String? password;
  String? description;
  String? logo;
  String? coverImage;
  String? pincode;
  String? lat;
  String? lng;
  String? addr;
  String? phone;
  String? image;
  String? status;
  String? createdAt;

  Business(
      {this.id,
      this.businessName,
      this.token,
      this.email,
      this.password,
      this.description,
      this.logo,
      this.coverImage,
      this.pincode,
      this.lat,
      this.lng,
      this.addr,
      this.phone,
      this.image,
      this.status,
      this.createdAt});

  Business.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    businessName = json['business_name'];
    token = json['token'];
    email = json['email'];
    password = json['password'];
    description = json['description'];
    logo = json['logo'];
    coverImage = json['cover_image'];
    pincode = json['pincode'];
    lat = json['lat'];
    lng = json['lng'];
    addr = json['addr'];
    phone = json['phone'];
    image = json['image'];
    status = json['status'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['business_name'] = this.businessName;
    data['token'] = this.token;
    data['email'] = this.email;
    data['password'] = this.password;
    data['description'] = this.description;
    data['logo'] = this.logo;
    data['cover_image'] = this.coverImage;
    data['pincode'] = this.pincode;
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    data['addr'] = this.addr;
    data['phone'] = this.phone;
    data['image'] = this.image;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    return data;
  }
}
