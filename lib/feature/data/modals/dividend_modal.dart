class DividendModalClass {
  bool? success;
  String? message;
  List<Data>? data;
  int? total;
  int? currentPage;
  int? totalPages;

  DividendModalClass(
      {this.success,
        this.message,
        this.data,
        this.total,
        this.currentPage,
        this.totalPages});

  DividendModalClass.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
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

class Data {
  String? sId;
  String? companyName;
  String? dividentType;
  String? announcementDate;
  String? recordDate;
  String? exDividend;
  double? previousClose;
  double? dividenPrice;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Data(
      {this.sId,
        this.companyName,
        this.dividentType,
        this.announcementDate,
        this.recordDate,
        this.exDividend,
        this.previousClose,
        this.dividenPrice,
        this.createdAt,
        this.updatedAt,
        this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    companyName = json['companyName'];
    dividentType = json['dividentType'];
    announcementDate = json['announcementDate'];
    recordDate = json['recordDate'];
    exDividend = json['exDividend'];
    previousClose = json['previousClose'];
    dividenPrice = json['dividenPrice'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['companyName'] = this.companyName;
    data['dividentType'] = this.dividentType;
    data['announcementDate'] = this.announcementDate;
    data['recordDate'] = this.recordDate;
    data['exDividend'] = this.exDividend;
    data['previousClose'] = this.previousClose;
    data['dividenPrice'] = this.dividenPrice;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}
