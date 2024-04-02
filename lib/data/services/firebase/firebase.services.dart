abstract class FirebaseRealTimeRepository {
  Future<void> addNewItem(String userId, String idMovie, bool isWatchlist);

  Future<void> updateItem(String itemId, bool isWatchlist);

  Future<void> deleteItem(String email, String password);
}
