class SmeModalClass {
  bool? success;
  String? message;
  Data? data;

  SmeModalClass({this.success, this.message, this.data});

  SmeModalClass.fromJson(Map<String, dynamic> json) {
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
  List<SMEs>? sMEs;
  int? total;
  int? currentPage;
  int? totalPages;

  Data({this.sMEs, this.total, this.currentPage, this.totalPages});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['SMEs'] != null) {
      sMEs = <SMEs>[];
      json['SMEs'].forEach((v) {
        sMEs!.add(new SMEs.fromJson(v));
      });
    }
    total = json['total'];
    currentPage = json['currentPage'];
    totalPages = json['totalPages'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.sMEs != null) {
      data['SMEs'] = this.sMEs!.map((v) => v.toJson()).toList();
    }
    data['total'] = this.total;
    data['currentPage'] = this.currentPage;
    data['totalPages'] = this.totalPages;
    return data;
  }
}

class SMEs {
  String? sId;
  String? name;
  String? offerDate;
  String? offerPrice;
  int? lotSize;
  String? subscriptions;
  String? expectedPrem;
  bool? isLive;
  bool? isListed;
  String? nseCode;
  String? bseCode;
  String? news;
  int? listingPrice;
  String? listedOn;
  String? premiumOrDiscount;
  String? refundDate;
  String? listingPercent;

  SMEs(
      {this.sId,
        this.name,
        this.offerDate,
        this.offerPrice,
        this.lotSize,
        this.subscriptions,
        this.expectedPrem,
        this.isLive,
        this.isListed,
        this.nseCode,
        this.bseCode,
        this.news,
        this.listingPrice,
        this.listedOn,
        this.premiumOrDiscount,
        this.refundDate,
        this.listingPercent});

  SMEs.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    offerDate = json['offerDate'];
    offerPrice = json['offerPrice'];
    lotSize = json['lotSize'];
    subscriptions = json['subscriptions'];
    expectedPrem = json['expectedPrem'];
    isLive = json['isLive'];
    isListed = json['isListed'];
    nseCode = json['nseCode'];
    bseCode = json['bseCode'];
    news = json['news'];
    listingPrice = json['listingPrice'];
    listedOn = json['listedOn'];
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
    data['isLive'] = this.isLive;
    data['isListed'] = this.isListed;
    data['nseCode'] = this.nseCode;
    data['bseCode'] = this.bseCode;
    data['news'] = this.news;
    data['listingPrice'] = this.listingPrice;
    data['listedOn'] = this.listedOn;
    data['premiumOrDiscount'] = this.premiumOrDiscount;
    data['refundDate'] = this.refundDate;
    data['listingPercent'] = this.listingPercent;
    return data;
  }
}
