import 'package:carousel_slider/carousel_slider.dart';
import 'package:corewave_app_task/presentation/resources/assets_manager.dart';
import 'package:corewave_app_task/presentation/resources/colors_manager.dart';
import 'package:corewave_app_task/presentation/resources/icons_manager.dart';
import 'package:corewave_app_task/presentation/resources/routes_manager.dart';
import 'package:corewave_app_task/presentation/resources/strings_manager.dart';
import 'package:corewave_app_task/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> _weekdays = ['Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa', 'Su'];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _getTextSection(
            StringManager.dailyServiceAcvtivity['basicText'].toString(),
            StringManager.dailyServiceAcvtivity['gradientText'].toString(),
          ),
          _getWeekdaysList(StringManager.dailyServiceAcvtivity),
          _getSpacing(AppSizeManager.s20),
          _getMainBanner(), //* DIRECTS TO SECOND PAGE - YOUR CARD DETAILS
          _getSpacing(AppSizeManager.s20),
          _getAddYourCarText(),
          _getAddYourCar(),
          _getSpacing(AppSizeManager.s20),
          _getTextSection(
            StringManager.upcomignService['basicText'].toString(),
            StringManager.upcomignService['gradientText'].toString(),
          ),
          _getUpcomingService(),
          _getSpacing(AppSizeManager.s20),
          _getChooseTheRightServiceText(),
          _getChooseTheRightService(),
          _getSpacing(AppSizeManager.s20),
          _getRecommendedCarAccessoriesText(),
          _getRecommendedCarAccesories(),
          _getSpacing(AppSizeManager.s20),
          _getTextSection(
            StringManager.happyCustomers['basicText'].toString(),
            StringManager.happyCustomers['gradientText'].toString(),
          ),
          _getHappyCustomersCarousel(),
          _getSpacing(AppSizeManager.s50),
        ],
      ),
    );
  }

  _getSpacing(double height) {
    return SizedBox(
      height: height,
    );
  }

  _getTextSection(String basicText, String gradientText) {
    return Padding(
      padding: const EdgeInsets.all(AppSizeManager.s10),
      child: Row(
        children: [
          RichText(
            text: TextSpan(children: [
              TextSpan(
                text: '$basicText ',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              WidgetSpan(
                child: GradientText(
                  gradientText,
                  style: Theme.of(context).textTheme.titleLarge,
                  colors: const [
                    ColorManager.primaryYellow,
                    ColorManager.darkYellow,
                  ],
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }

  _getWeekdaysList(Map title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSizeManager.s8),
      child: SizedBox(
        height: AppSizeManager.s70,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: _weekdays.length,
          itemBuilder: (context, index) => InkWell(
            splashColor: ColorManager.primaryYellow,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSizeManager.s18,
                vertical: AppSizeManager.s14,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    _weekdays[index],
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  Text((index + 3).toString()),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _getMainBanner() {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, RouteManager.yourCarDetails),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSizeManager.s10),
        child: _getRoundedBanner(ImageAssetManager.mainBanner),
      ),
    );
  }

  _getRoundedBanner(String image) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(AppSizeManager.s20)),
      child: Image.asset(image),
    );
  }

  _getAddYourCarText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _getTextSection(StringManager.addYourCar['basicText'].toString(),
            StringManager.addYourCar['gradientText'].toString()),
        _getSeeAllText(),
      ],
    );
  }

  _getAddYourCar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSizeManager.s10),
      child: SizedBox(
        height: AppSizeManager.s140,
        child: Row(
          children: [
            _getRoundedBanner(ImageAssetManager.addYourCarBanner),
            const SizedBox(width: AppSizeManager.s10),
            Container(
              decoration: const BoxDecoration(
                borderRadius:
                    BorderRadius.all(Radius.circular(AppSizeManager.s20)),
                color: ColorManager.lightGrey,
              ),
              child: Padding(
                padding: const EdgeInsets.all(AppSizeManager.s10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      IconManager.add,
                      color: ColorManager.darkYellow,
                    ),
                    Text(
                      StringManager.addNewCar,
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _getUpcomingService() {
    return CarouselSlider(
      options: CarouselOptions(
        enableInfiniteScroll: false,
        height: AppSizeManager.s140,
        enlargeCenterPage: true,
      ),
      items: [1, 2].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              child: _getRoundedBanner(ImageAssetManager.upcomingService),
            );
          },
        );
      }).toList(),
    );
  }

  _getChooseTheRightServiceText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _getTextSection(
            StringManager.chooseYourRightService['basicText'].toString(),
            StringManager.chooseYourRightService['gradientText'].toString()),
        _getSeeAllText(),
      ],
    );
  }

  _getChooseTheRightService() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSizeManager.s10),
      child: Wrap(
        spacing: AppSizeManager.s4,
        runSpacing: AppSizeManager.s4,
        runAlignment: WrapAlignment.spaceBetween,
        alignment: WrapAlignment.start,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          _services(ImageAssetManager.serviceIcon, StringManager.service),
          _services(ImageAssetManager.serviceIcon, StringManager.service),
          _services(ImageAssetManager.serviceIcon, StringManager.service),
          _services(ImageAssetManager.serviceIcon, StringManager.service),
          _services(ImageAssetManager.serviceIcon, StringManager.service),
          _services(ImageAssetManager.serviceIcon, StringManager.service),
          _services(ImageAssetManager.serviceIcon, StringManager.service),
          _services(ImageAssetManager.serviceIcon, StringManager.service),
          _services(ImageAssetManager.serviceIcon, StringManager.service),
          _services(ImageAssetManager.serviceIcon, StringManager.service),
          _services(ImageAssetManager.serviceIcon, StringManager.service),
          _services(ImageAssetManager.serviceIcon, StringManager.service),
        ],
      ),
    );
  }

  _services(String icon, String service) {
    return Container(
      height: AppSizeManager.s90,
      width: AppSizeManager.s90,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(AppSizeManager.s10)),
        color: ColorManager.white,
        boxShadow: [
          BoxShadow(
            blurRadius: AppSizeManager.s10,
            color: ColorManager.lightGrey,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppSizeManager.s10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // const Icon(
            //   IconManager.add,
            //   color: ColorManager.darkYellow,
            // ),
            SizedBox(
              height: AppSizeManager.s40,
              child: Image.asset(icon),
            ),
            Text(
              service,
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ],
        ),
      ),
    );
  }

  _getRecommendedCarAccessoriesText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _getTextSection(
            StringManager.recommendedCarAccessories['basicText'].toString(),
            StringManager.recommendedCarAccessories['gradientText'].toString()),
        _getSeeAllText(),
      ],
    );
  }

  _getRecommendedCarAccesories() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSizeManager.s10),
      child: SizedBox(
        height: AppSizeManager.s180,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            _carAccessries(),
            const SizedBox(width: AppSizeManager.s10),
            _carAccessries(),
          ],
        ),
      ),
    );
  }

  _carAccessries() {
    return Container(
      height: AppSizeManager.s200,
      width: AppSizeManager.s180,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(AppSizeManager.s10)),
        color: ColorManager.white,
        boxShadow: [
          BoxShadow(
            blurRadius: AppSizeManager.s10,
            color: ColorManager.lightGrey,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppSizeManager.s10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 3,
              child: Image.asset(ImageAssetManager.carAccessories),
            ),
            Expanded(
              flex: 1,
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              StringManager.accessoriesPrice,
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            Container(
                              decoration: const BoxDecoration(
                                color: ColorManager.primaryYellow,
                                borderRadius: BorderRadius.all(
                                    Radius.circular(AppSizeManager.s4)),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: AppSizeManager.s4),
                                child: Row(
                                  children: [
                                    Icon(
                                      IconManager.star,
                                      size: AppSizeManager.s20,
                                    ),
                                    Text(StringManager.rating),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Text(
                          StringManager.productName,
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: AppSizeManager.s40,
                      width: AppSizeManager.s40,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                            Radius.circular(AppSizeManager.s100)),
                        color: ColorManager.primaryYellow,
                      ),
                      child: const Icon(
                        IconManager.add,
                        color: ColorManager.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _getSeeAllText() {
    return Padding(
      padding: const EdgeInsets.all(AppSizeManager.s10),
      child: InkWell(
        child: Text(
          StringManager.seeAll,
          style: Theme.of(context).textTheme.labelSmall,
        ),
      ),
    );
  }

  _getHappyCustomersCarousel() {
    return CarouselSlider(
      options: CarouselOptions(
        enlargeCenterPage: true,
        height: AppSizeManager.s240,
      ),
      items: [1, 2].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              child: _customerReviewCard(),
            );
          },
        );
      }).toList(),
    );
  }

  _customerReviewCard() {
    return Container(
      padding: const EdgeInsets.all(AppSizeManager.s20),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(AppSizeManager.s10)),
        color: ColorManager.white,
        boxShadow: [
          BoxShadow(
            blurRadius: AppSizeManager.s10,
            color: ColorManager.lightGrey,
          ),
        ],
      ),
      child: Column(
        children: [
          Expanded(
            flex: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _getRoundedBanner(ImageAssetManager.circleAvatar),
                const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(StringManager.customerName),
                    Text(StringManager.customerProfile),
                  ],
                ),
                const Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Icon(IconManager.star),
                    Icon(IconManager.star),
                    Icon(IconManager.star),
                    Icon(IconManager.star),
                    Icon(IconManager.star),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              StringManager.customerReviewTitle,
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ),
          const Expanded(
            flex: 5,
            child: Text(
              StringManager.customerReviewBody,
            ),
          ),
        ],
      ),
    );
  }
}
