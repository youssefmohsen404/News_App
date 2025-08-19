import 'package:flutter/material.dart';
import 'package:news/model/SourceResponse.dart';
import 'package:news/ui/home/category%20details/news/news_widget.dart';
import 'package:news/ui/home/category%20details/sources/source_name.dart';

import '../../../../model/NewsResponse.dart';

class SourceTabWidget extends StatefulWidget {
  List<Sources> sourceList;

  SourceTabWidget({super.key, required this.sourceList});

  @override
  State<SourceTabWidget> createState() => _SourceTabWidgetState();
}

class Source {
  static Source? fromJson(json) {}

  toJson() {}
}

class _SourceTabWidgetState extends State<SourceTabWidget> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widget.sourceList.length,
      child: Column(
        children: [
          TabBar(
            isScrollable: true,
            indicatorColor: Theme.of(context).indicatorColor,
            dividerColor: Colors.transparent,
            tabAlignment: TabAlignment.start,
            onTap: (index) {
              selectedIndex = index;
              setState(() {});
            },
            tabs: widget.sourceList.map((source) {
              return SourceName(
                source: source,
                isSelected: selectedIndex == widget.sourceList.indexOf(source),
              );
            }).toList(),
          ),
          NewsWidget(source: widget.sourceList[selectedIndex]),
        ],
      ),
    );
  }
}
