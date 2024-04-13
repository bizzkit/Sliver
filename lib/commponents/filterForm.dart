import 'package:flutter/material.dart';
import 'package:flutter_filter_1/commponents/textField.dart';
import 'package:sliver_tools/sliver_tools.dart';

class FilterForm extends StatefulWidget {
  final TextEditingController searchController;
  final ValueChanged<String?> onRegionChanged;

  FilterForm({
    required this.searchController,
    required this.onRegionChanged,
    required String selectedRegion,
  });

  @override
  _FilterFormState createState() => _FilterFormState();
}

class _FilterFormState extends State<FilterForm> {
  String selectedRegion =
      "Не выбрано"; 

  @override
  Widget build(BuildContext context) {
    List<String> regions = List.generate(
      100,
      (index) => index == 0 ? "Не выбрано" : 'Регион $index',
    );

    return SliverFillRemaining(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextField(
            controller: widget.searchController,
            labelText: "Поиск",
          ),
          SizedBox(height: 10.0),
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
              ),
              borderRadius: BorderRadius.circular(0.0),
            ),
            child: ListTile(
              title: Text("$selectedRegion"),
              trailing: Icon(Icons.arrow_drop_down),
              onTap: () {
                _showRegionPicker(context, regions);
              },
            ),
          ),
        ],
      ),
    );
  }

  void _showRegionPicker(BuildContext context, List<String> regions) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.5,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
                decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.black)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Регионы",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.close),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: regions.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(regions[index]),
                      onTap: () {
                        Navigator.pop(context);
                        setState(() {
                          selectedRegion = regions[index];
                        });
                        widget.onRegionChanged(selectedRegion);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
