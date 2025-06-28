part of 'home_bloc.dart';

 class HomeState extends Equatable {
  const HomeState({
    this.newsStatus=const BlocStatus()
});
  final BlocStatus<NewsModel> newsStatus;


  @override
  // TODO: implement props
  List<Object?> get props => [newsStatus];
  HomeState copyWith(
      {BlocStatus<NewsModel>? newsStatus}) {

    return HomeState(
        newsStatus: newsStatus ?? this.newsStatus);
  }

  @override
  String toString() {
    return "FetchAllNews: $newsStatus,";
  }
}
