import 'package:learn_storage/data/local_data_source.dart';

import '../domain/repository/todo_repository.dart';
import '../domain/repository/todo_repository_impl.dart';

late final TodoRepository repository;

Future<void> serviceLocator() async {

  /// third party api => storage
  final db = await LocalDataSourceImpl.init;

  /// data
  LocalDataSource dataSource = LocalDataSourceImpl(db: db);

  /// repository
  repository = TodoRepositoryImpl(dataSource: dataSource);
}