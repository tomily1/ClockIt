$(document).ready(function() {
  columns = ["id", "type", "clocked_at", "details", "delete_record"]
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
      { width: '20%', targets: 0 },
      { width: '25%', targets: 2 },
      { width: '38%', targets: 3 }
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
            "'><i class='fa fa-trash hi-mama-light-blue'></i></a>"
          )
        }
      }
    }

    return { data: columnName }
  });
};
