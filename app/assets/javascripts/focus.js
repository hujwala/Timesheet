$(document).on('focusout', '.autosave', function(){
  autoSavePost();

});
function autoSavePost() {
  var project_name = $('#Name').val();
  var description = $('#description').val();
  var working_time = $('#working_time').val();
  if(project_name != '' && description != '' && working_time != ''){
    $.ajax({
     type: "POST",
     url: "/timesheets/autosave",
     data: {
        time_sheet: {
          project_name: project_name,
          description: description,
          working_time: working_time
        }
    },
     dataType: "script",
     success: function(data) {
       console.log(data);
     }
   });
   window.location.reload();
  }else{
  }
}
