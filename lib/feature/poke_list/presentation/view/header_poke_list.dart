import 'package:flutter/material.dart';
import 'package:app/gen/assets.gen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:app/core/extension/size_extension.dart';

class HeaderPokeList extends StatelessWidget {
  const HeaderPokeList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SvgPicture.asset(
          Assets.icons.drawer,
          width: 27.w,
          height: 18.w,
        ),
        CircleAvatar(
          radius: 19.w,
          backgroundImage: AssetImage(Assets.images.avatar.path),
        ),
      ],
    );
  }
}
