import 'package:app/core/extension/context.dart';
import 'package:app/core/extension/size_extension.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter/material.dart';

class CardGridLoader extends StatelessWidget {
  const CardGridLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.colorScheme.secondary,
        borderRadius: BorderRadius.circular(10),
      ),
      width: 188.w,
      height: 177.h,
      child: Shimmer.fromColors(
        baseColor: context.colorScheme.primaryContainer,
        highlightColor: context.colorScheme.secondaryContainer,
        child: Stack(
          children: [
            Positioned(
              top: 34.h,
              left: 26.w,
              right: 19.w,
              child: Container(
                width: 113.w,
                height: 103.h,
                color: context.colorScheme.primaryContainer,
              ),
            ),
            Positioned(
              top: 12.w,
              left: 12.w,
              child: Container(
                width: 20.w,
                height: 20.w,
                color: context.colorScheme.secondaryContainer,
              ),
            ),
            Positioned(
              bottom: 12.5.w,
              left: 12.w,
              right: 12.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    color: context.colorScheme.surface,
                    width: 100.w,
                    height: 16.sp,
                  ),
                  Container(
                    color: context.colorScheme.surface,
                    width: 20.w,
                    height: 20.w,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
