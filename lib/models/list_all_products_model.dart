import 'dart:convert';

import 'package:mercari_app/models/productcategories_model.dart';

class ListAllProduct {
  int id;
  String name;
  String slug;
  String permalink;
  DateTime dateCreated;
  DateTime dateCreatedGmt;
  DateTime dateModified;
  DateTime dateModifiedGmt;
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
  DateTime? dateOnSaleFrom;
  DateTime? dateOnSaleFromGmt;
  DateTime? dateOnSaleTo;
  DateTime? dateOnSaleToGmt;
  bool onSale;
  bool purchasable;
  int totalSales;
  bool virtual;
  bool downloadable;
  List<dynamic> downloads;
  int downloadLimit;
  int downloadExpiry;
  String externalUrl;
  String buttonText;
  String taxStatus;
  String taxClass;
  bool manageStock;
  int? stockQuantity;
  String backorders;
  bool backordersAllowed;
  bool backordered;
  int? lowStockAmount;
  bool soldIndividually;
  String weight;
  Dimensions dimensions;
  bool shippingRequired;
  bool shippingTaxable;
  String shippingClass;
  int shippingClassId;
  bool reviewsAllowed;
  String averageRating;
  int ratingCount;
  List<int> upsellIds;
  List<int> crossSellIds;
  int parentId;
  String purchaseNote;
  List<Category> categories;
  List<dynamic> tags;
  List<ProductImage> images;
  List<dynamic> attributes;
  List<dynamic> defaultAttributes;
  List<dynamic> variations;
  List<dynamic> groupedProducts;
  int menuOrder;
  String priceHtml;
  List<int> relatedIds;
  List<dynamic> metaData;
  String stockStatus;
  bool hasOptions;
  String postPassword;
  String globalUniqueId;
  List<dynamic> brands;
  Links links;

  ListAllProduct({
    required this.id,
    required this.name,
    required this.slug,
    required this.permalink,
    required this.dateCreated,
    required this.dateCreatedGmt,
    required this.dateModified,
    required this.dateModifiedGmt,
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
    this.dateOnSaleFrom,
    this.dateOnSaleFromGmt,
    this.dateOnSaleTo,
    this.dateOnSaleToGmt,
    required this.onSale,
    required this.purchasable,
    required this.totalSales,
    required this.virtual,
    required this.downloadable,
    required this.downloads,
    required this.downloadLimit,
    required this.downloadExpiry,
    required this.externalUrl,
    required this.buttonText,
    required this.taxStatus,
    required this.taxClass,
    required this.manageStock,
    this.stockQuantity,
    required this.backorders,
    required this.backordersAllowed,
    required this.backordered,
    this.lowStockAmount,
    required this.soldIndividually,
    required this.weight,
    required this.dimensions,
    required this.shippingRequired,
    required this.shippingTaxable,
    required this.shippingClass,
    required this.shippingClassId,
    required this.reviewsAllowed,
    required this.averageRating,
    required this.ratingCount,
    required this.upsellIds,
    required this.crossSellIds,
    required this.parentId,
    required this.purchaseNote,
    required this.categories,
    required this.tags,
    required this.images,
    required this.attributes,
    required this.defaultAttributes,
    required this.variations,
    required this.groupedProducts,
    required this.menuOrder,
    required this.priceHtml,
    required this.relatedIds,
    required this.metaData,
    required this.stockStatus,
    required this.hasOptions,
    required this.postPassword,
    required this.globalUniqueId,
    required this.brands,
    required this.links,
    CategoryImage? image,
  });

