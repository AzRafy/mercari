import 'dart:convert';

class ProductcategoriesModel {
  final int id;
  final String name;
  final String slug;
  final num parent; // Changed to `num` to handle both int and double
  final String description;
  final String display;
  final CategoryImage? image;
  final int menuOrder;
  final int count;
  final Links links;

  ProductcategoriesModel({
    required this.id,
    required this.name,
    required this.slug,
    required this.parent,
    required this.description,
    required this.display,
    this.image,
    required this.menuOrder,
    required this.count,
    required this.links,
  });

  factory ProductcategoriesModel.fromJson(Map<String, dynamic> json) {
    return ProductcategoriesModel(
      id: json['id'] ?? 0, // Provide default value
      name: json['name'] ?? '',
      slug: json['slug'] ?? '',
      parent: json['parent'] ?? 0,
      description: json['description'] ?? '',
      display: json['display'] ?? '',
      image:
          json['image'] != null ? CategoryImage.fromJson(json['image']) : null,
      menuOrder: json['menu_order'] ?? 0,
      count: json['count'] ?? 0,
      links: Links.fromJson(json['_links'] ?? {}),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'slug': slug,
      'parent': parent,
      'description': description,
      'display': display,
      'image': image?.toJson(),
      'menu_order': menuOrder,
      'count': count,
      '_links': links.toJson(),
    };
  }
}

class CategoryImage {
  final int id;
  final String dateCreated;
  final String dateCreatedGmt;
  final String dateModified;
  final String dateModifiedGmt;
  final String src;
  final String name;
  final String alt;

  CategoryImage({
    required this.id,
    required this.dateCreated,
    required this.dateCreatedGmt,
    required this.dateModified,
    required this.dateModifiedGmt,
    required this.src,
    required this.name,
    required this.alt,
  });

  factory CategoryImage.fromJson(Map<String, dynamic> json) {
    return CategoryImage(
      id: json['id'] ?? 0,
      dateCreated: json['date_created'] ?? '',
      dateCreatedGmt: json['date_created_gmt'] ?? '',
      dateModified: json['date_modified'] ?? '',
      dateModifiedGmt: json['date_modified_gmt'] ?? '',
      src: json['src'] ?? '',
      name: json['name'] ?? '',
      alt: json['alt'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'date_created': dateCreated,
      'date_created_gmt': dateCreatedGmt,
      'date_modified': dateModified,
      'date_modified_gmt': dateModifiedGmt,
      'src': src,
      'name': name,
      'alt': alt,
    };
  }
}

class Links {
  final List<Link> self;
  final List<Link> collection;
  final List<Link>? up;

  Links({
    required this.self,
    required this.collection,
    this.up,
  });

  factory Links.fromJson(Map<String, dynamic> json) {
    return Links(
      self: List<Link>.from(json['self']?.map((x) => Link.fromJson(x)) ?? []),
      collection: List<Link>.from(
          json['collection']?.map((x) => Link.fromJson(x)) ?? []),
      up: json['up'] != null
          ? List<Link>.from(json['up']?.map((x) => Link.fromJson(x)) ?? [])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'self': self.map((x) => x.toJson()).toList(),
      'collection': collection.map((x) => x.toJson()).toList(),
      'up': up?.map((x) => x.toJson()).toList(),
    };
  }
}

class Link {
  final String href;

  Link({
    required this.href,
  });

  factory Link.fromJson(Map<String, dynamic> json) {
    return Link(
      href: json['href'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'href': href,
    };
  }
}
