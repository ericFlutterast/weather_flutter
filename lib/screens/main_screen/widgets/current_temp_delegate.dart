import 'package:flutter/material.dart';

import '../../../bloc/weather_bloc.dart';
import 'degrees.dart';
import 'mixin_content_opacity.dart';

class CurrentTempDelegate extends SliverPersistentHeaderDelegate with ContentOpacity {
  final WeatherState state;
  double maxExtents;
  double minExtants;

  CurrentTempDelegate({
    required this.maxExtents,
    required this.minExtants,
    required this.state,
  });

  @override
  double get maxExtent => maxExtents;

  @override
  double get minExtent => minExtants;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    Color contentColor =
        const Color.fromRGBO(254, 254, 252, 1).withOpacity(contentOpacity(shrinkOffset, maxExtent));
    return DegreesWidget(
      currentTemp: state.currentTemp.toString(),
      size: maxExtents,
      color: Colors.white,
      offset: const Offset(0, 23),
    );
  }
}
