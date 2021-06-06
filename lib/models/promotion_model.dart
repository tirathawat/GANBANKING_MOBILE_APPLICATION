// To parse this JSON data, do
//
//     final promotionModel = promotionModelFromJson(jsonString);

import 'dart:convert';

List<PromotionModel> promotionModelFromJson(String str) =>
    List<PromotionModel>.from(
        json.decode(str).map((x) => PromotionModel.fromJson(x)));

String promotionModelToJson(List<PromotionModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PromotionModel {
  PromotionModel({
    this.promotionDetail,
    this.promotionId,
    this.promotionImagePath,
    this.promotionTitle,
  });

  String promotionDetail;
  int promotionId;
  dynamic promotionImagePath;
  String promotionTitle;

  factory PromotionModel.fromJson(Map<String, dynamic> json) => PromotionModel(
        promotionDetail: json["promotion_detail"],
        promotionId: json["promotion_id"],
        promotionImagePath: json["promotion_image_path"],
        promotionTitle: json["promotion_title"],
      );

  Map<String, dynamic> toJson() => {
        "promotion_detail": promotionDetail,
        "promotion_id": promotionId,
        "promotion_image_path": promotionImagePath,
        "promotion_title": promotionTitle,
      };
}
