import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:movie_test_app/app/modules/details/details_module.dart';
import 'package:movie_test_app/app/modules/popular_people/popular_people_store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:movie_test_app/app/shared/widgets/loader_widget.dart';

class PopularPeoplePage extends StatefulWidget {
  const PopularPeoplePage({Key? key}) : super(key: key);

  @override
  State<PopularPeoplePage> createState() => _PopularPeoplePageState();
}

class _PopularPeoplePageState extends State<PopularPeoplePage> {
  final PopularPeopleStore store = Modular.get<PopularPeopleStore>();
  int page = 1;
  ScrollController scrollController = ScrollController();

  void _scrollListener() {
    if (scrollController.position.extentAfter == 0) {
      if (page != store.popularPeopleModel?.totalPages) {
        store.getPopularPeople(++page);
      }
    }
  }

  @override
  void initState() {
    scrollController = ScrollController()..addListener(_scrollListener);
    store.getPopularPeople(1);
    super.initState();
  }

  @override
  void dispose() {
    scrollController.removeListener(_scrollListener);
    Modular.dispose<PopularPeopleStore>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Popular People',
            style: TextStyle(),
          ),
        ),
        body: SafeArea(
          child: Observer(
            builder: (BuildContext context) {
              return Stack(
                children: [
                  ListView.separated(
                    controller: scrollController,
                    physics: const AlwaysScrollableScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      return ListTile(
                        onTap: () {
                          Modular.to.pushNamed(DetailsModule.initialRoute,
                              arguments: {
                                "item": store.results?[index],
                              });
                        },
                        title: Text(store.results?[index].name ?? ""),
                        subtitle: Text(
                            store.results?[index].knownForDepartment ?? ""),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return Divider(
                        thickness: 1.0,
                        height: 1.0,
                        color: Colors.grey.withOpacity(0.1),
                        indent: 32,
                        endIndent: 32,
                      );
                    },
                    itemCount: store.results?.length ?? 0,
                  ),
                  if (store.isLoading) const LoaderApp()
                ],
              );
            },
          ),
        ));
  }
}
