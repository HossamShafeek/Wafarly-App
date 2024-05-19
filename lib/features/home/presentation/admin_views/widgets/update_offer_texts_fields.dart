import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wafarly/core/utils/app_strings.dart';
import 'package:wafarly/core/widgets/custom_text_field.dart';
import 'package:wafarly/features/home/data/models/slider_model/slider_model.dart';
import 'package:wafarly/features/home/presentation/cubits/offers_cubit/offers_cubit.dart';
import 'package:wafarly/features/home/presentation/cubits/offers_cubit/offers_state.dart';


class UpdateOfferTextsFields extends StatefulWidget {
  const UpdateOfferTextsFields({super.key, required this.offerModel});

  final OfferModel offerModel;

  @override
  State<UpdateOfferTextsFields> createState() => _UpdateOfferTextsFieldsState();
}

class _UpdateOfferTextsFieldsState extends State<UpdateOfferTextsFields> {

  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      OffersCubit.get(context).imageUrlController.text=widget.offerModel.imageUrl;
      OffersCubit.get(context).storeNameController.text=widget.offerModel.storeName;
      OffersCubit.get(context).storeUrlController.text=widget.offerModel.storeUrl;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OffersCubit, OffersState>(
      builder: (context, state) {
        return Form(
          key: OffersCubit.get(context).formKey,
          child: Column(
            children: [
              CustomTextField(
                onTapOutsideUnFocus: false,
                textInputType: TextInputType.text,
                controller: OffersCubit.get(context).storeNameController,
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
                controller: OffersCubit.get(context).imageUrlController,
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
                controller: OffersCubit.get(context).storeUrlController,
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
