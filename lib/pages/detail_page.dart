import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/cubit/app_cubit_states.dart';
import 'package:travel_app/cubit/app_cubits.dart';
import 'package:travel_app/misc/colors.dart';
import 'package:travel_app/widgets/app_buttons.dart';
import 'package:travel_app/widgets/app_large_text.dart';
import 'package:travel_app/widgets/app_text.dart';
import 'package:travel_app/widgets/responsive_button.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int gottenStars = 4;
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubits, CubitStates>(
      builder: (context, state) {
        DetailState detail = state as DetailState;
        return Scaffold(
          body: Container(
            width: double.maxFinite,
            height: double.maxFinite,
            child: Stack(
              children: [
                Positioned(
                  left: 0,
                  right: 0,
                  child: Container(
                    width: double.maxFinite,
                    height: 350,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                            "http://mark.bslmeiyu.com/uploads/${detail.places.img}"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 20,
                  top: 50,
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          BlocProvider.of<AppCubits>(context).goHome();
                        },
                        icon: Icon(
                          Icons.menu,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
                Positioned(
                  top: 320,
                  child: Container(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 30),
                    width: MediaQuery.of(context).size.width,
                    height: 700,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppLargeText(
                                text: detail.places.name,
                                color: Colors.black.withOpacity(0.8)),
                            AppLargeText(
                              text: "\$${detail.places.price.toString()}",
                              color: AppColors.mainColor,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Icon(Icons.location_on, color: AppColors.mainColor),
                            const SizedBox(width: 5),
                            AppText(
                              text: detail.places.location,
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Wrap(
                              children: List.generate(
                                5,
                                (index) {
                                  return Icon(
                                    Icons.star,
                                    color: index < detail.places.stars
                                        ? AppColors.starColor
                                        : AppColors.textColor2,
                                  );
                                },
                              ),
                            ),
                            const SizedBox(width: 10),
                            AppText(
                              text: "(${detail.places.stars.toString()}.0)",
                              color: AppColors.textColor2,
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppLargeText(
                              text: "People",
                              color: Colors.black.withOpacity(0.8),
                              size: 20,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            AppText(
                              text: "Number of people in your group",
                              color: AppColors.mainTextColor,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Wrap(
                              children: List.generate(5, (index) {
                                return InkWell(
                                  onTap: () {
                                    setState(() {
                                      selectedIndex = index;
                                    });
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.only(right: 10),
                                    child: AppButtons(
                                      color: selectedIndex == index
                                          ? Colors.white
                                          : Colors.black,
                                      backgroundColor: selectedIndex == index
                                          ? Colors.black
                                          : AppColors.buttonBackground,
                                      size: 50,
                                      borderColor: selectedIndex == index
                                          ? Colors.black
                                          : AppColors.buttonBackground,
                                      text: (index + 1).toString(),
                                      isIcon: false,
                                    ),
                                  ),
                                );
                              }),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            AppLargeText(
                              text: "Description",
                              color: Colors.black.withOpacity(0.8),
                              size: 20,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            AppText(
                              text: detail.places.description,
                              color: AppColors.mainTextColor,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 20,
                  left: 20,
                  right: 20,
                  child: Row(
                    children: [
                      AppButtons(
                        color: AppColors.textColor2,
                        backgroundColor: Colors.white,
                        size: 60,
                        borderColor: AppColors.textColor2,
                        isIcon: true,
                        icon: Icons.favorite_border,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      ResponsiveButton(
                        isResponsive: true,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
