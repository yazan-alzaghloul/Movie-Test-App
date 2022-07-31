import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:photo_view/photo_view.dart';
import '../../shared/widgets/toaster_widget.dart';
import 'image_viewer_store.dart';

class ImageViewerPage extends StatefulWidget {
  const ImageViewerPage({Key? key}) : super(key: key);

  @override
  _ImageViewerPageState createState() => _ImageViewerPageState();
}

class _ImageViewerPageState extends State<ImageViewerPage> {
  final store = Modular.get<ImageViewerStore>();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      try {
        final arguments = ModalRoute.of(context)!.settings.arguments as Map;
        if (arguments["image_url"] != null) {
          store.setMedia(arguments["image_url"]);
        }
      } catch (e) {
        Toaster.error(message: e.toString());
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    Modular.dispose<ImageViewerStore>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(builder: (BuildContext context) {
        if (store.mediaURL != null) {
          return Stack(
            children: [
              PhotoView(
                imageProvider: NetworkImage(
                  store.mediaURL!,
                ),
              ),
              Align(
                alignment: const Alignment(-0.9, -0.85),
                child: IconButton(
                    onPressed: () {
                      Modular.to.pop();
                    },
                    icon: const Icon(
                      Icons.close,
                      color: Colors.white,
                    )),
              ),
            ],
          );
        } else {
          return Container();
        }
      }),
    );
  }
}
