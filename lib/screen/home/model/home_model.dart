// class HomeModel {
//   int? poster;
//   String? title,
//       year,
//       genre,
//       director,
//       writer,
//       actors,
//       plot,
//       language,
//       country,
//       awards,
//       type,
//       production,
//       website;
//   RatingsModel? ratingsModel;
//
//   HomeModel(
//       {this.year,
//       this.title,
//       this.genre,
//       this.director,
//       this.writer,
//       this.actors,
//       this.plot,
//       this.language,
//       this.country,
//       this.awards,
//       this.poster,
//       this.type,
//       this.production,
//       this.website,
//       this.ratingsModel});
//
//   factory HomeModel.mapToModel(Map m1) {
//     return HomeModel(
//       year: m1['Year'],
//       title: m1['Title'],
//       genre: m1['Genre'],
//       director: m1['Director'],
//       writer: m1['Writer'],
//       actors: m1['Actors'],
//       plot: m1['Plot'],
//       language: m1['Language'],
//       country: m1['Country'],
//       awards: m1['Awards'],
//       poster: m1['Poster'],
//       type: m1['Type'],
//       production: m1['Production'],
//       website: m1['Website'],
//       // ratingsModel: RatingsModel.mapToModel(m1['Ratings']),
//     );
//   }
// }
//
// class RatingsModel {
//   double? value;
//   String? source;
//
//   RatingsModel({this.value, this.source});
//
//   factory RatingsModel.mapToModel(Map m1) {
//     return RatingsModel(
//       value: m1['Value'],
//       source: m1['Source'],
//     );
//   }
// }

class MultiMovieModel {
  String? totalResults;
  bool? response;
  List<SearchModel> search = [];

  MultiMovieModel(
      {required this.totalResults,
      required this.response,
      required this.search});

  factory MultiMovieModel.mapToModel(Map m1) {
    List l1 = m1['Search'];
    return MultiMovieModel(
      totalResults: m1['totalResults'],
      response: m1['response'],
      search: l1.map((e) => SearchModel.mapToModel(e)).toList(),
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
