import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:movie_test_app/app/shared/widgets/movie_network_image.dart';

import '../../shared/models/popular_people_model.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  late final Result person;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      try {
        final arguments = ModalRoute.of(context)!.settings.arguments as Map;
        setState(() {
          person = arguments["item"];
        });
      } catch (e) {}
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          'Details',
          style: TextStyle(),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 250,
              decoration: const BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40.0),
                    bottomRight: Radius.circular(40.0)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ListTile(
                    title: const Text(
                      "Name",
                      style: TextStyle(color: Colors.white),
                    ),
                    subtitle: Text(person.name ?? "",
                        style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 24)),
                  ),
                  ListTile(
                    title: const Text("Popularity",
                        style: TextStyle(color: Colors.white)),
                    subtitle: Text(person.popularity.toString() ?? "",
                        style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 24)),
                  ),
                  ListTile(
                    title: const Text("Department",
                        style: TextStyle(color: Colors.white)),
                    subtitle: Text(person.knownForDepartment ?? "",
                        style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 24)),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: GridView.builder(
                  padding: const EdgeInsets.all(0),
                  physics: const AlwaysScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 8),
                  itemBuilder: (_, index) {
                    return GestureDetector(
                      onTap: () {
                        Modular.to.pushNamed("/image_viewer", arguments: {
                          // "image_url":
                          //     "${person.knownFor?[index].backdropPath}",
                          "image_url":
                              "https://cdn.dribbble.com/users/4009983/screenshots/16047199/juraganmaterial-08_4x.jpg",
                        });
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: const MovieNetworkImage(
                            width: double.infinity,
                            //  imageUrl:
                            //    person.knownFor?[index].backdropPath ?? ""),
                            imageUrl:
                                "https://cdn.dribbble.com/users/4009983/screenshots/16047199/juraganmaterial-08_4x.jpg"),
                      ),
                    );
                  },
                  itemCount: person.knownFor?.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
