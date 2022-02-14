abstract class LocalDBRepository {
  Future<int> setDatabase(String tableName, Map<String, dynamic> toMap);
  Future<List> getDatabase(String tableName);
  Future<void> deleteRowFromDatabase(String tableName, int id);
  Future<int> updateRowFromDatabase(
      String tableName, int id, Map<String, dynamic> toMap);
}
