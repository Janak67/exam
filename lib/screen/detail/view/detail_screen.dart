import 'package:exam/screen/home/model/multi_model.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    SearchModel m2 = ModalRoute.of(context)!.settings.arguments as SearchModel;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: Colors.black,
          title: const Text(
            'Detail',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network('${m2.poster}'),
                ),
              ),
              const Divider(
                thickness: 0.6,
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  '${m2.title}',
                  style: const TextStyle(color: Colors.white, fontSize: 35),
                ),
              ),
              Text(
                '${m2.year}',
                style: const TextStyle(fontSize: 15, color: Colors.white70),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
