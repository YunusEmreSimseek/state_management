import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management/feature/travel/model/travel_model.dart';
import 'package:state_management/feature/travel/viewmodel/travel_states.dart';
import 'package:state_management/product/constant/image_enum.dart';

class TravelViewModel extends Cubit<TravelState> {
  TravelViewModel() : super(TravelState(isLoading: false, items: TravelModel.mockItmes));

  List<TravelModel> allItems = TravelModel.mockItmes;
  List<TravelModel> result = [];

  // Future<void> fetchItems() async {
  //   await Future.delayed(const Duration(seconds: 1));
  //   allItems = TravelModel.mockItmes;
  //   emit(state.);
  // }

  void searchByItems(String content) {
    changeLoading();
    result = allItems.where((element) => element.title.toLowerCase().contains(content)).toList();
    emit(state.copyWith(items: result));
    changeLoading();
  }

  void seeAllItems() {
    changeLoading();
    emit(
      state.copyWith(images: [
        ImageEnums.camp_alt.toImage,
        ImageEnums.camp_alt2.toImage,
      ]),
    );
    changeLoading();
  }

  void changeLoading() {
    emit(state.copyWith(isLoading: !state.isLoading));
  }
}
