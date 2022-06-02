import 'package:flutter/material.dart';
import 'package:netflix_app/repositories/data_repository.dart';
import 'package:netflix_app/shared/constants.dart';
import 'package:netflix_app/ui/widgets/movie_card.dart';
import 'package:provider/provider.dart';

import '../../models/movie.dart';
import 'detail_movie.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //donne interne
  //List<Movie>? movies;
  //List<Movie>? moviesInCinema;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  goToDetailMovie(Movie movie) {
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) => detailMovie(movie: movie)));
  }

  @override
  Widget build(BuildContext context) {
    final dataProvider = Provider.of<DataRepository>(context, listen: false);
    return Scaffold(
      backgroundColor: alpBackgroundColor,
      appBar: AppBar(
        backgroundColor: alpBackgroundColor,
        leading: Image.asset("assets/images/Logo.png"),
      ),
      body: ListView(
        children: [
          GestureDetector(
            onTap: () => goToDetailMovie(dataProvider.popularMoviesList[0]),
            child: Container(
                height: 521,
                color: alpPrimaryColor,
                child: dataProvider.popularMoviesList.isEmpty
                    ? const Center(
                        child: Text("Indisponibilite du film"),
                      )
                    : Moviecart(movie: dataProvider.popularMoviesList[0])),
          ),
          const SizedBox(
            height: 15,
          ),
          const Text(
            "Tendance acuelles",
            style: TextStyle(
                color: Colors.white,
                fontSize: 24.0,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 15,
          ),
          SizedBox(
            height: 160,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: dataProvider.popularMoviesList.length,
              itemBuilder: ((context, index) => GestureDetector(
                    onTap: () =>
                        goToDetailMovie(dataProvider.popularMoviesList[index]),
                    child: Container(
                        height: 187,
                        width: 125,
                        margin: const EdgeInsets.only(right: 10),
                        child: dataProvider.popularMoviesList.isEmpty
                            ? const Center(
                                child: Text("Indisponibilite du film"),
                              )
                            : Moviecart(
                                movie: dataProvider.popularMoviesList[index])),
                  )),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          const Text(
            "Actuellement au cinema",
            style: TextStyle(
                color: Colors.white,
                fontSize: 24.0,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 15,
          ),
          SizedBox(
            height: 375,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: ((context, index) => GestureDetector(
                    onTap: () => goToDetailMovie(
                        dataProvider.nowInCinemaMoviesList[index]),
                    child: Container(
                        width: 250,
                        margin: const EdgeInsets.only(right: 5, left: 5),
                        child: dataProvider.nowInCinemaMoviesList.isEmpty
                            ? const Center(
                                child: Text("Indisponibilite du film"),
                              )
                            : Moviecart(
                                movie:
                                    dataProvider.nowInCinemaMoviesList[index])),
                  )),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          const Text(
            "Ils arrivent bientot",
            style: TextStyle(
                color: Colors.white,
                fontSize: 24.0,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 15,
          ),
          SizedBox(
            height: 160,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: ((context, index) => GestureDetector(
                    onTap: () => goToDetailMovie(
                        dataProvider.comingSoonMoviesList[index]),
                    child: Container(
                        height: 187,
                        width: 125,
                        margin: const EdgeInsets.only(right: 5, left: 5),
                        child: dataProvider.comingSoonMoviesList.isEmpty
                            ? const Center(
                                child: Text("Indisponibilite du film"),
                              )
                            : Moviecart(
                                movie:
                                    dataProvider.comingSoonMoviesList[index])),
                  )),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          const Text(
            "Les mieux notés",
            style: TextStyle(
                color: Colors.white,
                fontSize: 24.0,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 15,
          ),
          SizedBox(
            height: 160,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: ((context, index) => GestureDetector(
                    onTap: () =>
                        goToDetailMovie(dataProvider.topRatedMoviesList[index]),
                    child: Container(
                        height: 187,
                        width: 125,
                        margin: const EdgeInsets.only(right: 5, left: 5),
                        child: dataProvider.topRatedMoviesList.isEmpty
                            ? const Center(
                                child: Text("Indisponibilite du film"),
                              )
                            : Moviecart(
                                movie: dataProvider.topRatedMoviesList[index])),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
