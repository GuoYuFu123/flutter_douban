import 'package:bloc/bloc.dart';
import './search_state.dart';
import './search_event.dart';
// import './search.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(SearchState());

  // @override
  // SearchState get initialState => SearchState();

  @override
  Stream<SearchState> mapEventToState(
    SearchEvent event,
  ) async* {
    if (event is SearchSuggest) {
      print('2342342come on');
    }
  }
}
