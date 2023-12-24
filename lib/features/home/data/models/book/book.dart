import 'home_books.dart';

class Book {
  String? kind;
  int? totalItems;
  List<HomeBooksModel>? items;

  Book({this.kind, this.totalItems, this.items});

  factory Book.fromJson(Map<String, dynamic> json) => Book(
        kind: json['kind'] as String?,
        totalItems: json['totalItems'] as int?,
        items: (json['items'] as List<dynamic>?)
            ?.map((e) => HomeBooksModel.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'kind': kind,
        'totalItems': totalItems,
        'items': items?.map((e) => e.toJson()).toList(),
      };
}
