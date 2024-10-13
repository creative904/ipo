class RightsModalClass {
  bool? success;
  String? message;
  List<RightsData>? data;
  int? total;
  int? currentPage;
  int? totalPages;

  RightsModalClass(
      {this.success,
        this.message,
        this.data,
        this.total,
        this.currentPage,
        this.totalPages});

  RightsModalClass.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <RightsData>[];
      json['data'].forEach((v) {
        data!.add(new RightsData.fromJson(v));
      });
    }
    total = json['total'];
    currentPage = json['currentPage'];
    totalPages = json['totalPages'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['total'] = this.total;
    data['currentPage'] = this.currentPage;
    data['totalPages'] = this.totalPages;
    return data;
  }
}

class RightsData {
  String? sId;
  String? name;
  String? rightRatio;
  int? faceValue;
  int? premium;
  String? announcementDate;
  String? recordDate;
  String? exRights;
  String? createdAt;
  String? updatedAt;
  int? iV;

  RightsData(
      {this.sId,
        this.name,
        this.rightRatio,
        this.faceValue,
        this.premium,
        this.announcementDate,
        this.recordDate,
        this.exRights,
        this.createdAt,
        this.updatedAt,
        this.iV});

  RightsData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    rightRatio = json['rightRatio'];
    faceValue = json['faceValue'];
    premium = json['premium'];
    announcementDate = json['announcementDate'];
    recordDate = json['recordDate'];
    exRights = json['exRights'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['rightRatio'] = this.rightRatio;
    data['faceValue'] = this.faceValue;
    data['premium'] = this.premium;
    data['announcementDate'] = this.announcementDate;
    data['recordDate'] = this.recordDate;
    data['exRights'] = this.exRights;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}
