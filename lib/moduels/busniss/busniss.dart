import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_laith/component/component.dart';
import 'package:news_app_laith/cubit/cubit.dart';
import 'package:news_app_laith/cubit/states.dart';

class BusnissScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var list =NewsCubit.get(context).busniss;
        return ConditionalBuilder(
        condition: state is! NewsGetBusnissLoadingState,
        builder: (context) => ListView.separated(
          physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) => buildArticleItem(list[index],context),
            separatorBuilder: (context, index) => myDivider(),
            itemCount: 10),
        fallback: (context) => Center(child: CircularProgressIndicator()),
      );
      },
    );
  }
}
