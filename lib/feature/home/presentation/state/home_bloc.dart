
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/bloc_status.dart';
import '../../data/model/news_details_model.dart';
import '../../data/model/news_model.dart';
import '../../data/repo/home_repo_imp.dart';


part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepoImp homeRepoImp;

  HomeBloc(this.homeRepoImp) : super(const HomeState()) {

    on<HomeEvent>((event, emit) async {
      if(event is FetchNews){
        emit(state.copyWith(newsStatus: BlocStatus.loading()));
        ( await homeRepoImp.fetchNews())
            .fold(
                (fail) {
              emit(state.copyWith(newsStatus: BlocStatus.fail(error: fail.message)));
            },
                (news) => {
              emit(state.copyWith(newsStatus: BlocStatus.success(model: news)))
            });
      }

      if(event is FetchNewsDetails){
        emit(state.copyWith(newsDetailsStatus: BlocStatus.loading()));
        ( await homeRepoImp.fetchNewsDetails())
            .fold(
                (fail) {
              emit(state.copyWith(newsDetailsStatus: BlocStatus.fail(error: fail.message)));
            },
                (newsDetails) => {
              emit(state.copyWith(newsDetailsStatus: BlocStatus.success(model: newsDetails)))
            });
      }

    });
  }
}
