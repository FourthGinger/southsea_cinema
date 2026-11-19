import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:southsea_cinema/models/movie.dart';

class MovieRepository {
  List<Movie>? _cachedMovies;

  List<Movie> getMovies() {
    final List<Movie>? cachedMovies = _cachedMovies;

    if (cachedMovies != null) {
      return cachedMovies;
    }

    return [
      Movie(
        id: '1',
        title: 'Kubo and the two strings',
        synopsis:
            'Laika stop motion film about a boy and his instrument.',
        ageRating: 'PG',
        screeningTime: 'Friday 6 Nov 2026 15:00',
        ticketPrice: 6.00,
        posterImagePath: 'assets/images/Kubo.jpg',
      ),
      Movie(
        id: '2',
        title: 'The Lord of the Rings: Return of the King',
        synopsis:
            'Third installment in the Lord of the Rings trilogy.',
        ageRating: '12A',
        screeningTime: 'Sunday 4 Oct 2026 18:00',
        ticketPrice: 7.50,
        posterImagePath: 'assets/images/ROTK.jpg',
      ),
    ];
  }

  Movie? getMovieById(String id) {
    for (Movie movie in getMovies()) {
      if (movie.id == id) {
        return movie;
      }
    }
    return null;
  }

  Future<List<Movie>> loadMoviesFromAsset({
    String assetPath = 'assets/data/movies.json',
  }) async {
    final String jsonString = await rootBundle.loadString(assetPath);

    final dynamic decodedData = jsonDecode(jsonString);
    final List<dynamic> jsonList = decodedData as List<dynamic>;

    final List<Movie> loadedMovies = [];

    for (final dynamic item in jsonList) {
      final Map<String, dynamic> itemMap = item as Map<String, dynamic>;
      final Movie movie = Movie.fromJson(itemMap);

      loadedMovies.add(movie);
    }

    _cachedMovies = loadedMovies;

    return loadedMovies;
  }
}
