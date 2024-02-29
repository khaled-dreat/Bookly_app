import 'package:clean_arch_bookly_app/core/firebase/firebase_key.dart';
import 'package:clean_arch_bookly_app/core/widgets/snackbar/snackbar.dart';
import 'package:clean_arch_bookly_app/features/favorite/domain/entity/favorite_book_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class FavoriteRemoteDataSource {
  // * Fetch All Books
  Future<void> addFavoriteBooks({FavoriteBookEntity book});
}

class FavoriteRemoteDataSourceImpl extends FavoriteRemoteDataSource {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;

  FavoriteRemoteDataSourceImpl();

  @override
  Future<void> addFavoriteBooks({FavoriteBookEntity? book}) async {
    try {
      if (book != null) {
        await firestore
            .collection(FireBaseKey.users)
            .doc(auth.currentUser!.uid)
            .collection(FireBaseKey.collectionFavoriteBook)
            .doc(book.bookId)
            .set(book.toMap());
      }
    } catch (e) {
      AppSnackBar.snackBarError(msg: e.toString());
    }
  }
}
