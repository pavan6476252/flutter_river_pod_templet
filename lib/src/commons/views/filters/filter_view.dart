import 'package:flutter/material.dart';
import 'package:flutter_riverpod_base/src/res/colors.dart';
import 'package:flutter_riverpod_base/src/utils/custom_button.dart';

import '../../../utils/custom_text_button.dart';

class FilterView extends StatefulWidget {
  static String routePath = '/filter-view';
  const FilterView({Key? key}) : super(key: key);

  @override
  State<FilterView> createState() => _FilterViewState();
}

class _FilterViewState extends State<FilterView> {
  int selectedCategoryIndex = 0;

  Color? bgColor;
  Color? textColor;
  String text = 'sdfs dsf';
  List<String> categories = ["All", "Photography", "Dance", "Art"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        leading: Container(
          margin: const EdgeInsets.only(left: 20),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ),
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back,
              size: 20,
            ),
          ),
        ),
        centerTitle: true,
        title: const Text(
          "Filter",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildCategorySection(),
                  const RatingCheckBoxBuilder(),
                  const PricesWrapWidget(),
                  const AmenitiesWrapWidget(),
                ],
              ),
            ),
          ),
          Container(
            height: 82,
            padding: const EdgeInsets.symmetric(horizontal: 37, vertical: 20),
            decoration: BoxDecoration(
              color: ColorAssets.white,
              boxShadow: [
                BoxShadow(color: ColorAssets.lightGray, blurRadius: 3)
              ],
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(20)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomTextButton(
                    bgColor: null, text: 'Reset Filter', textColor: null, ontap: () {  },),
                CustomTextButton(
                    bgColor: ColorAssets.primaryBlue,
                    text: 'Apply',
                    textColor: ColorAssets.white, ontap: () {  },)
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildCategorySection() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Category",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 22,
              color: ColorAssets.blackFaded,
            ),
          ),
          const SizedBox(height: 15),
          Row(
            children: List.generate(categories.length, (index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedCategoryIndex = index;
                  });
                },
                child: Container(
                  margin: EdgeInsets.only(left: index == 0 ? 0 : 15),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 17,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: selectedCategoryIndex == index
                        ? ColorAssets.primaryBlue
                        : ColorAssets.lightBlueGray,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    categories[index],
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      color: selectedCategoryIndex == index
                          ? ColorAssets.white
                          : ColorAssets.lightGray,
                    ),
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}

class AmenitiesWrapWidget extends StatefulWidget {
  const AmenitiesWrapWidget({super.key});

  @override
  State<AmenitiesWrapWidget> createState() => _AmenitiesWrapWidgetState();
}

class _AmenitiesWrapWidgetState extends State<AmenitiesWrapWidget> {
  final List<String> prices = [
    'Backdrop',
    'Props',
    'Lighting Equipment',
    'Camera',
    'Art Supplies',
    'Sound System',
    'Changing Rooms',
  ];

  List<int> selectedPriceIndices = [];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 0),
            child: Text(
              "Amenities",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 22,
                color: ColorAssets.blackFaded,
              ),
            ),
          ),
          const SizedBox(height: 15),
          Wrap(
            spacing: 6.0,
            runSpacing: 15.0,
            children: List.generate(prices.length, (index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    if (selectedPriceIndices.contains(index)) {
                      selectedPriceIndices.remove(index);
                    } else {
                      selectedPriceIndices.add(index);
                    }
                  });
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 17,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: selectedPriceIndices.contains(index)
                        ? ColorAssets.primaryBlue
                        : ColorAssets.lightBlueGray,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    prices[index],
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      color: selectedPriceIndices.contains(index)
                          ? ColorAssets.white
                          : ColorAssets.lightGray,
                    ),
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}

class PricesWrapWidget extends StatefulWidget {
  const PricesWrapWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<PricesWrapWidget> createState() => _PricesWrapWidgetState();
}

class _PricesWrapWidgetState extends State<PricesWrapWidget> {
  final List<String> prices = [
    "Under \$100",
    "Under \$500",
    "\$5000",
    "\$1500-\$3000",
    "\$1000-\$1500",
  ];

  int? selectedPriceIndex;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 0),
            child: Text(
              "Price",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 22,
                color: ColorAssets.blackFaded,
              ),
            ),
          ),
          const SizedBox(height: 15),
          Wrap(
            spacing: 6.0,
            runSpacing: 15.0,
            children: List.generate(prices.length, (index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedPriceIndex = index;
                  });
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 17,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: selectedPriceIndex == index
                        ? ColorAssets.primaryBlue
                        : ColorAssets.lightBlueGray,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    prices[index],
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      color: selectedPriceIndex == index
                          ? ColorAssets.white
                          : ColorAssets.lightGray,
                    ),
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}

class RatingCheckBoxBuilder extends StatefulWidget {
  const RatingCheckBoxBuilder({Key? key}) : super(key: key);

  @override
  _RatingCheckBoxBuilderState createState() => _RatingCheckBoxBuilderState();
}

class _RatingCheckBoxBuilderState extends State<RatingCheckBoxBuilder> {
  int? selectedRating = 5;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Rating",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 22,
              color: ColorAssets.blackFaded,
            ),
          ),
          buildCheckBox(5, "4.5 and above"),
          buildCheckBox(4, "4.0 - 4.5"),
          buildCheckBox(3, "3.5 - 3.0"),
          buildCheckBox(2, "3.0 - 2.5"),
          buildCheckBox(1, "2.5 - 1.0"),
        ],
      ),
    );
  }

  Widget buildCheckBox(int rating, String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 24,
            width: 24,
            child: Checkbox(
              activeColor: ColorAssets.primaryBlue,
              value: selectedRating == rating,
              onChanged: (value) {
                setState(() {
                  selectedRating = value! ? rating : null;
                });
              },
            ),
          ),
          const SizedBox(width: 20),
          Text(
            label,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 18,
              color: ColorAssets.blackFaded,
            ),
          ),
        ],
      ),
    );
  }
}
