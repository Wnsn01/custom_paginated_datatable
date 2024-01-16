// This file extends the custom paginated data table and provides additional customization options.

// ignore_for_file: use_key_in_widget_constructors, file_names

import 'package:flutter/material.dart';
import 'package:custom_paginated_datatable/base_widget/custom_paginated.dart';

class CustomPaginatedDataTable extends StatefulWidget {
  final int? sortColumnIndex;
  final bool? sortAscending;
  final bool? showCheckboxColumn;
  final Function(int?)? onPageChanged;
  final Widget? header;
  final List<int>? availableRowsPerPage;
  final ValueChanged<int?>? onRowsPerPageChanged;
  final int? rowsPerPage;
  final List<DataColumn>? columns;
  final DataTableSource? source;
  final bool? searchEnable;
  final List<Widget>? actions;
  final double? horizontalMargin;
  final Function(bool?)? onSelectAll;
  final MaterialStateProperty<Color?>? dataRowColor;
  final MaterialStateProperty<Color?>? headingRowColor;
  final double? headingRowHeight;
  final String? rowsPerPageTitle;
  final double columnSpacing;

  const CustomPaginatedDataTable({
    this.sortColumnIndex,
    this.sortAscending = true,
    this.showCheckboxColumn = false,
    this.onPageChanged,
    this.header,
    this.availableRowsPerPage = const [10,20,30],
    this.onRowsPerPageChanged,
    this.rowsPerPage = 10,
    this.columns,
    this.source,
    this.searchEnable = false,
    this.actions,
    this.horizontalMargin = 24.0,
    this.onSelectAll,
    this.dataRowColor,
    this.headingRowColor,
    this.headingRowHeight,
    this.rowsPerPageTitle,
    this.columnSpacing = 56.0,
  });

  @override
  State<CustomPaginatedDataTable> createState() =>
      _CustomPaginatedDataTableState();
}

class _CustomPaginatedDataTableState extends State<CustomPaginatedDataTable> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        CustomPaginated(
          dataRowColor: widget.dataRowColor,
          headingRowColor: widget.headingRowColor,
          headingRowHeight: widget.headingRowHeight!,
          rowsPerPageTitle: widget.rowsPerPageTitle,
          columnSpacing: widget.columnSpacing,
          sortColumnIndex: widget.sortColumnIndex,
          sortAscending: widget.sortAscending!,
          showCheckboxColumn: widget.showCheckboxColumn!,
          onPageChanged: widget.onPageChanged!,
          header: widget.header,
          columns: widget.columns!,
          availableRowsPerPage: widget.availableRowsPerPage!,
          onRowsPerPageChanged: widget.onRowsPerPageChanged!,
          rowsPerPage: widget.rowsPerPage!,
          showFirstLastButtons: true,
          source: widget.source!,
          actions: widget.actions,
          onSelectAll: widget.onSelectAll!,
          horizontalMargin: widget.horizontalMargin!,
        ),
      ],
    );
  }
}
