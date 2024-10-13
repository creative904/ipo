class BonusModalClass {
  bool? success;
  String? message;
  List<BonusData>? data;
  int? total;
  int? currentPage;
  int? totalPages;

  BonusModalClass(
      {this.success,
        this.message,
        this.data,
        this.total,
        this.currentPage,
        this.totalPages});

  BonusModalClass.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <BonusData>[];
      json['data'].forEach((v) {
        data!.add(new BonusData.fromJson(v));
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

class BonusData {
  String? sId;
  String? companyName;
  String? bonusRatio;
  String? announcementDate;
  String? recordDate;
  String? exBonus;
  String? createdAt;
  String? updatedAt;
  int? iV;

  BonusData(
      {this.sId,
        this.companyName,
        this.bonusRatio,
        this.announcementDate,
        this.recordDate,
        this.exBonus,
        this.createdAt,
        this.updatedAt,
        this.iV});

  BonusData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    companyName = json['companyName'];
    bonusRatio = json['bonusRatio'];
    announcementDate = json['announcementDate'];
    recordDate = json['recordDate'];
    exBonus = json['exBonus'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['companyName'] = this.companyName;
    data['bonusRatio'] = this.bonusRatio;
    data['announcementDate'] = this.announcementDate;
    data['recordDate'] = this.recordDate;
    data['exBonus'] = this.exBonus;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}
