import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../utils/app-constants.dart';
import '../utils/color_resources.dart';

class RatingScreen extends StatefulWidget {
  const RatingScreen({super.key});

  @override
  State<RatingScreen> createState() => _RatingScreenState();
}

class _RatingScreenState extends State<RatingScreen> {
  int? selectedValue = 1;
  double rating = 0;
  @override
  Widget build(BuildContext context) {
    final isTablet = MediaQuery.of(context).size.width > 600;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: isTablet
            ? AppConstants.screenWidth * 0.04
            : AppConstants.screenWidth * 0.03,
        vertical: isTablet
            ? AppConstants.screenHeight * 0.04
            : AppConstants.screenHeight * 0.02,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Your Average Rating is 4.0',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(
            height: 8,
          ),
          RatingBar.builder(
            initialRating: rating,
            minRating: 1,
            direction: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (context, index) {
              return const Icon(
                Icons.star_outlined,
                color: ColorResources.appButtonBGColor,
              );
            },
            onRatingUpdate: (value) {
              setState(() {
                rating = value;
              });
            },
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            'Review Title',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(
            height: 5,
          ),
          TextField(
            decoration: InputDecoration(
              hintText: 'Awesome Product',
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: ColorResources.dividerColor,
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: const BorderSide(
                  color: ColorResources.borderColor,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Product Review',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(
            height: 5,
          ),
          TextField(
            maxLines: 2,
            decoration: InputDecoration(
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: ColorResources.dividerColor,
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: const BorderSide(
                  color: ColorResources.borderColor,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Would you recommend this product to a friend?',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Transform.scale(
                scale: 1.6,
                child: Radio<int>(
                  fillColor: WidgetStateProperty.resolveWith<Color>((states) {
                    if (states.contains(WidgetState.selected)) {
                      return ColorResources.appButtonBGColor; // Selected color
                    }
                    return ColorResources.dividerColor; // Default color
                  }),
                  visualDensity: VisualDensity.compact,
                  value: 1,
                  groupValue: selectedValue,
                  onChanged: (value) {
                    setState(() {
                      selectedValue = value;
                    });
                  },
                ),
              ),
              Text(
                'Yes',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(
                width: 10,
              ),
              Transform.scale(
                scale: 1.6,
                child: Radio<int>(
                  fillColor: WidgetStateProperty.resolveWith<Color>((states) {
                    if (states.contains(WidgetState.selected)) {
                      return ColorResources.appButtonBGColor; // Selected color
                    }
                    return ColorResources.dividerColor; // Default color
                  }),
                  value: 2,
                  groupValue: selectedValue,
                  onChanged: (value) {
                    setState(() {
                      selectedValue = value;
                    });
                  },
                ),
              ),
              Text(
                'No',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
