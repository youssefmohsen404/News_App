import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/di/sources_dependency_injection.dart';
import 'package:news/model/category.dart';
import 'package:news/ui/home/category%20details/cubit/category_details_cubit.dart';
import 'package:news/ui/home/category%20details/cubit/category_details_state.dart';
import 'package:news/ui/home/category%20details/sources/source_tab_widget.dart';
import 'package:news/utils/app_colors.dart';
class CategoryDetails extends StatefulWidget {
  CategoryDetails({super.key, required this.category});

  Category category;

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  CategoryDetailsCubit viewModel = CategoryDetailsCubit(
      sourcesRepositoryContract: injectSourcesRepo());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getSources(widget.category.id);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryDetailsCubit, CategoryDetailsState>(
      bloc: viewModel,
      builder: (context, state) {
        //todo: handle loading
        if (state is CategoryStateLoading) {
          return const Center(
            child: CircularProgressIndicator(color: AppColors.greyColor),
          );
        }
        //todo: handle error
        else if (state is CategoryStateError) {
          return Column(
            children: [
              Text(state.message,
                style: Theme
                    .of(context)
                    .textTheme
                    .labelMedium,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.greyColor,
                ),
                onPressed: () {
                  viewModel.getSources(widget.category.id);
                  setState(() {});
                },
                child: Text(
                  'try again',
                  style: Theme
                      .of(context)
                      .textTheme
                      .labelMedium,
                ),
              ),
            ],
          );
        }
        //todo: handle success
        else if (state is CategoryStateSuccess) {
          return SourceTabWidget(sourceList: state.sourceList);
        }
        return Container();
      },);
  }
}


/*FutureBuilder<SourceResponse?>(
      future: ApiManager.getSources(widget.category.id),
      builder: (context, snapshot) {
        //todo: loading
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(color: AppColors.greyColor),
          );
        }
        //todo: error from client
        else if (snapshot.hasError) {
          return Column(
            children: [
              Text(
                'something went wrong',
                style: Theme.of(context).textTheme.labelMedium,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.greyColor,
                ),
                onPressed: () {
                  ApiManager.getSources(widget.category.id);
                  setState(() {});
                },
                child: Text(
                  'try again',
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ),
            ],
          );
        }
        //todo: server response success or error
        //todo:server error
        if (snapshot.data?.status == 'error') {
          return Column(
            children: [
              Text(
                snapshot.data!.message!,
                style: Theme.of(context).textTheme.labelMedium,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.greyColor,
                ),
                onPressed: () {
                  ApiManager.getSources(widget.category.id);
                  setState(() {});
                },
                child: Text(
                  'try again',
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ),
            ],
          );
        }
        //todo:server success
        var sourceList = snapshot.data?.sources ?? [];
        return SourceTabWidget(sourceList: sourceList);
      },
    );*/



/*ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Consumer<CategoryDetailsViewModel>(
        builder: (context, viewModel, child) {
            if(viewModel.errorMessage !=null){
              return Column(
                children: [
                  Text(viewModel.errorMessage!,
                    style: Theme.of(context).textTheme.labelMedium,),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.greyColor
                      ),
                      onPressed: (){
                        viewModel.getSources(widget.category.id);
                        setState(() {

                        });
                      }
                      , child: Text('try again',
                    style:Theme.of(context).textTheme.labelMedium ,)
                  )
                ],
              );
            }
            else if(viewModel.sourcesList == null){
              //todo:loading
              return const Center(
                child: CircularProgressIndicator(
                  color: AppColors.greyColor,
                ) ,
              );
            }else{
              //todo:success

              return SourceTabWidget(sourceList: viewModel.sourcesList!);
            }
      },)

    );*/
