// To parse this JSON data, do
//
//     final productDetailList = productDetailListFromJson(jsonString);

import 'dart:convert';

ProductDetailList productDetailListFromJson(String str) =>
    ProductDetailList.fromJson(json.decode(str));

String productDetailListToJson(ProductDetailList data) =>
    json.encode(data.toJson());

class ProductDetailList {
  ProductDetailList({
    required this.pagination,
    required this.data,
  });

  final Pagination pagination;
  final List<Datum> data;

  factory ProductDetailList.fromJson(Map<String, dynamic> json) =>
      ProductDetailList(
        pagination: Pagination.fromJson(json["pagination"]),
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "pagination": pagination.toJson(),
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    required this.title,
    required this.description,
    required this.source,
  });

  final String title;
  final String description;
  final String source;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        title: json["title"],
        description: json["description"],
        source: json["source"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
        "source": source,
      };
}

class Pagination {
  Pagination({
    required this.limit,
    required this.offset,
    required this.count,
    required this.total,
  });

  final int limit;
  final int offset;
  final int count;
  final int total;

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
        limit: json["limit"],
        offset: json["offset"],
        count: json["count"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "limit": limit,
        "offset": offset,
        "count": count,
        "total": total,
      };
}

class EnumValues<T> {
  late Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
