class CategorybaseProductsModel {
  int id;
  String name;
  String slug;
  String permalink;
  DateTime dateCreated;
  DateTime dateModified;
  String type;
  String status;
  bool featured;
  String catalogVisibility;
  String description;
  String shortDescription;
  String sku;
  String price;
  String regularPrice;
  String salePrice;
  bool onSale;
  bool purchasable;
  int totalSales;
  bool virtual;
  bool downloadable;
  String taxStatus;
  bool manageStock;
  int? stockQuantity;
  String backorders;
  bool reviewsAllowed;
  String averageRating;
  int ratingCount;
  List<Category> categories;
  List<ImageModel> images;
  List<Attribute> attributes;
  List<int> relatedIds;
  String stockStatus;

  CategorybaseProductsModel({
    required this.id,
    required this.name,
    required this.slug,
    required this.permalink,
    required this.dateCreated,
    required this.dateModified,
    required this.type,
    required this.status,
    required this.featured,
    required this.catalogVisibility,
    required this.description,
    required this.shortDescription,
    required this.sku,
    required this.price,
    required this.regularPrice,
    required this.salePrice,
    required this.onSale,
    required this.purchasable,
    required this.totalSales,
    required this.virtual,
    required this.downloadable,
    required this.taxStatus,
    required this.manageStock,
    this.stockQuantity,
    required this.backorders,
    required this.reviewsAllowed,
    required this.averageRating,
    required this.ratingCount,
    required this.categories,
    required this.images,
    required this.attributes,
    required this.relatedIds,
    required this.stockStatus,
  });

  factory CategorybaseProductsModel.fromJson(Map<String, dynamic> json) {
    return CategorybaseProductsModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      slug: json['slug'] ?? '',
      permalink: json['permalink'] ?? '',
      dateCreated: DateTime.parse(json['date_created'] ?? ''),
      dateModified: DateTime.parse(json['date_modified'] ?? ''),
      type: json['type'] ?? '',
      status: json['status'] ?? '',
      featured: json['featured'] ?? '',
      catalogVisibility: json['catalog_visibility'] ?? '',
      description: json['description'] ?? '',
      shortDescription: json['short_description'] ?? '',
      sku: json['sku'] ?? '',
      price: json['price'] ?? '',
      regularPrice: json['regular_price'] ?? '',
      salePrice: json['sale_price'] ?? '',
      onSale: json['on_sale'] ?? '',
      purchasable: json['purchasable'] ?? '',
      totalSales: json['total_sales'] ?? '',
      virtual: json['virtual'] ?? '',
      downloadable: json['downloadable'] ?? '',
      taxStatus: json['tax_status'] ?? '',
      manageStock: json['manage_stock'] ?? '',
      stockQuantity: json['stock_quantity'] ?? 0,
      backorders: json['backorders'] ?? '',
      reviewsAllowed: json['reviews_allowed'] ?? '',
      averageRating: json['average_rating'] ?? '',
      ratingCount: json['rating_count'] ?? '',
      categories: List<Category>.from(
          json['categories'].map((x) => Category.fromJson(x))),
      images: List<ImageModel>.from(
          json['images'].map((x) => ImageModel.fromJson(x))),
      attributes: List<Attribute>.from(
          json['attributes'].map((x) => Attribute.fromJson(x))),
      relatedIds: List<int>.from(json['related_ids']),
      stockStatus: json['stock_status'],
    );
  }
}

class Category {
  int id;
  String name;
  String slug;

  Category({
    required this.id,
    required this.name,
    required this.slug,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      name: json['name'],
      slug: json['slug'],
    );
  }
}

class ImageModel {
  int id;
  DateTime dateCreated;
  DateTime dateModified;
  String src;
  String name;
  String alt;

  ImageModel({
    required this.id,
    required this.dateCreated,
    required this.dateModified,
    required this.src,
    required this.name,
    required this.alt,
  });

  factory ImageModel.fromJson(Map<String, dynamic> json) {
    return ImageModel(
      id: json['id'],
      dateCreated: DateTime.parse(json['date_created']),
      dateModified: DateTime.parse(json['date_modified']),
      src: json['src'],
      name: json['name'],
      alt: json['alt'] ?? '',
    );
  }
}

class Attribute {
  int id;
  String name;
  String slug;
  int position;
  bool visible;
  bool variation;
  List<String> options;

  Attribute({
    required this.id,
    required this.name,
    required this.slug,
    required this.position,
    required this.visible,
    required this.variation,
    required this.options,
  });

  factory Attribute.fromJson(Map<String, dynamic> json) {
    return Attribute(
      id: json['id'],
      name: json['name'],
      slug: json['slug'],
      position: json['position'],
      visible: json['visible'],
      variation: json['variation'],
      options: List<String>.from(json['options']),
    );
  }
}
