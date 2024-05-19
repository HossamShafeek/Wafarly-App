import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wafarly/core/utils/app_strings.dart';
import 'package:wafarly/core/widgets/custom_text_field.dart';
import 'package:wafarly/features/home/data/models/slider_model/slider_model.dart';
import 'package:wafarly/features/home/presentation/cubits/sliders_cubit/sliders_cubit.dart';
import 'package:wafarly/features/home/presentation/cubits/sliders_cubit/sliders_state.dart';


class UpdateSliderTextsFields extends StatefulWidget {
  const UpdateSliderTextsFields({super.key, required this.sliderModel});

  final OfferModel sliderModel;

  @override
  State<UpdateSliderTextsFields> createState() => _UpdateSliderTextsFieldsState();
}

class _UpdateSliderTextsFieldsState extends State<UpdateSliderTextsFields> {

  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      SlidersCubit.get(context).imageUrlController.text=widget.sliderModel.imageUrl;
      SlidersCubit.get(context).storeNameController.text=widget.sliderModel.storeName;
      SlidersCubit.get(context).storeUrlController.text=widget.sliderModel.storeUrl;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SlidersCubit, SlidersState>(
      builder: (context, state) {
        return Form(
          key: SlidersCubit.get(context).formKey,
          child: Column(
            children: [
              CustomTextField(
                onTapOutsideUnFocus: false,
                textInputType: TextInputType.text,
                controller: SlidersCubit.get(context).storeNameController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return AppStrings.pleaseEnterStoreName;
                  }
                  return null;
                },
                title: AppStrings.storeName,
                hintText: AppStrings.enterStoreName,
              ),
              CustomTextField(
                onTapOutsideUnFocus: false,
                textInputType: TextInputType.text,
                controller: SlidersCubit.get(context).imageUrlController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return AppStrings.pleaseEnterImageUrl;
                  }
                  return null;
                },
                title: AppStrings.imageUrl,
                hintText: AppStrings.enterImageUrl,
              ),
              CustomTextField(
                onTapOutsideUnFocus: false,
                textInputType: TextInputType.text,
                controller: SlidersCubit.get(context).storeUrlController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return AppStrings.pleaseEnterStoreUrl;
                  }
                  return null;
                },
                title: AppStrings.storeUrl,
                hintText: AppStrings.enterStoreUrl,
              ),
            ],
          ),
        );
      },
    );
  }
}
