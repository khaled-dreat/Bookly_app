import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../core/utils/dime/app_dime.dart';
import '../../core/utils/language/app_lang_key.dart';
import '../../core/widgets/loading/app_loading.dart';

class PageWebView extends StatefulWidget {
  const PageWebView({super.key, required this.url, this.title});
  final String url;
  final String? title;

  @override
  State<PageWebView> createState() => _PageWebViewState();
}

class _PageWebViewState extends State<PageWebView> {
  late Uri uri;
  late WebViewController webViewController;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    uri = Uri.parse(widget.url);
    webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(widget.url));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title ?? AppLangKey.terms.tr())),
      body: SafeArea(
        child: Stack(
          // alignment: AlignmentDirectional.center,
          children: [
            WebViewWidget(
              controller: webViewController,

              // initialUrl: widget.url,
              // javascriptMode: JavaScriptMode.unrestricted,
              // backgroundColor: AppTheme.themeColor(context),
              // onPageFinished: (url) {
              //   isLoading = false;
              //   setState(() {});
              // },
            ),
            //if (isLoading)
            //  Center(
            //    child:
            //        AppLoading(loading: TypeLoading.webview, size: AppDime.xxl),
            //  ),
          ],
        ),
      ),
    );
  }
}
