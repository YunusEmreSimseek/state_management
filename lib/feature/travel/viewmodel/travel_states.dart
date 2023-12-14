import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:state_management/feature/travel/model/travel_model.dart';

class TravelState extends Equatable {
  const TravelState({required this.isLoading, required this.items, this.images});
  final bool isLoading;
  final List<TravelModel> items;
  final List<Image>? images;

  TravelState copyWith({bool? isLoading, List<TravelModel>? items, List<Image>? images}) {
    return TravelState(
        isLoading: isLoading ?? this.isLoading, items: items ?? this.items, images: images ?? this.images);
  }

  @override
  List<Object?> get props => [isLoading, items, images];
}
