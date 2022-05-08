import 'dart:convert';
import "package:http/http.dart" show Client, Response;
import 'package:acara2/model/popular_movies.dart';

class ApiProvider { 
  String apiKey = 'fc8a3aa02c930f164a069ebd86d62c4f';
  String baseUrl = 'https://api.themoviedb.org/3';

  Client client = Client();

  Future<PopularMovies> getPopularMovies() async { 
    
Uri url = Uri.parse('$baseUrl/movie/popular?api_key=$apiKey');
    Response response =
    await client.get(url);

    if (response.statusCode == 200) { 
      return PopularMovies.fromJson(jsonDecode(response.body));
    } else {
      throw Exception(response.statusCode);
    }
  }
}