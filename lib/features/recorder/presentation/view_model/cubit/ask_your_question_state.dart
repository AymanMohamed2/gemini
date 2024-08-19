part of 'ask_your_question_cubit.dart';

@immutable
sealed class AskYourQuestionState {}

final class AskYourQuestionRecording extends AskYourQuestionState {}

final class AskYourQuestionSpeaking extends AskYourQuestionState {}

final class AskYourQuestionInitial extends AskYourQuestionState {}

final class AskYourQuestionLoading extends AskYourQuestionState {}

final class AskYourQuestionSuccess extends AskYourQuestionState {}

final class AskYourQuestionFailure extends AskYourQuestionState {}
