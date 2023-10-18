import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';
import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class FoodService {
  static Future<List<Product>?> searchProduct(
      {String? name,
      String? brand,
      PnnsGroup2? category,
      int size = 10,
      int page = 1}) async {
    var cache = await DefaultCacheManager()
        .getFileFromCache('search-$name-$category-$brand-$size-$page');
    if (cache != null && cache.validTill.isAfter(DateTime.now())) {
      return jsonDecode(cache.file.readAsStringSync())
          .map<Product>((model) => Product.fromJson(model))
          .toList();
    }

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

    if (category != null) {
      parametersList.add(PnnsGroup2Filter(pnnsGroup2: category));
    }

    final ProductSearchQueryConfiguration configuration =
        ProductSearchQueryConfiguration(
      parametersList: parametersList,
      language: OpenFoodFactsLanguage.ITALIAN,
      fields: [ProductField.ALL],
      version: ProductQueryVersion.v3,
    );

    final SearchResult searchResult =
        await OpenFoodAPIClient.searchProducts(null, configuration);

    if (searchResult.products == null || searchResult.count == null) {
      throw Exception('no products found');
    }

    await DefaultCacheManager().putFile(
      'search-$name-$category-$brand-$size-$page',
      Uint8List.fromList(utf8.encode(jsonEncode(searchResult.products))),
      fileExtension: '.json',
      maxAge: const Duration(days: 3),
    );
    return searchResult.products;
  }

  /// Function used to get a product by its barcode
  static Future<Product?> getProduct(String barcode) async {
    var cache = await DefaultCacheManager().getFileFromCache(barcode);
    if (cache != null && cache.validTill.isAfter(DateTime.now())) {
      return Product.fromJson(jsonDecode(cache.file.readAsStringSync()));
    }

    final ProductQueryConfiguration configuration = ProductQueryConfiguration(
      barcode,
      language: OpenFoodFactsLanguage.ITALIAN,
      fields: [ProductField.ALL],
      version: ProductQueryVersion.v3,
    );

    final ProductResultV3 result =
        await OpenFoodAPIClient.getProductV3(configuration);

    if (result.status == ProductResultV3.statusSuccess) {
      await DefaultCacheManager().putFile(
        barcode,
        Uint8List.fromList(utf8.encode(jsonEncode(result.product?.toJson()))),
        fileExtension: '.json',
        maxAge: const Duration(days: 3),
      );
      return result.product;
    } else {
      throw Exception('product not found, please insert data for $barcode');
    }
  }
}
