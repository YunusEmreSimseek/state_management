import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management/feature/travel/model/travel_model.dart';
import 'package:state_management/product/constant/image_enum.dart';

class TravelCubit extends Cubit<TravelStates> {
  TravelCubit() : super(TravelLoading());

  List<TravelModel> allItems = [];
  List<TravelModel> result = [];

  Future<void> fetchItems() async {
    await Future.delayed(const Duration(seconds: 1));
    allItems = TravelModel.mockItmes;
    emit(TravelItemsLoaded(allItems));
  }

  Future<void> fetchItems2() async {
    await Future.delayed(const Duration(seconds: 1));
    allItems = TravelModel.mockItmes;
    emit(TravelItemsLoadedAndSeeAll(allItems, [], isSeeAllActive: false));
  }

  void searchByItems(String content) {
    result = allItems.where((element) => element.title.toLowerCase().contains(content)).toList();
    emit(TravelItemsLoaded(result));
  }

  void seeAllItems() {
    emit(TravelItemsSeeAll([
      ImageEnums.camp_alt.toImage,
      ImageEnums.camp_alt2.toImage,
    ]));
  }
}

abstract class TravelStates {}

class TravelLoading extends TravelStates {}

class TravelItemsLoaded extends TravelStates {
  final List<TravelModel> items;

  TravelItemsLoaded(this.items);
}

class TravelItemsSeeAll extends TravelStates {
  final List<Image> images;

  TravelItemsSeeAll(this.images);
}

class TravelItemsLoadedAndSeeAll extends TravelStates {
  final List<TravelModel> items;
  final List<Image> images;
  bool? isSeeAllActive;

  TravelItemsLoadedAndSeeAll(this.items, this.images, {this.isSeeAllActive = false});
}
