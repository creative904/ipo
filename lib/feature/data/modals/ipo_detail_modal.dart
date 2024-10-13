class IpoDetailModalClass {
  bool? success;
  String? message;
  Data? data;

  IpoDetailModalClass({this.success, this.message, this.data});

  IpoDetailModalClass.fromJson(Map<String, dynamic> json) {
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
  String? sId;
  String? name;
  String? offerDate;
  String? offerPrice;
  int? lotSize;
  String? subscriptions;
  String? expectedPrem;
  String? openDate;
  String? closeDate;
  String? allotmentDate;
  String? listingDate;
  int? faceValue;
  String? issueSize;
  int? marketLot;
  String? listingAt;
  int? retailPartition;
  bool? isLive;
  bool? isListed;
  String? nseCode;
  String? bseCode;
  String? news;
  String? retailLotShares;
  String? retailLotAmount;
  String? shniLotShares;
  String? shniLotAmount;
  String? bhniLotShares;
  String? bhniLotAmount;
  int? listingPrice;
  String? parentCompany;
  String? parentCompanyCode;
  String? listedOn;
  int? estRetailProfit;
  int? estHniProfit;
  String? premiumOrDiscount;
  String? refundDate;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Data(
      {this.sId,
        this.name,
        this.offerDate,
        this.offerPrice,
        this.lotSize,
        this.subscriptions,
        this.expectedPrem,
        this.openDate,
        this.closeDate,
        this.allotmentDate,
        this.listingDate,
        this.faceValue,
        this.issueSize,
        this.marketLot,
        this.listingAt,
        this.retailPartition,
        this.isLive,
        this.isListed,
        this.nseCode,
        this.bseCode,
        this.news,
        this.retailLotShares,
        this.retailLotAmount,
        this.shniLotShares,
        this.shniLotAmount,
        this.bhniLotShares,
        this.bhniLotAmount,
        this.listingPrice,
        this.parentCompany,
        this.parentCompanyCode,
        this.listedOn,
        this.estRetailProfit,
        this.estHniProfit,
        this.premiumOrDiscount,
        this.refundDate,
        this.createdAt,
        this.updatedAt,
        this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    offerDate = json['offerDate'];
    offerPrice = json['offerPrice'];
    lotSize = json['lotSize'];
    subscriptions = json['subscriptions'];
    expectedPrem = json['expectedPrem'];
    openDate = json['openDate'];
    closeDate = json['closeDate'];
    allotmentDate = json['allotmentDate'];
    listingDate = json['listingDate'];
    faceValue = json['faceValue'];
    issueSize = json['issueSize'];
    marketLot = json['marketLot'];
    listingAt = json['listingAt'];
    retailPartition = json['retailPartition'];
    isLive = json['isLive'];
    isListed = json['isListed'];
    nseCode = json['nseCode'];
    bseCode = json['bseCode'];
    news = json['news'];
    retailLotShares = json['retailLotShares'];
    retailLotAmount = json['retailLotAmount'];
    shniLotShares = json['shniLotShares'];
    shniLotAmount = json['shniLotAmount'];
    bhniLotShares = json['bhniLotShares'];
    bhniLotAmount = json['bhniLotAmount'];
    listingPrice = json['listingPrice'];
    parentCompany = json['parentCompany'];
    parentCompanyCode = json['parentCompanyCode'];
    listedOn = json['listedOn'];
    estRetailProfit = json['estRetailProfit'];
    estHniProfit = json['estHniProfit'];
    premiumOrDiscount = json['premiumOrDiscount'];
    refundDate = json['refundDate'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
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
    data['openDate'] = this.openDate;
    data['closeDate'] = this.closeDate;
    data['allotmentDate'] = this.allotmentDate;
    data['listingDate'] = this.listingDate;
    data['faceValue'] = this.faceValue;
    data['issueSize'] = this.issueSize;
    data['marketLot'] = this.marketLot;
    data['listingAt'] = this.listingAt;
    data['retailPartition'] = this.retailPartition;
    data['isLive'] = this.isLive;
    data['isListed'] = this.isListed;
    data['nseCode'] = this.nseCode;
    data['bseCode'] = this.bseCode;
    data['news'] = this.news;
    data['retailLotShares'] = this.retailLotShares;
    data['retailLotAmount'] = this.retailLotAmount;
    data['shniLotShares'] = this.shniLotShares;
    data['shniLotAmount'] = this.shniLotAmount;
    data['bhniLotShares'] = this.bhniLotShares;
    data['bhniLotAmount'] = this.bhniLotAmount;
    data['listingPrice'] = this.listingPrice;
    data['parentCompany'] = this.parentCompany;
    data['parentCompanyCode'] = this.parentCompanyCode;
    data['listedOn'] = this.listedOn;
    data['estRetailProfit'] = this.estRetailProfit;
    data['estHniProfit'] = this.estHniProfit;
    data['premiumOrDiscount'] = this.premiumOrDiscount;
    data['refundDate'] = this.refundDate;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}
