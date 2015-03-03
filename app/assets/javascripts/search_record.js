$(document).ready(function(){
  
  // $("#show").click(function(){
  //   $("#time_sheet").show();
  // });

  $("#timesheetDate").change(function(){
    var date = $("#timesheetDate").val();
    $.ajax({
     type: "POST",
     dataType: "json",
     url: "/timesheets/search_record",
     data: { date: date },
     success: function(data) {
      $('#tableData').html("");
      $.each(data, function(i, obj){
        $("#tableData").append(
          "<tr>" +
            "<td>" + obj.date + "</td>" +
            "<td>" + obj.project_name + "</td>" +
            "<td>" + obj.description + "</td>" +
            "<td>" + obj.working_time + "</td>" +
            "<td><a data-remote='true' href='/timesheets/" + obj.id + "/edit'>Edit</a></td>" +
          "</tr>"
        )
      })
     }
    });
  });
});