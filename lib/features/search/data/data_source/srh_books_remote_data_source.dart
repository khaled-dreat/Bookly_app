import '../../../../core/api/api_service.dart';
import '../models/book/srh_books.dart';
import '../../domain/entity/srh_book_entity.dart';

abstract class SrhBooksRemoteDataSource {
  Future<List<SrhBookEntity>> fechSrhBooks(
      {int pageNumber = 0, String? srhKey});
}

class SrhBooksDataSourceImp extends SrhBooksRemoteDataSource {
  final ApiService apiService;

  SrhBooksDataSourceImp({required this.apiService});
  @override
  Future<List<SrhBookEntity>> fechSrhBooks(
      {int pageNumber = 0, String? srhKey}) async {
    var data = await apiService.get(endPoint: srhKey!);
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
