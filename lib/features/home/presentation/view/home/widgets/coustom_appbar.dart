import 'package:clean_arch_bookly_app/core/api/api_service.dart';
import 'package:clean_arch_bookly_app/features/home/presentation/view/home/widgets/connectitivy_icon.dart';
import 'package:clean_arch_bookly_app/features/home/presentation/view/home/widgets/srh_icon.dart';
import 'package:flutter/material.dart';

class CoustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CoustomAppBar({super.key});

  @override
  State<CoustomAppBar> createState() => _CoustomAppBarState();

  @override
  Size get preferredSize =>
      Size.fromHeight(AppBar().preferredSize.height * 0.9);
}

class _CoustomAppBarState extends State<CoustomAppBar> {
  @override
  void initState() {
    super.initState();
    ApiService.checkConnectitivy();
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: const [
        ConnectitivyIcon(),
        SrhIcon(),
      ],
    );
  }
}
