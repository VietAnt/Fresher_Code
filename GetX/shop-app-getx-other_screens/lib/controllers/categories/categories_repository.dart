import 'package:http/http.dart' as http;
import 'dart:convert';

class CategoriesRepository {
  var url = "https://fakestoreapi.com/products/categories";

  loadCategoriesFromApi() async {
    var response = await http.get(Uri.parse(url));
    var categoriesJson = json.decode(response.body);
    return categoriesJson;
  }
}

//*-->CategoriesRepository
class RepositoryCategorie {
  var url = "https://fakestoreapi.com/products/categories";

  //*-->loadCategoriesFromAPI
  loadCategorieFromApi() async {
    var response = await http.get(Uri.parse(url));
    var categoriesJson = json.decode(response.body);
    return categoriesJson;
  }
}
