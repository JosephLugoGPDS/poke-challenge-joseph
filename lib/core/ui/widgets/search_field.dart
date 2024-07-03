import 'package:app/core/extension/context.dart';
import 'package:app/core/extension/size_extension.dart';
import 'package:app/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchField extends StatelessWidget {
  const SearchField(
    this.hint, {
    super.key,
    required this.searchController,
    this.searchTap,
    this.switchIcons,
    this.cleanTap,
    this.onTap,
    this.isOpen = false,
    this.height,
  });

  final String hint;
  final TextEditingController searchController;
  final void Function()? searchTap;
  final void Function()? cleanTap;
  final void Function()? switchIcons;
  final void Function()? onTap;
  final bool isOpen;
  final double? height;

  static const gestureDetectorSearchTap = Key('gestureDetectorSearchTap');
  static const onTapFormFieldSearchTap = Key('onTapFormFieldSearchTap');
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 396.w,
      height: height,
      child: Material(
        shape: const StadiumBorder(),
        color: context.theme.colorScheme.secondary,
        child: TextFormField(
          key: onTapFormFieldSearchTap,
          onTap: onTap,
          style: context.primaryTextTheme.bodyMedium,
          controller: searchController,
          decoration: InputDecoration(
            border: InputBorder.none,
            alignLabelWithHint: true,
            contentPadding: EdgeInsets.symmetric(vertical: 8.h),
            fillColor: Colors.transparent,
            icon: GestureDetector(
              key: gestureDetectorSearchTap,
              onTap: searchTap,
              child: Padding(
                padding: EdgeInsets.only(left: 20.w),
                child: SvgPicture.asset(
                  Assets.icons.search,
                  height: 18.h,
                  width: 18.h,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            isDense: true,
            hintText: hint,
            hintStyle: context.primaryTextTheme.bodyLarge,
          ),
          onEditingComplete: searchTap,
          onFieldSubmitted: (String value) {},
        ),
      ),
    );
  }
}
