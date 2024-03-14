class PhotoModel {
  String? url;
  SrcModel? src;

  PhotoModel({this.url, this.src});

  factory PhotoModel.fromMap(Map<String, dynamic> parsedJson) {
    return PhotoModel(
      url: parsedJson['url'],
      src: SrcModel.fromMap(parsedJson['src']),
    );
  }
}

class SrcModel {
  String? portrait;
  String? large;
  String? medium;
  String? small;

  factory SrcModel.fromMap(Map<String, dynamic> parsedJson) {
    return SrcModel(
      portrait: parsedJson['portrait'],
      large: parsedJson['large'],
      medium: parsedJson['medium'],
      small: parsedJson['small'],
    );
  }

  SrcModel({this.large, this.medium, this.portrait, this.small});
}
