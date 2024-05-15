import 'package:pluto_grid/pluto_grid.dart';

class PlutoGridWrapper {
  List<PlutoColumn> wrap(List<PlutoColumn> columns) {
    for (var column in columns) {
      column.enableContextMenu = false;
      column.enableDropToResize = false;
      column.enableColumnDrag = false;
      column.enableSorting = false;
      column.readOnly = true;
    }
    return columns;
  }
}