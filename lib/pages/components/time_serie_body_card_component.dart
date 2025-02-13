import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hcp_test/i18n/i18n.dart';
import 'package:hcp_test/pages/components/base_card_component.dart';
import 'package:hcp_test/pages/components/rich_text_component.dart';
import 'package:hcp_test/pages/home/cubit/favorite_time_serie/favorite_time_serie_cubit.dart';
import 'package:hcp_test/pages/home/cubit/favorite_time_serie/favorite_time_serie_state.dart';
import 'package:hcp_test/pages/time_serie_details/time_serie_details_page.dart';
import 'package:hcp_test/repository/models/time_serie_view_model.dart';

class TimeSerieBodyCardComponent extends StatelessWidget {
  const TimeSerieBodyCardComponent({
    required this.timeSerie,
    super.key,
  });

  final TimeSerieViewModel timeSerie;

  @override
  Widget build(BuildContext context) {
    return BaseCardComponent(
      height: MediaQuery.of(context).size.height * 0.6,
      color: Theme.of(context).colorScheme.background,
      width: MediaQuery.of(context).size.width * 0.88,
      padding: 0,
      borderRadius: BorderRadius.circular(12),
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.22,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.network(
                  'https://d34u8crftukxnk.cloudfront.net/slackpress/prod/sites/6/4.2.png',
                  fit: BoxFit.cover,
                  frameBuilder:
                      (context, child, frame, wasSynchronouslyLoaded) {
                    return child;
                  },
                  errorBuilder: (context, error, stackTrace) => const Center(
                    child: Icon(Icons.close),
                  ),
                  loadingBuilder: (BuildContext context, Widget child,
                      ImageChunkEvent? loadingProgress) {
                    if (loadingProgress == null) return child;
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
                BlocBuilder<FavoriteTimeSerieCubit, FavoriteTimeSerieState>(
                  builder: (context, state) {
                    return Positioned(
                      top: 0,
                      right: 0,
                      child: GestureDetector(
                        onTap: () {
                          if (!state.timeSeriesList.contains(timeSerie)) {
                            context
                                .read<FavoriteTimeSerieCubit>()
                                .addFavoriteTimeSerie(timeSerie);
                          } else {
                            context
                                .read<FavoriteTimeSerieCubit>()
                                .removeFavoriteTimeSerie(timeSerie);
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(right: 12, top: 12),
                          child: CircleAvatar(
                            backgroundColor:
                                Theme.of(context).colorScheme.background,
                            radius: 26,
                            child: Icon(
                              Icons.favorite,
                              color: state.timeSeriesList.contains(timeSerie)
                                  ? Theme.of(context).colorScheme.primary
                                  : Theme.of(context).colorScheme.surface,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                )
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichTectComponent(
                            highlightedLabel: '${R.string.information}: ',
                            label: timeSerie.metaData.information,
                          ),
                          RichTectComponent(
                            highlightedLabel: '${R.string.symbol}: ',
                            label: timeSerie.metaData.symbol,
                          ),
                          RichTectComponent(
                            highlightedLabel: '${R.string.lastUpdate}: ',
                            label: timeSerie.metaData.lastRefreshed,
                          ),
                          RichTectComponent(
                            highlightedLabel: '${R.string.outputSize}: ',
                            label: timeSerie.metaData.outputSize,
                          ),
                          RichTectComponent(
                            highlightedLabel: '${R.string.timezone}: ',
                            label: timeSerie.metaData.timezone,
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, TimeSerieDetailsPage.route,
                          arguments: timeSerie);
                    },
                    child: BaseCardComponent(
                      width: MediaQuery.of(context).size.width * 0.9,
                      color: Theme.of(context).colorScheme.onSurface,
                      borderRadius: BorderRadius.circular(8),
                      child: Text(
                        R.string.detail,
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: Theme.of(context).colorScheme.background),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
