import 'package:flutter/material.dart';
import 'package:run_flutter_ui/services/api_service.dart';

import '../../../models/webtoon_detail_model.dart';
import '../../../models/webtoon_episode_model.dart';

class DetailScreen extends StatefulWidget {
  final String title, thumb, id;

  const DetailScreen({
    super.key,
    required this.title,
    required this.thumb,
    required this.id,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late Future<WebtoonDetailModel> webtoon;
  late Future<List<WebtoonEpisodeModel>> episodes;

  @override
  void initState() {
    super.initState();
    webtoon = ApiService.getToonById(widget.id);
    episodes = ApiService.getLatestEpisodesById(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 2,
          backgroundColor: const Color(0xfff2b33a),
          foregroundColor: Colors.black,
          title: Text(
            widget.title,
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Hero(
                  tag: widget.id,
                  child: Container(
                    width: 250,
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 12,
                            offset: const Offset(10, 10),
                            color: Colors.black.withOpacity(0.3),
                          ),
                        ]),
                    child: Image.network(widget.thumb),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 25),
            FutureBuilder(
                future: webtoon,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 50,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            snapshot.data!.about,
                            style: const TextStyle(fontSize: 16),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Text(
                            '${snapshot.data!.genre} / ${snapshot.data!.age}',
                            style: const TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    );
                  }
                  return const Text("...");
                })
          ],
        ));
  }
}
