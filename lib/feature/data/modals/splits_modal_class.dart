class SplitsModalClass {
  bool? success;
  String? message;
  List<SplitData>? data;
  int? total;
  int? currentPage;
  int? totalPages;

  SplitsModalClass(
      {this.success,
        this.message,
        this.data,
        this.total,
        this.currentPage,
        this.totalPages});

  SplitsModalClass.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <SplitData>[];
      json['data'].forEach((v) {
        data!.add(new SplitData.fromJson(v));
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

class SplitData {
  String? sId;
  String? companyName;
  int? oldFv;
  int? newFv;
  String? splitDate;
  String? createdAt;
  String? updatedAt;
  int? iV;

  SplitData(
      {this.sId,
        this.companyName,
        this.oldFv,
        this.newFv,
        this.splitDate,
        this.createdAt,
        this.updatedAt,
        this.iV});

  SplitData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    companyName = json['companyName'];
    oldFv = json['oldFv'];
    newFv = json['newFv'];
    splitDate = json['splitDate'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['companyName'] = this.companyName;
    data['oldFv'] = this.oldFv;
    data['newFv'] = this.newFv;
    data['splitDate'] = this.splitDate;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}
