import 'package:flutter/material.dart';
import 'package:news/api/api_manager.dart';
import 'package:news/model/SourceResponse.dart';
import 'package:news/model/category.dart';
import 'package:news/ui/home/category%20details/category_details_view_model.dart';
import 'package:news/ui/home/category%20details/sources/source_tab_widget.dart';
import 'package:news/utils/app_colors.dart';
import 'package:news/utils/app_styles.dart';
import 'package:provider/provider.dart';

class CategoryDetails extends StatefulWidget {
  CategoryDetails({super.key, required this.category});

  Category category;

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  CategoryDetailsViewModel viewModel = CategoryDetailsViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getSources(widget.category.id);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SourceResponse?>(
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
    );
  }
}

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
