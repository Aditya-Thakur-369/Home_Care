import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home_care/common/colors/app_colors.dart';
import 'package:home_care/common/textstyle/app_textStyles.dart';
import 'package:home_care/features/home/widget/custom_cards.dart';
import 'package:home_care/features/search/search_screen.dart';
import 'package:home_care/router/routers.dart';
import 'package:iconly/iconly.dart';
import 'package:iconsax/iconsax.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: ScreenUtil().screenHeight * 0.3,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40.h),
                  bottomRight: Radius.circular(40.h),
                ),
                color: AppColors.primaryGreen),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: MediaQuery.paddingOf(context).top + 10,
                ),
                Text(
                  "Helio, Lindsey!",
                  style: AppTextStyle.smalltext,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Boston, 0208",
                      style: AppTextStyle.largeboldtext,
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    const Icon(
                      IconlyBroken.location,
                      size: 30,
                      color: Colors.greenAccent,
                    ),
                  ],
                ),
                SizedBox(
                  height: 30.h,
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 18.w, vertical: 8.w),
                  child: GestureDetector(
                    onTap: () {
                      // Navigator.push(
                      //     context,
                      //     CupertinoPageRoute(
                      //       builder: (context) => const SearchScreen(),
                      //     ));
                      context.push(Routes.searchscreen.path);
                    },
                    child: Hero(
                      tag: "hero",
                      child: Container(
                        height: ScreenUtil().screenHeight * 0.08,
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(60.h)),
                            color: Colors.white),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 8.w, horizontal: 12.w),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                IconlyBroken.search,
                                size: 30,
                                color: Colors.grey.shade600,
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              Text(
                                "What service are you looking for ?",
                                style: GoogleFonts.ubuntu(
                                    fontSize: 18.sp,
                                    color: Colors.grey.shade600),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CustomCardsView(
                      icon: Iconsax.building_4,
                      name: 'Aditions & Remondels',
                    ),
                    CustomCardsView(
                      icon: Icons.cleaning_services_rounded,
                      name: 'Cleaning',
                    ),
                    CustomCardsView(
                      icon: Icons.format_paint_outlined,
                      name: 'Painting',
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CustomCardsView(
                      icon: Icons.thermostat_rounded,
                      name: 'Heating',
                    ),
                    CustomCardsView(
                      icon: Icons.water_drop_rounded,
                      name: 'Plumbing',
                    ),
                    CustomCardsView(
                      icon: Icons.electric_bolt_sharp,
                      name: 'Electrical',
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                Container(
                  clipBehavior: Clip.antiAlias,
                  height: ScreenUtil().screenHeight * 0.2,
                  width: ScreenUtil().screenWidth,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(30.h)),
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: Image.asset(
                          "assets/images/1.jpeg",
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        top: 10,
                        left: 20,
                        child: Text(
                          "Home Care ",
                          style: GoogleFonts.urbanist(
                              fontSize: 40.sp,
                              color: AppColors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Positioned(
                        top: 60,
                        left: 20,
                        child: Text(
                          "Scheduler",
                          style: GoogleFonts.urbanist(
                              fontSize: 40.sp,
                              color: AppColors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Positioned(
                          bottom: 15,
                          left: 20,
                          child: IconButton.filled(
                            onPressed: () {},
                            icon: const Icon(
                              IconlyLight.arrow_right,
                            ),
                            style: ButtonStyle(
                                backgroundColor:
                                    WidgetStatePropertyAll(AppColors.orange),
                                iconSize: const WidgetStatePropertyAll(30)),
                          ))
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
