// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:home_care/common/colors/app_colors.dart';
import 'package:home_care/router/routers.dart';
import 'package:iconly/iconly.dart';
import 'package:iconsax/iconsax.dart';

class Navigation extends StatelessWidget {
  const Navigation({
    super.key,
    required this.selectedIndex,
    required this.child,
  });
  final int selectedIndex;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: selectedIndex == 0,
      onPopInvoked: (didPop) {
        if (selectedIndex != 0) {
          context.go(Routes.homescreen.path);
        }
      },
      child: Stack(
        children: [
          child,
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 80,
              decoration: BoxDecoration(
                  color: AppColors.primaryGreen,
                  borderRadius: BorderRadius.all(Radius.circular(60.h))),
              padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 3),
              margin: const EdgeInsets.only(bottom: 28),
              child: SizedBox(
                height: 50,
                width: ScreenUtil().screenWidth * 0.7,
                child: CustomNavBar(
                  colors: Colors.red,
                  selectedColor: Colors.white,
                  icons: [
                    selectedIndex == 0 ? IconlyLight.home : IconlyLight.home,
                    selectedIndex == 1
                        ? Iconsax.document_filter
                        : Iconsax.document_filter,
                    selectedIndex == 2
                        ? IconlyLight.calendar
                        : IconlyLight.calendar,
                    selectedIndex == 3
                        ? IconlyLight.profile
                        : IconlyLight.profile,
                  ],
                  currentIndex: selectedIndex,
                  onItemTap: (index) => context.go(_indexToTab(index)),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

String _indexToTab(int index) {
  switch (index) {
    case 0:
      return Routes.homescreen.path;
    case 1:
      return Routes.searchscreen.path;
    case 2:
      return Routes.schedulescreen.path;
    case 3:
      return Routes.profilescreen.path;
    default:
      return Routes.homescreen.path;
  }
}

class CustomNavBar extends StatefulWidget {
  const CustomNavBar({
    super.key,
    required this.icons,
    required this.currentIndex,
    required this.onItemTap,
    required this.selectedColor,
    required this.colors,
  });

  final List<IconData> icons;
  final int currentIndex;
  final void Function(int index) onItemTap;
  final Color selectedColor;
  final Color colors;

  @override
  State<CustomNavBar> createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (_, constraints) {
      double lineSize = constraints.maxWidth / widget.icons.length;
      return Stack(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: AnimatedContainer(
              curve: Curves.easeInCirc,
              duration: const Duration(milliseconds: 100),
              margin: EdgeInsets.only(left: widget.currentIndex * lineSize),
              height: 80,
              width: lineSize,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: widget.icons.map(
                (e) {
                  int index = widget.icons.indexOf(e);
                  return Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: (lineSize - 48) / 2,
                    ),
                    child: SizedBox(
                      width: 48,
                      child: MaterialButton(
                        animationDuration: const Duration(milliseconds: 2000),
                        elevation: 0,
                        minWidth: 10,
                        height: 80,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100)),
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 8),
                        onPressed: widget.currentIndex == index
                            ? null
                            : () {
                                widget.onItemTap(index);
                              },
                        child: Icon(
                          e,
                          color: widget.currentIndex == index
                              ? AppColors.primaryGreen
                              : Colors.grey,
                          size: 30,
                        ),
                      ),
                    ),
                  );
                },
              ).toList(),
            ),
          ),
        ],
      );
    });
  }
}
