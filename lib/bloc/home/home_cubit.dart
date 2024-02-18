import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:teknopark_pdks/bloc/auth/login/login_cubit.dart';
import 'package:teknopark_pdks/model/auth/Login/login_response.dart';
import 'package:teknopark_pdks/model/home/anno_request_model.dart';
import 'package:teknopark_pdks/model/home/anno_response_model.dart';
import 'package:teknopark_pdks/services/home/IHomeService.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final IHomeService? service;
  bool isLoginFail = false;
  bool isLoading = false;

  HomeCubit({this.service}) : super(HomeInitial());

  Future<void> getAnnoData() async {
    changeLoadingView();
    final data = await service?.getAnnoData();
    changeLoadingView();
    if (data is AnnoResponseModel) {
      emit(HomeSuccesful(annoModel: data));
    }
  }

  void changeLoadingView() {
    isLoading = !isLoading;
    emit(HomeLoading(isLoading));
  }
}
