class PosterModel {
  String clintName;
  String clintMobile;
  String surrealNumberPoster;
  String licenseCharacter1;
  String licenseCharacter2;
  String licenseCharacter3;
  String licenseNumber;
  String licenseType;
  String clintType;

  PosterModel(
      {required this.clintName,
      required this.clintMobile,
      required this.surrealNumberPoster,
      required this.licenseCharacter1,
      required this.licenseCharacter2,
      required this.licenseCharacter3,
      required this.licenseNumber,
      required this.licenseType,
      required this.clintType});

  factory PosterModel.fromJson(Map<String, dynamic> json) {
    return PosterModel(
      clintName: json['clint_name'],
      clintMobile: json['clint_mobile'],
      surrealNumberPoster: json['surreal_poster'],
      licenseCharacter1: json['license_character1'],
      licenseCharacter2: json['license_character2'],
      licenseCharacter3: json['license_character3'],
      licenseNumber: json['license_number'],
      licenseType: json['license_type'],
      clintType: json['clint_type'],
    );
  }

  Map<String, dynamic> toJson() => {
        'clint_name': clintName,
        'clint_mobile': clintMobile,
        'surreal_poster': surrealNumberPoster,
        'license_character1': licenseCharacter1,
        'license_character2': licenseCharacter2,
        'license_character3': licenseCharacter3,
        'license_number': licenseNumber,
        'license_type': licenseType,
        'clint_type': clintType,
      };
}
