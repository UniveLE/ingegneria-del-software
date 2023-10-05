import 'dart:async';
import 'package:openfoodfacts/openfoodfacts.dart';

//TODO: implementare sistema di cache per limitare le richieste al server
class FoodService {
  static void searchProduct(
      {String? name, String? brand, int size = 10, int page = 1}) async {
    var parametersList = [
      PageSize(size: size),
      PageNumber(page: page),
      const SortBy(option: SortOption.POPULARITY),
    ];

    if (name != null) {
      parametersList.add(SearchTerms(terms: [name]));
    }

    if (brand != null) {
      parametersList.add(
        TagFilter.fromType(
          tagFilterType: TagFilterType.BRANDS,
          tagName: brand,
        ),
      );
    }

    final ProductSearchQueryConfiguration configuration =
        ProductSearchQueryConfiguration(
      parametersList: parametersList,
      language: OpenFoodFactsLanguage.ENGLISH,
      fields: [ProductField.ALL],
      version: ProductQueryVersion.v3,
    );
    /*final ProductResultV3 result =
        await OpenFoodAPIClient.getProductV3(configuration);*/
  }

  /// Function used to get a product by its barcode
  static Future<Product?> getProduct(String barcode) async {
    final ProductQueryConfiguration configuration = ProductQueryConfiguration(
      barcode,
      language: OpenFoodFactsLanguage.ENGLISH,
      fields: [ProductField.ALL],
      version: ProductQueryVersion.v3,
    );

    final ProductResultV3 result =
        await OpenFoodAPIClient.getProductV3(configuration);

    if (result.status == ProductResultV3.statusSuccess) {
      return result.product;
    } else {
      throw Exception('product not found, please insert data for $barcode');
    }
  }
}
