import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:narou/feature/ranking_list/bloc/ranking_bloc.dart';
import 'package:narou/feature/ranking_list/bloc/ranking_bloc_state.dart';

import '../detail/details.dart';

class RankingListPage extends StatelessWidget {
  const RankingListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('なろうよ！ランキング'),
      ),
      body: BlocBuilder<RankingBloc, RankingBlocState>(
        builder: (context, state) {
          if (state is RankingBlocSetState) {
            return ListView.builder(
              itemCount: state.list.length,
              itemBuilder: (_, index) {
                return GestureDetector(
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => BookDetails(
                        details: state.list[index],
                      ),
                    ),
                  ),
                  child: ListTile(
                    leading: Text(
                      state.list[index].ranking.toString(),
                    ),
                    title: Text(
                      state.list[index].title,
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios),
                  ),
                );
              },
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
