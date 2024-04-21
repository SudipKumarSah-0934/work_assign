class UrlCreateModel {
  Data data;
  int code;
  List<dynamic> errors;

  UrlCreateModel({
    required this.data,
    required this.code,
    required this.errors,
  });

  factory UrlCreateModel.fromJson(Map<String, dynamic> json) {
    return UrlCreateModel(
      data: Data.fromJson(json['data']),
      code: json['code'],
      errors: List<dynamic>.from(json['errors']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': data.toJson(),
      'code': code,
      'errors': errors,
    };
  }
}

class Data {
  String domain;
  String alias;
  bool deleted;
  bool archived;
  List<String> tags;
  String tinyUrl;
  String url;

  Data({
    required this.domain,
    required this.alias,
    required this.deleted,
    required this.archived,
    required this.tags,
    required this.tinyUrl,
    required this.url,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      domain: json['domain'],
      alias: json['alias'],
      deleted: json['deleted'],
      archived: json['archived'],
      tags: List<String>.from(json['tags']),
      tinyUrl: json['tinyUrl']??"", // You might want to parse it to DateTime if it's not null.
      url: json['url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'domain': domain,
      'alias': alias,
      'deleted': deleted,
      'archived': archived,
      'tags': tags,
      'tinyUrl': tinyUrl,
      'url': url,
    };
  }
}

class Analytics {
  bool enabled;
  bool public;

  Analytics({
    required this.enabled,
    required this.public,
  });

  factory Analytics.fromJson(Map<String, dynamic> json) {
    return Analytics(
      enabled: json['enabled'],
      public: json['public'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'enabled': enabled,
      'public': public,
    };
  }
}
