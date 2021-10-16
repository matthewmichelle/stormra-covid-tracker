import 'package:covidtracker/src/models/corona_case_country.dart';
import 'package:rxdart/rxdart.dart';
import '../resources/repository.dart';

class CountryBloc {
  final _repository = Repository();
  final _moviesFetcher = PublishSubject<CoronaCaseCountry>();

  Stream<CoronaCaseCountry> get allConuntry => _moviesFetcher.stream;

  fetchAllMovies() async {
    CoronaCaseCountry itemModel = await _repository.fetchAllConuntry();
    print("itemModel${itemModel}");
    _moviesFetcher.sink.add(itemModel);
  }

  dispose() {
    _moviesFetcher.close();
  }
}

final bloc = CountryBloc();
