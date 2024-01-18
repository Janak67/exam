import 'dart:convert';
import 'package:exam/screen/home/model/home_model.dart';
import 'package:http/http.dart' as http;

class APIHelper {
  // Future<HomeModel?> movieApiCall() async {
  //   String apiLink = "https://www.omdbapi.com/?t=hero&apikey=7ef88ba4";
  //   var response = await http.get(Uri.parse(apiLink));
  //   if (response.statusCode == 200) {
  //     var json = jsonDecode(response.body);
  //     HomeModel homeModel = HomeModel.mapToModel(json);
  //     return homeModel;
  //   }
  //   return null;
  // }

  Future<MultiMovieModel?> multiMovieApiCall() async {
    String apiLink = "https://www.omdbapi.com/?s=boss&apikey=7ef88ba4";
    var response = await http.get(Uri.parse(apiLink));
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      MultiMovieModel h1 = MultiMovieModel.mapToModel(json);
      return h1;
    }
    return null;
  }
}
