import 'citation_source.dart';

class CitationMetadata {
	List<CitationSource>? citationSources;

	CitationMetadata({this.citationSources});

	factory CitationMetadata.fromJson(Map<String, dynamic> json) {
		return CitationMetadata(
			citationSources: (json['citationSources'] as List<dynamic>?)
						?.map((e) => CitationSource.fromJson(e as Map<String, dynamic>))
						.toList(),
		);
	}



	Map<String, dynamic> toJson() => {
				'citationSources': citationSources?.map((e) => e.toJson()).toList(),
			};
}
