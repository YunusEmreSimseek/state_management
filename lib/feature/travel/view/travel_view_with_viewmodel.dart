import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';
import 'package:state_management/feature/travel/viewmodel/travel_states.dart';
import 'package:state_management/feature/travel/viewmodel/travel_viewmodel.dart';
import 'package:state_management/product/constant/color_constant.dart';
import 'package:state_management/product/constant/string_constant.dart';
import 'package:state_management/product/widget/bold_text.dart';

class TravelViewWithViewModel extends StatefulWidget {
  const TravelViewWithViewModel({super.key});

  @override
  State<TravelViewWithViewModel> createState() => _TravelViewWithViewModelState();
}

class _TravelViewWithViewModelState extends State<TravelViewWithViewModel> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<TravelViewModel>(
      create: (context) => TravelViewModel(),
      child: BlocConsumer<TravelViewModel, TravelState>(
        listener: (context, state) {},
        builder: (context, state) {
          final read = context.read<TravelViewModel>;
          return Scaffold(
            appBar: AppBar(
              actions: [
                Center(
                  child: state.isLoading ? const CircularProgressIndicator() : null,
                )
              ],
            ),
            body: Padding(
              padding: context.padding.normal,
              child: Column(
                children: [
                  const BoldText(text: StringConstant.travelHeyJohn),
                  context.sized.emptySizedHeightBoxLow3x,
                  _searchField(read),
                  context.sized.emptySizedHeightBoxLow3x,
                  _textRow(read, context),
                  context.sized.emptySizedHeightBoxLow3x,
                  _itemsList(context),
                  _imagesBuilder(state)
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Row _textRow(TravelViewModel Function() read, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [const BoldText(text: StringConstant.travelPopDes), _seeAllButton(read, context)],
    );
  }

  Expanded _imagesBuilder(TravelState state) {
    return Expanded(
      child: ListView.builder(
        itemCount: state.images?.length ?? 0,
        itemBuilder: (BuildContext context, int index) {
          final image = state.images?[index];
          return image;
        },
      ),
    );
  }

  TextField _searchField(TravelViewModel Function() read) {
    return TextField(
      onChanged: (value) {
        read().searchByItems(value);
      },
      decoration: const InputDecoration(prefixIcon: Icon(Icons.search_outlined), border: OutlineInputBorder()),
    );
  }

  InkWell _seeAllButton(TravelViewModel Function() read, BuildContext context) {
    return InkWell(
      onTap: () {
        read().seeAllItems();
      },
      child: Text(
        StringConstant.travelSeeAll,
        style: context.general.textTheme.titleLarge
            ?.copyWith(color: ColorConstant.colorBlue, decoration: TextDecoration.underline),
      ),
    );
  }

  SizedBox _itemsList(BuildContext context) {
    return SizedBox(
      height: context.sized.dynamicHeight(0.26),
      child: BlocBuilder<TravelViewModel, TravelState>(
        builder: (context, state) {
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: state.items.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                child:
                    SizedBox(width: context.sized.dynamicWidth(0.37), child: Image.asset(state.items[index].imagePath)),
              );
            },
          );
        },
      ),
    );
  }
}
