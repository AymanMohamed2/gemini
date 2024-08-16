import 'package:chat_gpt/core/entities/message_entity.dart';

import 'candidate.dart';
import 'usage_metadata.dart';

class MessageModel extends MessageEntity {
  List<Candidate>? candidates;
  UsageMetadata? usageMetadata;

  MessageModel({this.candidates, this.usageMetadata})
      : super(
            message: candidates![0].content!.parts![0].text!,
            isUserMessage: false);

  factory MessageModel.fromJson(Map<String, dynamic> json) => MessageModel(
        candidates: (json['candidates'] as List<dynamic>?)
            ?.map((e) => Candidate.fromJson(e as Map<String, dynamic>))
            .toList(),
        usageMetadata: json['usageMetadata'] == null
            ? null
            : UsageMetadata.fromJson(
                json['usageMetadata'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'candidates': candidates?.map((e) => e.toJson()).toList(),
        'usageMetadata': usageMetadata?.toJson(),
      };
}
