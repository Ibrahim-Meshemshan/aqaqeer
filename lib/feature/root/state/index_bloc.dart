import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class IndexEvent {}

class ChangeIndexEvent extends IndexEvent {
  int index = 0;

  ChangeIndexEvent(this.index);
}

class IndexBloc extends Bloc<IndexEvent, int> {
  PageController pageController = PageController(initialPage: 0);
  IndexBloc() : super(0) {
    on<ChangeIndexEvent>((event, emit) {
      emit(event.index);
      pageController.animateToPage(
        event.index,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    });
  }
}
