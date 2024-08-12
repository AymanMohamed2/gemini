import 'citation_metadata.dart';
import 'content.dart';
import 'safety_rating.dart';

class Candidate {
	Content? content;
	String? finishReason;
	int? index;
	List<SafetyRating>? safetyRatings;
	CitationMetadata? citationMetadata;

	Candidate({
		this.content, 
		this.finishReason, 
		this.index, 
		this.safetyRatings, 
		this.citationMetadata, 
	});

	factory Candidate.fromJson(Map<String, dynamic> json) => Candidate(
				content: json['content'] == null
						? null
						: Content.fromJson(json['content'] as Map<String, dynamic>),
				finishReason: json['finishReason'] as String?,
				index: json['index'] as int?,
				safetyRatings: (json['safetyRatings'] as List<dynamic>?)
						?.map((e) => SafetyRating.fromJson(e as Map<String, dynamic>))
						.toList(),
				citationMetadata: json['citationMetadata'] == null
						? null
						: CitationMetadata.fromJson(json['citationMetadata'] as Map<String, dynamic>),
			);

	Map<String, dynamic> toJson() => {
				'content': content?.toJson(),
				'finishReason': finishReason,
				'index': index,
				'safetyRatings': safetyRatings?.map((e) => e.toJson()).toList(),
				'citationMetadata': citationMetadata?.toJson(),
			};
}
