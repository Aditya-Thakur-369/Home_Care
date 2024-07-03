import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home_care/common/colors/app_colors.dart';
import 'package:home_care/common/textfield/input_text_field.dart';
import 'package:home_care/common/textstyle/app_textStyles.dart';
import 'package:home_care/features/home/widget/custom_cards.dart';
import 'package:home_care/features/search/widget/custom_search_card.dart';
import 'package:iconly/iconly.dart';
import 'package:iconsax/iconsax.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _controller = TextEditingController();
  YoutubePlayerController youtubeController = YoutubePlayerController(
    initialVideoId: 'v=a8iYp3zgUpg',
    flags: const YoutubePlayerFlags(
      autoPlay: true,
      mute: true,
      enableCaption: false,
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightGreen,
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
                    child: TextFormField(
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
                    CustomSearchCard(
                      icon: Iconsax.building_4,
                      name: 'Aditions & Remondels',
                    ),
                    CustomSearchCard(
                      icon: Icons.cleaning_services_rounded,
                      name: 'Cleaning',
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
                    CustomSearchCard(
                      icon: Icons.thermostat_rounded,
                      name: 'Heating',
                    ),
                    CustomSearchCard(
                      icon: Icons.water_drop_rounded,
                      name: 'Plumbing',
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
                    CustomSearchCard(
                      icon: Icons.format_paint_outlined,
                      name: 'Painting',
                    ),
                    CustomSearchCard(
                      icon: Icons.electric_bolt_sharp,
                      name: 'Electrical',
                    ),
                  ],
                )
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
              height: 200,
              width: 300,
              child: YoutubePlayer(
                controller: youtubeController,
              ))
        ],
      ),
    );
  }
}
