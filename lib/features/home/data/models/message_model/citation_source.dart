class CitationSource {
	int? startIndex;
	int? endIndex;
	String? uri;
	String? license;

	CitationSource({this.startIndex, this.endIndex, this.uri, this.license});

	factory CitationSource.fromJson(Map<String, dynamic> json) {
		return CitationSource(
			startIndex: json['startIndex'] as int?,
			endIndex: json['endIndex'] as int?,
			uri: json['uri'] as String?,
			license: json['license'] as String?,
		);
	}



	Map<String, dynamic> toJson() => {
				'startIndex': startIndex,
				'endIndex': endIndex,
				'uri': uri,
				'license': license,
			};
}
