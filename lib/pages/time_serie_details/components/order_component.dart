import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hcp_test/i18n/i18n.dart';
import 'package:hcp_test/pages/time_serie_details/components/close_bottom_sheet_component.dart';
import 'package:hcp_test/pages/time_serie_details/cubit/oreder_list/sort_list_cubit.dart';
import 'package:hcp_test/pages/time_serie_details/cubit/oreder_list/sort_list_state.dart';

class OrderComponent extends StatelessWidget {
  const OrderComponent({super.key});

  @override
  Widget build(BuildContext context) {
    Widget radioComponent(
      String label, {
      required String value,
      required String groupValue,
      required Function(dynamic) onChanged,
    }) =>
        Row(
          children: [
            Radio(
              activeColor: Theme.of(context).colorScheme.surface,
              value: value,
              groupValue: groupValue,
              onChanged: onChanged,
            ),
            Text(label, style: Theme.of(context).textTheme.bodyMedium),
          ],
        );

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child:
          BlocBuilder<SortListCubit, SortListState>(builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [CloseBottomSheetComponent()],
            ),
            Text(
              R.string.orderBy,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  radioComponent(
                    R.string.high,
                    value: state.sortList?["by"] ?? '',
                    groupValue: "high",
                    onChanged: (_) {
                      context.read<SortListCubit>().addSortList(
                        {"by": "high", "as": state.sortList?["as"]},
                      );
                    },
                  ),
                  radioComponent(
                    R.string.low,
                    value: state.sortList?["by"] ?? '',
                    groupValue: "low",
                    onChanged: (_) {
                      context.read<SortListCubit>().addSortList(
                        {"by": "low", "as": state.sortList?["as"]},
                      );
                    },
                  ),
                ],
              ),
            ),
            Text(
              R.string.orderAs,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  radioComponent(
                    "ASC",
                    value: state.sortList?["as"] ?? '',
                    groupValue: "asc",
                    onChanged: (_) {
                      context.read<SortListCubit>().addSortList(
                        {"by": state.sortList?["by"], "as": "asc"},
                      );
                    },
                  ),
                  radioComponent(
                    "DESC",
                    value: state.sortList?["as"] ?? '',
                    groupValue: "desc",
                    onChanged: (_) {
                      context.read<SortListCubit>().addSortList(
                        {"by": state.sortList?["by"], "as": "desc"},
                      );
                    },
                  ),
                ],
              ),
            )
          ],
        );
      }),
    );
  }
}
