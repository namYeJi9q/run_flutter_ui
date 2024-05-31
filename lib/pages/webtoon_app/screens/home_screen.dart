// import 'package:flutter/material.dart';

// import '../../models/webtoon_model.dart';
// import '../../services/api_service.dart';

// statefulwidget을 이용한 가장 기본적인 fetch 방법

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   List<WebtoonModel> webtoons = [];
//   bool isLoading = true;

//   void waitForWebToons() async {
//     webtoons = await ApiService.getTodaysTooms();
//     Future.delayed(const Duration(milliseconds: 500), () {
//       setState(() {
//         isLoading = false;
//       });
//     });
//     setState(() {});
//   }

//   @override
//   void initState() {
//     waitForWebToons();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Colors.white,
//       child: Center(
//         child: isLoading
//             ? const CircularProgressIndicator()
//             : OutlinedButton(onPressed: () {}, child: const Text('go')),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../models/webtoon_model.dart';
import '../../../services/api_service.dart';
import '../widgets/webtoon_widget.dart';

class HomeScreen extends StatelessWidget {
  final Future<List<WebtoonModel>> webtoons = Future.delayed(
    const Duration(seconds: 2),
    () => ApiService.getTodaysTooms(),
  );

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: webtoons,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: [
                const SizedBox(height: 50),
                Expanded(child: makeList(snapshot)),
              ],
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }

  ListView makeList(AsyncSnapshot<List<WebtoonModel>> snapshot) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      itemCount: snapshot.data!.length,
      itemBuilder: (context, index) {
        var webtoon = snapshot.data![index];
        return Webtoon(
          title: webtoon.title,
          thumb: webtoon.thumb,
          id: webtoon.id,
        );
      },
      separatorBuilder: (context, index) =>
          const SizedBox(width: 40), // 아이템 사이에 구분자를 넣어줌
    );
  }
}
