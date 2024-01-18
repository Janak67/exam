import 'package:exam/screen/home/model/home_model.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    MultiMovieModel m2 =
        ModalRoute.of(context)!.settings.arguments as MultiMovieModel;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: Colors.black,
          title: const Text(
            'Detail',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Center(
          child: Text('${m2.response}'),
        ),
      ),
    );
  }
}
