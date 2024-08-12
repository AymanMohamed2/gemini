class UsageMetadata {
	int? promptTokenCount;
	int? candidatesTokenCount;
	int? totalTokenCount;

	UsageMetadata({
		this.promptTokenCount, 
		this.candidatesTokenCount, 
		this.totalTokenCount, 
	});

	factory UsageMetadata.fromJson(Map<String, dynamic> json) => UsageMetadata(
				promptTokenCount: json['promptTokenCount'] as int?,
				candidatesTokenCount: json['candidatesTokenCount'] as int?,
				totalTokenCount: json['totalTokenCount'] as int?,
			);

	Map<String, dynamic> toJson() => {
				'promptTokenCount': promptTokenCount,
				'candidatesTokenCount': candidatesTokenCount,
				'totalTokenCount': totalTokenCount,
			};
}
