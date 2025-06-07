abstract class Storage {
  Future<void> delete({required String key});
  dynamic get({required String key});
  initStorage();
  Future<void> save({required String key, required dynamic value});
}
