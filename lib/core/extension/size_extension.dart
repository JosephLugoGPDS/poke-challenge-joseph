import 'package:app/core/util/screen_util.dart';

///define size for screen [(width, height and sp for fonts)]
extension SizeExtension on num {
  double get w => ScreenUtil().setWidth(this) as double;

  double get h => ScreenUtil().setHeight(this) as double;

  double get sp => ScreenUtil().setSp(this) as double;
}
