class ModelDataDummy {
  final String title;
  final String location;
  final List<String> photos;
  final String price;
  final double rating;
  final int totalRating;
  final String description;
  final List<String> includedFacilities;
  final List<String> excludedFacilities;
  final List<PricePackage> pricePackage;
  final String termsAndConditions;
  final int maxParticipants;

  ModelDataDummy({
    required this.title,
    required this.location,
    required this.photos,
    required this.price,
    required this.rating,
    required this.totalRating,
    required this.description,
    required this.includedFacilities,
    required this.excludedFacilities,
    required this.termsAndConditions,
    required this.maxParticipants,
    required this.pricePackage,
  });
}

class PricePackage {
  final String title;
  final String price;
  final String description;
  final List<String> includedFacilities;
  final List<String> excludedFacilities;
  final String termsAndConditions;
  final int maxParticipants;

  PricePackage({
    required this.title,
    required this.price,
    required this.description,
    required this.includedFacilities,
    required this.excludedFacilities,
    required this.termsAndConditions,
    required this.maxParticipants,
  });
}
