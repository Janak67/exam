class MultiMovieModel {
  String? totalResults;
  bool? response;
  List<SearchModel> searchList = [];

  MultiMovieModel(
      {required this.totalResults,
      required this.response,
      required this.searchList});

  factory MultiMovieModel.mapToModel(Map m1) {
    List l1 = m1['Search'];
    return MultiMovieModel(
      totalResults: m1['totalResults'],
      response: m1['response'],
      searchList: l1.map((e) => SearchModel.mapToModel(e)).toList(),
    );
  }
}

class SearchModel {
  String? title, type, poster, year;

  SearchModel({this.year, this.title, this.type, this.poster});

  factory SearchModel.mapToModel(Map m1) {
    return SearchModel(
      year: m1['Year'],
      title: m1['Title'],
      type: m1['Type'],
      poster: m1['Poster'],
    );
  }
}
