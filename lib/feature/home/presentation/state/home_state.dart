part of 'home_bloc.dart';

class HomeState extends Equatable {

   final BlocStatus<NewsModel> newsStatus;
   final BlocStatus<NewsDetailsModel> newsDetailsStatus;

  const HomeState({
    this.newsStatus=const BlocStatus(),
    this.newsDetailsStatus = const BlocStatus()
});

  @override
  // TODO: implement props
  List<Object?> get props => [newsStatus,newsDetailsStatus];


  @override
  String toString() {
    return "FetchAllNews: $newsStatus,";
  }

   HomeState copyWith({
     BlocStatus<NewsModel>? newsStatus,
     BlocStatus<NewsDetailsModel>? newsDetailsStatus,
   }) {
     return HomeState(
       newsStatus: newsStatus ?? this.newsStatus,
       newsDetailsStatus: newsDetailsStatus ?? this.newsDetailsStatus,
     );
   }

}
