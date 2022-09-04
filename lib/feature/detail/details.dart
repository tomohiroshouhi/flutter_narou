import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../ranking_list/bloc/ranking_bloc_state.dart';

class BookDetails extends StatelessWidget {
  final RankingBlocSet details;
  const BookDetails({
    super.key,
    required this.details,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(details.title),
      ),
      body: ListView(
        children: [
          Text("作者: ${details.writer}"),
          GestureDetector(
            onTap: () => _launchUrl(details.ncode),
            child: const Text("リンク　>"),
          ),
          Text("内容: \n${details.story}"),
        ],
      ),
    );
  }

  Future<void> _launchUrl(String ncode) async {
    final Uri url = Uri.parse('https://ncode.syosetu.com/$ncode/');
    if (!await launchUrl(url)) {
      throw 'Could not launch $url';
    }
  }
}
