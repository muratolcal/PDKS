part of 'home_cubit.dart';

sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {
  HomeInitial();
}

class HomeLoading extends HomeState {
  final bool isLoading;

  HomeLoading(this.isLoading);
}

class HomeSuccesful extends HomeState {
  final AnnoResponseModel annoModel;

  HomeSuccesful({required this.annoModel});
}
