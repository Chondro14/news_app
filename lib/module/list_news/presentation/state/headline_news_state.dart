part of '../cubit/headline_news_cubit.dart';

abstract class HeadlineNewsState extends Equatable {
  const HeadlineNewsState();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class HeadlineInitialState extends HeadlineNewsState {}

class HeadlineLoadingState extends HeadlineNewsState {}

class GetSuccessHeadlineNews extends HeadlineNewsState {
  final Stream<List<HeadlineNewsValueModel>> stream;
  const GetSuccessHeadlineNews(this.stream);
  @override
  // TODO: implement props
  List<Object?> get props => [stream];
}

class GetFailedHeadLineNews extends HeadlineNewsState {
  final String message;
  const GetFailedHeadLineNews(this.message);
  @override
  // TODO: implement props
  List<Object?> get props => [message];
}
