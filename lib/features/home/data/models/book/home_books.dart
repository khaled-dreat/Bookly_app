import 'dart:math';

import 'package:clean_arch_bookly_app/features/home/presentation/view/home/widgets/book_rating.dart';

import '../../../domain/entity/book_entity.dart';
import 'access_info.dart';
import 'sale_info.dart';
import 'search_info.dart';
import 'volume_info.dart';

Random? random;

class HomeBooksModel extends BookEntity {
  String? kind;
  String? id;
  String? etag;
  String? selfLink;
  VolumeInfo? volumeInfo;
  SaleInfo? saleInfo;
  AccessInfo? accessInfo;
  SearchInfo? searchInfo;

  HomeBooksModel({
    this.kind,
    this.id,
    this.etag,
    this.selfLink,
    this.volumeInfo,
    this.saleInfo,
    this.accessInfo,
    this.searchInfo,
  }) : super(
          bookId: id!,
          image: volumeInfo?.imageLinks?.thumbnail ?? "",
          title: volumeInfo!.title,
          autherName: volumeInfo.authors?.first ?? "No Name",
          price: saleInfo?.listPrice?.amount ??
              (double.parse(((getRandomNumber()))) * 20),
          rating: volumeInfo.maturityRating!,
        );

  factory HomeBooksModel.fromJson(Map<String, dynamic> json) => HomeBooksModel(
        kind: json['kind'] as String?,
        id: json['id'] as String?,
        etag: json['etag'] as String?,
        selfLink: json['selfLink'] as String?,
        volumeInfo: json['volumeInfo'] == null
            ? null
            : VolumeInfo.fromJson(json['volumeInfo'] as Map<String, dynamic>),
        saleInfo: json['saleInfo'] == null
            ? null
            : SaleInfo.fromJson(json['saleInfo'] as Map<String, dynamic>),
        accessInfo: json['accessInfo'] == null
            ? null
            : AccessInfo.fromJson(json['accessInfo'] as Map<String, dynamic>),
        searchInfo: json['searchInfo'] == null
            ? null
            : SearchInfo.fromJson(json['searchInfo'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'kind': kind,
        'id': id,
        'etag': etag,
        'selfLink': selfLink,
        'volumeInfo': volumeInfo?.toJson(),
        'saleInfo': saleInfo?.toJson(),
        'accessInfo': accessInfo?.toJson(),
        'searchInfo': searchInfo?.toJson(),
      };
}
