import 'package:exam/screen/home/provider/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeProvider? providerr;
  HomeProvider? providerw;

  @override
  void initState() {
    super.initState();
    context.read<HomeProvider>().movieCall();
    context.read<HomeProvider>().multiMovieCall();
  }

  @override
  Widget build(BuildContext context) {
    providerr = context.read<HomeProvider>();
    providerw = context.watch<HomeProvider>();
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          title: const Text(
            'Movie',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Column(
          children: [
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(5),
              child: SearchBar(
                backgroundColor: MaterialStatePropertyAll(Colors.grey.shade200),
                elevation: const MaterialStatePropertyAll(0),
                leading: const Icon(Icons.search),
                hintText: 'Search...',
                onSubmitted: (value) {
                  providerr!.searchBarMovie(value);
                  providerr!.multiMovieCall();
                },
              ),
            ),
            providerw!.multiMovieModel == null
                ? const Center(child: CircularProgressIndicator())
                : Expanded(
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2, mainAxisExtent: 380),
                      itemCount: providerw!.multiMovieModel!.searchList.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, 'detail',
                                arguments: providerw!
                                    .multiMovieModel!.searchList[index]);
                          },
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Image.network(
                                    "${providerw!.multiMovieModel!.searchList[index].poster}",
                                  ),
                                ),
                              ),
                              Text(
                                '${providerw!.multiMovieModel!.searchList[index].title}',
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
