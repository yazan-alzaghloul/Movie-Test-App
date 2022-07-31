import 'package:mobx/mobx.dart';

import '../../shared/repositories/popular_repository.dart';

part 'details_store.g.dart';

class DetailsStore = _DetailsBase with _$DetailsStore;

abstract class _DetailsBase with Store {
  final PopularRepository popularRepository;

  _DetailsBase(this.popularRepository);

  @observable
  bool isLoading = false;
}
