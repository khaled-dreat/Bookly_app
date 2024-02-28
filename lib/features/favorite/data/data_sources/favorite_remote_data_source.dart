import 'package:clean_arch_bookly_app/core/firebase/firebase_key.dart';
import 'package:clean_arch_bookly_app/core/widgets/snackbar/snackbar.dart';
import 'package:clean_arch_bookly_app/features/favorite/domain/entity/favorite_book_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class FavoriteRemoteDataSource {
  // * Fetch All Books
  Future<void> addFavoriteBooks({FavoriteBookEntity book});
}

class FavoriteRemoteDataSourceImpl extends FavoriteRemoteDataSource {
  final FirebaseFirestore firestore;

  FavoriteRemoteDataSourceImpl({required this.firestore});

  @override
  Future<void> addFavoriteBooks({FavoriteBookEntity? book}) async {
    try {
      await firestore
          .collection(FireBaseKey.collectionFavoriteBook)
          .doc(book?.bookId)
          .set(book!.toMap());
    } catch (e) {
      AppSnackBar.snackBarError(msg: e.toString());
    }
  }
}
