import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news/utils/app_colors.dart';

import '../../../../model/NewsResponse.dart';
import 'description_bottom_sheet.dart';

class NewsItem extends StatefulWidget {
  News news;

  NewsItem({super.key, required this.news});

  @override
  State<NewsItem> createState() => _NewsItemState();
}

class _NewsItemState extends State<NewsItem> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return InkWell(
      //todo: show describtion bottom sheet
      onTap: () {
        showDescriptionBottomSheet();
      },
      child: Container(
        margin: EdgeInsetsGeometry.symmetric(
          vertical: height * 0.02,
          horizontal: width * 0.02,
        ),
        padding: EdgeInsetsGeometry.symmetric(
          horizontal: width * 0.02,
          vertical: height * 0.02,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Theme.of(context).indicatorColor, width: 1),
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(8),
              child: CachedNetworkImage(
                imageUrl: widget.news.urlToImage ?? '',
                placeholder: (context, url) => Center(
                  child: CircularProgressIndicator(color: AppColors.greyColor),
                ),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
              /*
               Image.network(news.urlToImage?? ''),
      */
            ),
            SizedBox(height: height * 0.02),
            Text(
              limitWords(widget.news.title ?? '', 5),
              style: Theme.of(context).textTheme.labelLarge,
            ),
            SizedBox(height: height * 0.02),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'By: ${widget.news.author ?? ''}',
                  style: Theme.of(context).textTheme.labelSmall,
                ),
                Text(
                  'By: ${widget.news.publishedAt ?? ''}',
                  style: Theme.of(context).textTheme.labelSmall,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String limitWords(String text, int maxWords) {
    final words = text.split(' ');
    if (words.length <= maxWords) return text;
    return words.take(maxWords).join(' ') + '...';
  }

  void showDescriptionBottomSheet() {
    showBottomSheet(
      context: context,
      builder: (context) {
        return DescriptionBottomSheet(news: widget.news);
      },
    );
  }
}
