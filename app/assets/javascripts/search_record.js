$(document).ready(function(){

  $("#timesheetDate").change(function(){
    var date = $("#timesheetDate").val();
    var today = new Date()
    var date_str = today.toISOString().substr(0,10);
    var sameDate = date === date_str
    
    if (sameDate) {
      $("#time_sheet1").show();
    } else {
      $("#time_sheet1").hide();
    }

    $.ajax({
     type: "POST",
     dataType: "json",
     url: "/time_sheets/search_record",
     data: { date: date },
     success: function(data) {
      var _mins = 0;
      $("#hours").html(_mins);


      $('#tableData').html("");
      $.each(data, function(i, obj){
        if(obj.date != date_str) {
          $("#show_form").hide();     
        } else {
          $("#show_form").show();
        }
        var klass = (obj.date == date_str) ? '' : 'hide';
        _mins = _mins + eval(obj.working_time);
        
        $("#tableData").append(
          "<tr>" +
          "<td>" + obj.date + "</td>" +
          "<td>" + obj.project_name + "</td>" +
          "<td>" + obj.description + "</td>" +
          "<td>" + obj.working_time + "</td>" +
          "<td><a data-remote='true' class="+klass+" href='/time_sheets/" + obj.id + "/edit'>Edit</a></td>" +

          "</tr>"
          )
      })
      var _hrs = ((_mins / 60).toFixed(2)).replace(".", ":");
      $("#hours").html(_hrs);
    }
  });
});
});
