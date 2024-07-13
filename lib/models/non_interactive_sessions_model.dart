class NonInteractiveSessionModel {
  String? status;
  List<LiveSession>? liveSession;

  NonInteractiveSessionModel({this.status, this.liveSession});

  NonInteractiveSessionModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['live_session'] != null) {
      liveSession = <LiveSession>[];
      json['live_session'].forEach((v) {
        liveSession!.add(new LiveSession.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['status'] = this.status;
    if (this.liveSession != null) {
      data['live_session'] = this.liveSession!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class LiveSession {
  int? id;
  int? businessId;
  String? url;
  String? createdAt;

  LiveSession({this.id, this.businessId, this.url, this.createdAt});

  LiveSession.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    businessId = json['business_id'];
    url = json['url'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['business_id'] = this.businessId;
    data['url'] = this.url;
    data['created_at'] = this.createdAt;
    return data;
  }
}
