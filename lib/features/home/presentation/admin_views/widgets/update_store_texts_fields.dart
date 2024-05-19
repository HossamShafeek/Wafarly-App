import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wafarly/core/utils/app_strings.dart';
import 'package:wafarly/core/widgets/custom_text_field.dart';
import 'package:wafarly/features/home/data/models/categories_model/categories_model.dart';
import 'package:wafarly/features/home/presentation/cubits/stores_cubit/stores_cubit.dart';
import 'package:wafarly/features/home/presentation/cubits/stores_cubit/stores_state.dart';

class UpdateStoreTextsFields extends StatefulWidget {
  const UpdateStoreTextsFields({super.key, required this.storeModel});

  final StoreModel storeModel;

  @override
  State<UpdateStoreTextsFields> createState() => _UpdateStoreTextsFieldsState();
}

class _UpdateStoreTextsFieldsState extends State<UpdateStoreTextsFields> {

  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      StoresCubit.get(context).imageUrlController.text=widget.storeModel.imageUrl;
      StoresCubit.get(context).storeNameController.text=widget.storeModel.storeName;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StoresCubit, StoresState>(
      builder: (context, state) {
        return Form(
          key: StoresCubit.get(context).formKey,
          child: Column(
            children: [
              CustomTextField(
                onTapOutsideUnFocus: false,
                textInputType: TextInputType.text,
                controller: StoresCubit.get(context).storeNameController,
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
                controller: StoresCubit.get(context).imageUrlController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return AppStrings.pleaseEnterImageUrl;
                  }
                  return null;
                },
                title: AppStrings.imageUrl,
                hintText: AppStrings.enterImageUrl,
              ),
            ],
          ),
        );
      },
    );
  }
}
