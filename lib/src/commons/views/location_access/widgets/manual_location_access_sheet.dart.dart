import 'package:flutter/material.dart';
import 'package:flutter_riverpod_base/src/res/colors.dart';
import 'package:flutter_riverpod_base/src/utils/custom_extension_methods.dart';
import 'package:flutter_riverpod_base/src/utils/form_text_field.dart';
import 'package:flutter_riverpod_base/src/utils/image_picker_utilities.dart';

showLoactionAccessingBottomModelSheet(BuildContext context) {
  showModalBottomSheet(
    showDragHandle: true,
    backgroundColor: ColorAssets.lightBlueGray,
    enableDrag: true,
    context: context,
    builder: (context) {
      Size size = MediaQuery.of(context).size;
      return Builder(builder: (context) {
        return LoactionSearchingWidget(size: size);
      });
    },
  );
} 

class LoactionSearchingWidget extends StatefulWidget {
  final Size size;

  const LoactionSearchingWidget({Key? key, required this.size}) : super(key: key);

  @override
  _LoactionSearchingWidgetState createState() => _LoactionSearchingWidgetState();
}

class _LoactionSearchingWidgetState extends State<LoactionSearchingWidget> {
  List<String> allLocations = List.generate(50, (index) => "Location info $index");
  List<String> filteredLocations = [];

  @override
  void initState() {
    super.initState();
    filteredLocations = List.from(allLocations);
  }

  void filterLocations(String query) {
    // Filter the locations based on the search query
    setState(() {
      filteredLocations = allLocations
          .where((location) => location.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.size.height / 2,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          FormTextField(
            prefixWidget: Icon(
              Icons.search,
              color: ColorAssets.black,
            ),
            textColor: ColorAssets.black,
            hintTextColors: ColorAssets.black,
            backgroundColor: ColorAssets.white,
            hintText: "search location",
            onChanged: filterLocations,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredLocations.length,
              itemBuilder: (context, index) => ListTile(
                title: Text(filteredLocations[index]),
              ),
            ),
          ),
        ],
      ).addSpacingBetweenElements(15),
    );
  }
}

