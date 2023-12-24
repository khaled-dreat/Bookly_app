import 'dart:developer';

import 'package:clean_arch_bookly_app/core/api/api_service.dart';
import 'package:clean_arch_bookly_app/features/search/data/models/book/srh_books.dart';
import 'package:clean_arch_bookly_app/features/search/domain/entity/srh_book_entity.dart';

abstract class SrhBooksRemoteDataSource {
  Future<List<SrhBookEntity>> featuredSrhBooks({int pageNumber = 0});
}

class SrhBooksDataSourceImp extends SrhBooksRemoteDataSource {
  final ApiService apiService;

  SrhBooksDataSourceImp({required this.apiService});
  @override
  Future<List<SrhBookEntity>> featuredSrhBooks({int pageNumber = 0}) async {
    var data = await apiService.get(
        endPoint: "volumes?q=harry potter&startIndex=${pageNumber * 10}");
    var books = getBooksList(data);
    return books;
  }
}

List<SrhBookEntity> getBooksList(Map<String, dynamic> data) {
  List<SrhBookEntity> books = [];
  for (var bookMap in data['items']) {
    books.add(SrhBooksModel.fromJson(bookMap));
  }

  return books;
}
