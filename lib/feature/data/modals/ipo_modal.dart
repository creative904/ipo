class IpoModalClass {
  bool? success;
  String? message;
  Data? data;

  IpoModalClass({this.success, this.message, this.data});

  IpoModalClass.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  List<Ipos>? ipos;
  int? total;
  int? currentPage;
  int? totalPages;

  Data({this.ipos, this.total, this.currentPage, this.totalPages});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['ipos'] != null) {
      ipos = <Ipos>[];
      json['ipos'].forEach((v) {
        ipos!.add(new Ipos.fromJson(v));
      });
    }
    total = json['total'];
    currentPage = json['currentPage'];
    totalPages = json['totalPages'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.ipos != null) {
      data['ipos'] = this.ipos!.map((v) => v.toJson()).toList();
    }
    data['total'] = this.total;
    data['currentPage'] = this.currentPage;
    data['totalPages'] = this.totalPages;
    return data;
  }
}

class Ipos {
  String? sId;
  String? name;
  String? offerDate;
  String? offerPrice;
  int? lotSize;
  String? subscriptions;
  String? expectedPrem;
  String? listingDate;
  bool? isLive;
  String? nseCode;
  String? bseCode;
  String? news;
  int? listingPrice;
  String? premiumOrDiscount;
  String? refundDate;
  String? listingPercent;

  Ipos(
      {this.sId,
        this.name,
        this.offerDate,
        this.offerPrice,
        this.lotSize,
        this.subscriptions,
        this.expectedPrem,
        this.listingDate,
        this.isLive,
        this.nseCode,
        this.bseCode,
        this.news,
        this.listingPrice,
        this.premiumOrDiscount,
        this.refundDate,
        this.listingPercent});

  Ipos.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    offerDate = json['offerDate'];
    offerPrice = json['offerPrice'];
    lotSize = json['lotSize'];
    subscriptions = json['subscriptions'];
    expectedPrem = json['expectedPrem'];
    listingDate = json['listingDate'];
    isLive = json['isLive'];
    nseCode = json['nseCode'];
    bseCode = json['bseCode'];
    news = json['news'];
    listingPrice = json['listingPrice'];
    premiumOrDiscount = json['premiumOrDiscount'];
    refundDate = json['refundDate'];
    listingPercent = json['listingPercent'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['offerDate'] = this.offerDate;
    data['offerPrice'] = this.offerPrice;
    data['lotSize'] = this.lotSize;
    data['subscriptions'] = this.subscriptions;
    data['expectedPrem'] = this.expectedPrem;
    data['listingDate'] = this.listingDate;
    data['isLive'] = this.isLive;
    data['nseCode'] = this.nseCode;
    data['bseCode'] = this.bseCode;
    data['news'] = this.news;
    data['listingPrice'] = this.listingPrice;
    data['premiumOrDiscount'] = this.premiumOrDiscount;
    data['refundDate'] = this.refundDate;
    data['listingPercent'] = this.listingPercent;
    return data;
  }
}
