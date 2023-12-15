import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';
import 'package:state_management/feature/travel/cubit/travel_cubit.dart';
import 'package:state_management/feature/travel/model/travel_model.dart';
import 'package:state_management/product/constant/color_constant.dart';
import 'package:state_management/product/constant/string_constant.dart';
import 'package:state_management/product/widget/bold_text.dart';

class TravelView extends StatefulWidget {
  const TravelView({super.key});

  @override
  State<TravelView> createState() => _TravelViewState();
}

class _TravelViewState extends State<TravelView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<TravelCubit>(
      create: (context) => TravelCubit()..fetchItems(),
      child: BlocConsumer<TravelCubit, TravelStates>(
        listener: (context, state) {},
        builder: (context, state) {
          final read = context.read<TravelCubit>;

          return Scaffold(
            appBar: AppBar(),
            body: Padding(
              padding: context.padding.normal,
              child: Column(
                children: [
                  const BoldText(text: StringConstant.travelHeyJohn),
                  context.sized.emptySizedHeightBoxLow3x,
                  TextField(
                    onChanged: (value) {
                      read().searchByItems(value);
                    },
                    decoration:
                        const InputDecoration(prefixIcon: Icon(Icons.search_outlined), border: OutlineInputBorder()),
                  ),
                  context.sized.emptySizedHeightBoxLow3x,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const BoldText(text: StringConstant.travelPopDes),
                      InkWell(
                        onTap: () {
                          read().seeAllItems();
                        },
                        child: Text(
                          StringConstant.travelSeeAll,
                          style: context.general.textTheme.titleLarge
                              ?.copyWith(color: ColorConstant.colorBlue, decoration: TextDecoration.underline),
                        ),
                      )
                    ],
                  ),
                  context.sized.emptySizedHeightBoxLow3x,
                  SizedBox(
                    height: context.sized.dynamicHeight(0.26),
                    child: _itemsCastale(context),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: state is TravelItemsSeeAll ? state.images.length : 0,
                      itemBuilder: (BuildContext context, int index) {
                        final image = (state as TravelItemsSeeAll).images[index];
                        return image;
                      },
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

Widget _itemsCastale(BuildContext context) {
  return BlocSelector<TravelCubit, TravelStates, List<TravelModel>>(
    selector: (state) {
      if (state is TravelItemsSeeAll) {
        if (context.read<TravelCubit>().result.isEmpty) {
          return context.read<TravelCubit>().allItems;
        }
        return context.read<TravelCubit>().result;
      } else if (state is TravelItemsLoaded) {
        return state.items;
      } else {
        return context.read<TravelCubit>().allItems;
      }
      // return state is TravelItemsLoaded ? state.items : context.read<TravelCubit>().allItems;
    },
    builder: (context, state) {
      return ListView.builder(
        itemCount: state.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Card(
            child: SizedBox(width: context.sized.dynamicWidth(0.37), child: Image.asset(state[index].imagePath)),
          );
        },
      );
    },
  );
}
