import 'package:exam/screen/home/model/home_model.dart';
import 'package:exam/utils/api_helper.dart';
import 'package:flutter/material.dart';

import '../model/multi_model.dart';

class HomeProvider with ChangeNotifier {
  MultiMovieModel? multiMovieModel;
  HomeModel? homeModel;
  String searchMovie = "boss";

  Future<void> movieCall() async {
    APIHelper apiHelper = APIHelper();
    HomeModel? h1 = await apiHelper.movieApiCall();
    homeModel = h1;
    notifyListeners();
  }

  Future<void> multiMovieCall() async {
    APIHelper a1 = APIHelper();
    MultiMovieModel? m1 = await a1.multiMovieApiCall(searchMovie);
    multiMovieModel = m1;
    notifyListeners();
  }

  void searchBarMovie(String search) {
    searchMovie = search;
    notifyListeners();
  }
}
