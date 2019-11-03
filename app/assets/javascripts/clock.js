$(document).ready(function() {
  columns = ["id", "type", "clocked_at", "details", "edit_record", "delete_record"]
  $('#clock-datatable').dataTable({
    "processing": true,
    "serverSide": true,
    "ordering": false,
    "searching": false,
    "bLengthChange": false,
    language: {
      paginate: {
        next: "<i class='fa fa-chevron-right'></i>",
        previous: "<i class='fa fa-chevron-left'></i>"
      }
    },
    "ajax": {
      "url": $('#clock-datatable').data('source')
    },
    "pagingType": "simple_numbers",
    "columns": formatColumns(columns),
    columnDefs: [
      { width: '10%', targets: 0 },
      { width: '20%', targets: 1 },
      { width: '25%', targets: 2 },
      { width: '30%', targets: 3 },
      { width: '10%', targets: 4 }
    ]
  });
});

function formatColumns(columns) {
  return columns.map(function(columnName) {
    if (columnName === 'delete_record') {
      return {
        data: columnName,
        render: function(deletePath) {
          return (
            "<a data-confirm='" +
            "Are you sure you want to delete this record?" +
            "' data-method='delete' href='" +
            deletePath +
            "'><i class='fa fa-trash orange'></i></a>"
          )
        }
      }
    } else if (columnName === 'edit_record') {
      return {
        data: columnName,
        render: function(editPath) {
          return "<a href='" + editPath + "'><i class='fa fa-edit hi-mama-light-blue'></i></a>"
        }
      }
    }
    return { data: columnName }
  });
};
