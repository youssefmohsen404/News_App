import 'package:flutter/material.dart';
import 'package:news/api/api_manager.dart';
import 'package:news/model/NewsResponse.dart';
import 'package:news/ui/home/category%20details/news/description_bottom_sheet.dart';
import 'package:news/ui/home/category%20details/news/news_item.dart';
import 'package:news/utils/app_colors.dart';

import '../../../../model/SourceResponse.dart';
import '../sources/source_tab_widget.dart';

class NewsWidget extends StatefulWidget {
  Sources source;

  NewsWidget({super.key, required this.source});

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return FutureBuilder<NewsResponse?>(
      future: ApiManager.getNewsBySourceId(widget.source.id ?? ''),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(color: AppColors.greyColor),
          );
        } else if (snapshot.hasError) {
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
                  ApiManager.getNewsBySourceId(widget.source.id ?? '');
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
        if (snapshot.data?.status != 'ok') {
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
                  ApiManager.getNewsBySourceId(widget.source.id ?? '');
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
        var newsList = snapshot.data?.articles ?? [];
        return Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) {
              return NewsItem(news: newsList[index]);
            },

            itemCount: newsList.length,
          ),
        );
      },
    );
  }
}
