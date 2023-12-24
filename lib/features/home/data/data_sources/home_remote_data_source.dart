import 'dart:developer';

import 'package:clean_arch_bookly_app/core/utils/local_data/app_local_data_key.dart';

import '../../../../core/api/api_key.dart';
import '../../../../core/api/api_service.dart';
import '../../../../core/utils/local_data/save_books_local_data.dart';
import '../../domain/entity/book_entity.dart';
import '../models/book/home_books.dart';

abstract class HomeRemoteDataSource {
  // * Fetch All Books
  Future<List<BookEntity>> fetchFeaturedBooks({int pageNumber = 0});
  Future<List<BookEntity>> fetchNewsBooks();
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final ApiService apiService;

  HomeRemoteDataSourceImpl({required this.apiService});
  @override
  Future<List<BookEntity>> fetchFeaturedBooks({int pageNumber = 0}) async {
    log(
        name: "End Point",
        "${ApiKey.freeProgrammingBook}${ApiKey.startIndex(pageNumber: pageNumber)}");
    var data = await apiService.get(
        endPoint:
            'volumes?Filtering=free-ebooks&q=programming&startIndex=${pageNumber * 10}');

    List<BookEntity> books = getBooksList(data);
    saveBooksData(books, AppHiveKey.featFreeProgramBooks);
    return books;
  }

  @override
  Future<List<BookEntity>> fetchNewsBooks() async {
    var data = await apiService.get(
        endPoint: 'volumes?Filtering=free-ebooks&Sorting=newest&q=programming');
    List<BookEntity> books = getBooksList(data);
    saveBooksData(books, ApiKey.freeNewsProgrammingBook);
    return books;
  }

  List<BookEntity> getBooksList(Map<String, dynamic> data) {
    List<BookEntity> books = [];
    for (var bookMap in data[ApiKey.items]) {
      books.add(HomeBooksModel.fromJson(bookMap));
    }
    return books;
  }
}
