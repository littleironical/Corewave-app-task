import 'package:corewave_app_task/presentation/resources/icons_manager.dart';
import 'package:corewave_app_task/presentation/resources/strings_manager.dart';
import 'package:flutter/material.dart';

class YourCarDetails extends StatelessWidget {
  const YourCarDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _getAppBar(context),
      // body: _getBody(),
    );
  }

  _getAppBar(context) {
    return AppBar(
      leading: const Icon(IconManager.backArrow),
      title: Text(
        StringManager.yourCarDetails,
        style: Theme.of(context).textTheme.labelLarge,  
      ),
    );
  }
}
