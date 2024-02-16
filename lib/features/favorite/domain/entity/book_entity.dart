import 'package:hive/hive.dart';
part 'book_entity.g.dart';

@HiveType(typeId: 1)
class BookFavoriteEntity {
  @HiveField(0)
  final String bookId;
  @HiveField(1)
  final String image;
  @HiveField(2)
  final String? title;
  @HiveField(3)
  final String autherName;
  @HiveField(4)
  final double? price;
  @HiveField(5)
  final String rating;

  BookFavoriteEntity({
    required this.bookId,
    required this.image,
    required this.title,
    required this.autherName,
    required this.price,
    required this.rating,
  });
}
