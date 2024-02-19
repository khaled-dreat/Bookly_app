import 'package:clean_arch_bookly_app/core/widgets/loading/app_loading.dart';
import 'package:flutter/material.dart';

import '../../utils/constant/app_images.dart';

class ImageProfile extends StatelessWidget {
  const ImageProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Image(
        image: const AssetImage(AppImages.profileImg),
        errorBuilder: (context, error, stackTrace) => const Image(
          image: AssetImage(AppImages.profileNew),
        ),
        loadingBuilder: (context, child, loadingProgress) {
          return loadingProgress == null
              ? child
              : const Center(
                  child: AppLoading(loading: TypeLoading.profile),
                );
        },
      ),
    );
  }
}