  factory ListAllProduct.fromJson(Map<String, dynamic> json) {
    return ListAllProduct(
      id: json.containsKey('id') ? json['id'] : null,
      name: json.containsKey('name') ? json['name'] : null,
      slug: json.containsKey('slug') ? json['slug'] : null,
      permalink: json.containsKey('permalink') ? json['permalink'] : null,
      dateCreated:
          DateTime.parse(json['date_created'] ?? DateTime.now().toString()),
      dateCreatedGmt:
          DateTime.parse(json['date_created_gmt'] ?? DateTime.now().toString()),
      dateModified:
          DateTime.parse(json['date_modified'] ?? DateTime.now().toString()),
      dateModifiedGmt: DateTime.parse(
          json['date_modified_gmt'] ?? DateTime.now().toString()),
      type: json['type'] ?? '',
      status: json['status'] ?? '',
      featured: json['featured'] ?? false,
      catalogVisibility: json['catalog_visibility'] ?? '',
      description: json['description'] ?? '',
      shortDescription: json['short_description'] ?? '',
      sku: json['sku'] ?? '',
      price: json['price'] ?? '',
      regularPrice: json['regular_price'] ?? '',
      salePrice: json['sale_price'] ?? '',
      dateOnSaleFrom: json['date_on_sale_from'] != null
          ? DateTime.parse(json['date_on_sale_from'])
          : null,
      dateOnSaleFromGmt: json['date_on_sale_from_gmt'] != null
          ? DateTime.parse(json['date_on_sale_from_gmt'])
          : null,
      dateOnSaleTo: json['date_on_sale_to'] != null
          ? DateTime.parse(json['date_on_sale_to'])
          : null,
      dateOnSaleToGmt: json['date_on_sale_to_gmt'] != null
          ? DateTime.parse(json['date_on_sale_to_gmt'])
          : null,
      onSale: json['on_sale'] ?? false,
      purchasable: json['purchasable'] ?? false,
      totalSales: json['total_sales'] ?? 0,
      virtual: json['virtual'] ?? false,
      downloadable: json['downloadable'] ?? false,
      downloads: List<dynamic>.from(json['downloads'] ?? []),
      downloadLimit: json['download_limit'] ?? 0,
      downloadExpiry: json['download_expiry'] ?? 0,
      externalUrl: json['external_url'] ?? '',
      buttonText: json['button_text'] ?? '',
      taxStatus: json['tax_status'] ?? '',
      taxClass: json['tax_class'] ?? '',
      manageStock: json['manage_stock'] ?? false,
      stockQuantity: json['stock_quantity'],
      backorders: json['backorders'] ?? '',
      backordersAllowed: json['backorders_allowed'] ?? false,
      backordered: json['backordered'] ?? false,
      lowStockAmount: json['low_stock_amount'],
      soldIndividually: json['sold_individually'] ?? false,
      weight: json['weight'] ?? '',
      dimensions: Dimensions.fromJson(json['dimensions'] ?? {}),
      shippingRequired: json['shipping_required'] ?? false,
      shippingTaxable: json['shipping_taxable'] ?? false,
      shippingClass: json['shipping_class'] ?? '',
      shippingClassId: json['shipping_class_id'] ?? 0,
      reviewsAllowed: json['reviews_allowed'] ?? false,
      averageRating: json['average_rating'] ?? '0.00',
      ratingCount: json['rating_count'] ?? 0,
      upsellIds: List<int>.from(json['upsell_ids'] ?? []),
      crossSellIds: List<int>.from(json['cross_sell_ids'] ?? []),
      parentId: json['parent_id'] ?? 0,
      purchaseNote: json['purchase_note'] ?? '',
      categories: List<Category>.from(
          (json['categories'] ?? []).map((x) => Category.fromJson(x))),
      tags: List<dynamic>.from(json['tags'] ?? []),
      images: List<ProductImage>.from(
          (json['images'] ?? []).map((x) => ProductImage.fromJson(x))),
      attributes: List<dynamic>.from(json['attributes'] ?? []),
      defaultAttributes: List<dynamic>.from(json['default_attributes'] ?? []),
      variations: List<dynamic>.from(json['variations'] ?? []),
      groupedProducts: List<dynamic>.from(json['grouped_products'] ?? []),
      menuOrder: json['menu_order'] ?? 0,
      priceHtml: json['price_html'] ?? '',
      relatedIds: List<int>.from(json['related_ids'] ?? []),
      metaData: List<dynamic>.from(json['meta_data'] ?? []),
      stockStatus: json['stock_status'] ?? '',
      hasOptions: json['has_options'] ?? false,
      postPassword: json['post_password'] ?? '',
      globalUniqueId: json['global_unique_id'] ?? '',
      brands: List<dynamic>.from(json['brands'] ?? []),
      links: Links.fromJson(json['_links'] ?? {}),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'slug': slug,
      'permalink': permalink,
      'date_created': dateCreated.toIso8601String(),
      'date_created_gmt': dateCreatedGmt.toIso8601String(),
      'date_modified': dateModified.toIso8601String(),
      'date_modified_gmt': dateModifiedGmt.toIso8601String(),
      'type': type,
      'status': status,
      'featured': featured,
      'catalog_visibility': catalogVisibility,
      'description': description,
      'short_description': shortDescription,
      'sku': sku,
      'price': price,
      'regular_price': regularPrice,
      'sale_price': salePrice,
      'date_on_sale_from': dateOnSaleFrom?.toIso8601String(),
      'date_on_sale_from_gmt': dateOnSaleFromGmt?.toIso8601String(),
      'date_on_sale_to': dateOnSaleTo?.toIso8601String(),
      'date_on_sale_to_gmt': dateOnSaleToGmt?.toIso8601String(),
      'on_sale': onSale,
      'purchasable': purchasable,
      'total_sales': totalSales,
      'virtual': virtual,
      'downloadable': downloadable,
      'downloads': downloads,
      'download_limit': downloadLimit,
      'download_expiry': downloadExpiry,
      'external_url': externalUrl,
      'button_text': buttonText,
      'tax_status': taxStatus,
      'tax_class': taxClass,
      'manage_stock': manageStock,
      'stock_quantity': stockQuantity,
      'backorders': backorders,
      'backorders_allowed': backordersAllowed,
      'backordered': backordered,
      'low_stock_amount': lowStockAmount,
      'sold_individually': soldIndividually,
      'weight': weight,
      'dimensions': dimensions.toJson(),
      'shipping_required': shippingRequired,
      'shipping_taxable': shippingTaxable,
      'shipping_class': shippingClass,
      'shipping_class_id': shippingClassId,
      'reviews_allowed': reviewsAllowed,
      'average_rating': averageRating,
      'rating_count': ratingCount,
      'upsell_ids': upsellIds,
      'cross_sell_ids': crossSellIds,
      'parent_id': parentId,
      'purchase_note': purchaseNote,
      'categories': List<dynamic>.from(categories.map((x) => x.toJson())),
      'tags': tags,
      'images': List<dynamic>.from(images.map((x) => x.toJson())),
      'attributes': attributes,
      'default_attributes': defaultAttributes,
      'variations': variations,
      'grouped_products': groupedProducts,
      'menu_order': menuOrder,
      'price_html': priceHtml,
      'related_ids': relatedIds,
      'meta_data': metaData,
      'stock_status': stockStatus,
      'has_options': hasOptions,
      'post_password': postPassword,
      'global_unique_id': globalUniqueId,
      'brands': brands,
      '_links': links.toJson(),
    };
  }
}

