import 'dart:js_interop';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home_care/common/colors/app_colors.dart';
import 'package:home_care/common/constants/dummy_data.dart';
import 'package:home_care/features/search/widget/custom_search_card.dart';
import 'package:iconly/iconly.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _controller = TextEditingController();
  List<Map<String, dynamic>> filterList = [];

  @override
  void initState() {
    filterList = DummyData.data_list;
    super.initState();
    _controller.addListener(() {
      filterItem(_controller.text);
    });
  }

  void filterItem(String query) {
    setState(() {
      if (query.isEmpty) {
        filterList = DummyData.data_list;
      } else {
        filterList = DummyData.data_list
            .where((element) => element['name']
                .toString()
                .toLowerCase()
                .contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFF0),
      body: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.paddingOf(context).top + 10,
              ),
              Text(
                "Services",
                style: GoogleFonts.urbanist(
                    fontSize: 32.sp, fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.w),
                child: Hero(
                  tag: "hero",
                  child: Material(
                    borderRadius: BorderRadius.circular(40),
                    child: TextFormField(
                      controller: _controller,
                      decoration: InputDecoration(
                        fillColor: AppColors.primaryGreen,
                        hintText: "Search Services",
                        prefixIcon: const Icon(IconlyLight.search),
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 22, vertical: 22),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(60.h)),
                            borderSide: BorderSide(
                                color: AppColors.primaryGreen,
                                style: BorderStyle.solid,
                                width: 2)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(60.h)),
                            borderSide: BorderSide(
                                color: AppColors.primaryGreen,
                                style: BorderStyle.solid,
                                width: 2)),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: GridView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: filterList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10),
              itemBuilder: (context, index) {
                var data = filterList[index];
                bool flag = index % 2 == 0;
                return CustomSearchCard(
                  icon: data['icon'],
                  name: data['name'],
                  isLeft: !flag,
                  onPressed: () {
                    setState(() {
                      _controller.text = data['name'];
                    });
                  },
                );
              },
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
