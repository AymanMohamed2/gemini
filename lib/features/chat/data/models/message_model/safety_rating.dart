class SafetyRating {
	String? category;
	String? probability;

	SafetyRating({this.category, this.probability});

	factory SafetyRating.fromJson(Map<String, dynamic> json) => SafetyRating(
				category: json['category'] as String?,
				probability: json['probability'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'category': category,
				'probability': probability,
			};
}