class Dimensions {
  String length;
  String width;
  String height;

  Dimensions({
    required this.length,
    required this.width,
    required this.height,
  });

  factory Dimensions.fromJson(Map<String, dynamic> json) {
    return Dimensions(
      length: json['length'] ?? '',
      width: json['width'] ?? '',
      height: json['height'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'length': length,
      'width': width,
      'height': height,
    };
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
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      slug: json['slug'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'slug': slug,
    };
  }
}

class ProductImage {
  int id;
  DateTime dateCreated;
  DateTime dateCreatedGmt;
  DateTime dateModified;
  DateTime dateModifiedGmt;
  String src;
  String name;
  String alt;

  ProductImage({
    required this.id,
    required this.dateCreated,
    required this.dateCreatedGmt,
    required this.dateModified,
    required this.dateModifiedGmt,
    required this.src,
    required this.name,
    required this.alt,
  });

  factory ProductImage.fromJson(Map<String, dynamic> json) {
    return ProductImage(
      id: json['id'] ?? 0,
      dateCreated:
          DateTime.parse(json['date_created'] ?? DateTime.now().toString()),
      dateCreatedGmt:
          DateTime.parse(json['date_created_gmt'] ?? DateTime.now().toString()),
      dateModified:
          DateTime.parse(json['date_modified'] ?? DateTime.now().toString()),
      dateModifiedGmt: DateTime.parse(
          json['date_modified_gmt'] ?? DateTime.now().toString()),
      src: json['src'] ?? '',
      name: json['name'] ?? '',
      alt: json['alt'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'date_created': dateCreated.toIso8601String(),
      'date_created_gmt': dateCreatedGmt.toIso8601String(),
      'date_modified': dateModified.toIso8601String(),
      'date_modified_gmt': dateModifiedGmt.toIso8601String(),
      'src': src,
      'name': name,
      'alt': alt,
    };
  }
}

class Links {
  List<Self> self;
  List<Collection> collection;

  Links({
    required this.self,
    required this.collection,
  });

  factory Links.fromJson(Map<String, dynamic> json) {
    return Links(
      self: List<Self>.from(json['self']?.map((x) => Self.fromJson(x)) ?? []),
      collection: List<Collection>.from(
          json['collection']?.map((x) => Collection.fromJson(x)) ?? []),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'self': List<dynamic>.from(self.map((x) => x.toJson())),
      'collection': List<dynamic>.from(collection.map((x) => x.toJson())),
    };
  }
}

class Self {
  String href;
  TargetHints targetHints;

  Self({
    required this.href,
    required this.targetHints,
  });

  factory Self.fromJson(Map<String, dynamic> json) {
    return Self(
      href: json['href'] ?? '',
      targetHints: TargetHints.fromJson(json['targetHints'] ?? {}),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'href': href,
      'targetHints': targetHints.toJson(),
    };
  }
}

class TargetHints {
  List<String> allow;

  TargetHints({
    required this.allow,
  });

  factory TargetHints.fromJson(Map<String, dynamic> json) {
    return TargetHints(
      allow: List<String>.from(json['allow'] ?? []),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'allow': List<dynamic>.from(allow),
    };
  }
}

class Collection {
  String href;

  Collection({
    required this.href,
  });

  factory Collection.fromJson(Map<String, dynamic> json) {
    return Collection(
      href: json['href'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'href': href,
    };
  }
}
