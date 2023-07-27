import 'package:carousel_slider/carousel_slider.dart';
import 'package:corewave_app_task/presentation/resources/assets_manager.dart';
import 'package:corewave_app_task/presentation/resources/colors_manager.dart';
import 'package:corewave_app_task/presentation/resources/icons_manager.dart';
import 'package:corewave_app_task/presentation/resources/strings_manager.dart';
import 'package:corewave_app_task/presentation/resources/values_manager.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

class YourCarDetails extends StatefulWidget {
  const YourCarDetails({super.key});

  @override
  State<YourCarDetails> createState() => _YourCarDetailsState();
}

class _YourCarDetailsState extends State<YourCarDetails> {
  final List<String> _yourCarCardsBanners = [
    ImageAssetManager.yourCarCard,
    ImageAssetManager.yourCarCard,
  ];

  int _currentIndex = 0;

  final Map<String, String> _yourCarDetails = {
    'Type Car': 'Sport',
    'Color': 'Black',
    'Steering': 'Manual',
    'Fuel Type': 'Petrol',
  };

  final List<Map<String, String>> _yourCarInsuranceCards = [
    {
      'name': 'Insurance',
      'status': 'Active',
      'expiry_date': '28 Mar, 2025',
      'insurance_company': 'Indian Insurance pvt etc',
      'button_text': 'Renew Now',
    },
    {
      'name': 'PUCC',
      'status': 'Expired',
      'expiry_date': '28 Mar, 2025',
      'insurance_company': 'Indian Insurance pvt etc',
      'button_text': 'Explore Nearby Center',
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _getAppBar(context),
      body: _getYourCarDetailsBody(),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(AppSizeManager.s10),
        child: _getCardButton(StringManager.continueText),
      ),
      // body: _getBody(),
    );
  }

  _getAppBar(context) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(IconManager.backArrow),
        onPressed: () => Navigator.pop(context),
      ),
      title: Text(
        StringManager.yourCarDetails,
        style: Theme.of(context).textTheme.labelLarge,
      ),
    );
  }

  _getYourCarDetailsBody() {
    return SingleChildScrollView(
      child: Column(
        children: [
          _getYourCarCardCarousel(),
          _getSpacing(AppSizeManager.s20),
          _getYourCardDetailsBanner(),
          _getSpacing(AppSizeManager.s20),
          _getYourCarBasicDetails(),
          _getSpacing(AppSizeManager.s20),
          _getDivider(),
          _getInsuranceCards(),
          _getSpacing(AppSizeManager.s20),
        ],
      ),
    );
  }

  _getYourCarCardCarousel() {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
              enableInfiniteScroll: false,
              height: AppSizeManager.s120,
              enlargeCenterPage: true,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentIndex = index;
                });
              }),
          items: _yourCarCardsBanners.map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  child: _getRoundedBanner(ImageAssetManager.yourCarCard),
                );
              },
            );
          }).toList(),
        ),
        DotsIndicator(
          dotsCount: _yourCarCardsBanners.length,
          position: _currentIndex,
        )
      ],
    );
  }

  _getRoundedBanner(String image) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(AppSizeManager.s20)),
      child: Image.asset(image),
    );
  }

  _getYourCardDetailsBanner() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSizeManager.s10),
      child: _getRoundedBanner(ImageAssetManager.yourCarBanner),
    );
  }

  _getSpacing(double height) {
    return SizedBox(
      height: height,
    );
  }

  _getDivider() {
    return Container(
      height: AppSizeManager.s30,
      color: ColorManager.lightGrey,
    );
  }

  _getYourCarBasicDetails() {
    return Padding(
      padding: const EdgeInsets.all(AppSizeManager.s10),
      child: SizedBox(
        height: AppSizeManager.s100,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: AppSizeManager.s4),
              child: Text(
                StringManager.yourCarName,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            Wrap(
              children: [
                _getDetails(StringManager.yourTypeCar,
                    _yourCarDetails['Type Car'].toString()),
                _getDetails(StringManager.yourCarColor,
                    _yourCarDetails['Color'].toString()),
                _getDetails(StringManager.yourCarSteering,
                    _yourCarDetails['Steering'].toString()),
                _getDetails(StringManager.yourCarFuelType,
                    _yourCarDetails['Fuel Type'].toString()),
              ],
            ),
          ],
        ),
      ),
    );
  }

  _getDetails(String property, String value) {
    return SizedBox(
      width: AppSizeManager.s160,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: AppSizeManager.s4),
        child: Row(
          children: [
            Text(
              property,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(width: AppSizeManager.s10),
            Text(
              value,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }

  _getInsuranceCards() {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: _yourCarInsuranceCards.length,
      separatorBuilder: (context, index) => _getDivider(),
      itemBuilder: (context, index) {
        return Container(
          padding: const EdgeInsets.all(AppSizeManager.s20),
          // height: AppSizeManager.s200,
          child: _getCarCard(_yourCarInsuranceCards[index]),
        );
      },
    );
  }

  _getCarCard(Map cardDetails) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _getCardTitle(
          cardDetails['name'],
          cardDetails['status'],
        ),
        _getCardDetails(
          cardDetails['expiry_date'],
          cardDetails['insurance_company'],
        ),
        _getCardButton(cardDetails['button_text']),
      ],
    );
  }

  _getCardTitle(String title, String status) {
    return Row(
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(width: AppSizeManager.s4),
        Container(
          decoration: BoxDecoration(
            color: (status == 'Active') ? ColorManager.green : ColorManager.red,
            borderRadius: const BorderRadius.all(
              Radius.circular(AppSizeManager.s20),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSizeManager.s10),
            child: Text(status),
          ),
        ),
      ],
    );
  }

  _getCardDetails(String expiryDate, String insuranceCompany) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSizeManager.s10),
      child: Wrap(
        children: [
          _getInsuranceDetails(
            StringManager.insuranceExpiryDate,
            expiryDate,
          ),
          _getInsuranceDetails(
            StringManager.insuranceCompanyName,
            insuranceCompany,
          ),
        ],
      ),
    );
  }

  _getInsuranceDetails(String key, String value) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: AppSizeManager.s4),
        child: Wrap(
          children: [
            Text(
              key,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(width: AppSizeManager.s10),
            Text(
              value,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }

  _getCardButton(String text) {
    return Container(
      height: AppSizeManager.s40,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(AppSizeManager.s10)),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            ColorManager.primaryYellow,
            ColorManager.darkYellow,
          ],
        ),
      ),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent),
        child: Text(
          text,
          style: Theme.of(context).textTheme.displayMedium,
        ),
      ),
    );
  }
}
