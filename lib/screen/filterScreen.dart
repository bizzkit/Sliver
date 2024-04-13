import 'package:flutter/material.dart';
import 'package:flutter_filter_1/commponents/customButton.dart';
import 'package:flutter_filter_1/commponents/filterForm.dart';

class FilterScreen extends StatefulWidget {
  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  TextEditingController searchController = TextEditingController();
  String selectedRegion = "Не выбрано";

  bool isSearchValid() {
    return searchController.text.isNotEmpty && selectedRegion != "Не выбрано";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Фильтр",
          style: TextStyle(
            fontWeight: FontWeight.bold, 
          ),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            sliver: FilterForm(
              searchController: searchController,
              selectedRegion: selectedRegion,
              onRegionChanged: (String? value) {
                setState(() {
                  selectedRegion = value ?? "Не выбрано";
                });
              },
            ),
          ),
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SearchButton(
          onPressed: isSearchValid() ? () => search() : null,
          isSearchValid: isSearchValid(),
        ),
      ),
    );
  }

  void search() {
    print("Выполняется поиск...");
  }
}
