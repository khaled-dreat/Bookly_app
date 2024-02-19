/*
class ImageCustom extends StatelessWidget {
  const ImageCustom({super.key, this.image, this.width, this.height});
  final String? image;
  final double? width;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return Image(
      image: NetworkImage(image ?? AppImages.testImageNetwork),
      fit: BoxFit.fill,
      width: width,
      height: height,
      errorBuilder: (context, error, stackTrace) => Image(
        image: const AssetImage(AppImages.notFoundImage),
        fit: BoxFit.fill,
        width: width,
        height: height,
      ),
      loadingBuilder: (context, child, loadingProgress) {
        return loadingProgress == null
            ? child
            : SizedBox(
                width: width,
                child: const Center(
                  child: AppLoading(),
                ),
              );
      },
    );
  }
}
*/