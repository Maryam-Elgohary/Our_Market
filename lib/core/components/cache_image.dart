import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:our_market/core/components/custom_circle_pro_indicator.dart';

class CacheImage extends StatelessWidget {
  const CacheImage({
    super.key,
    required this.url,
  });

  final String url;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      placeholder: (context, url) =>
          const SizedBox(height: 200, child: CustomCircleProIndicator()),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
