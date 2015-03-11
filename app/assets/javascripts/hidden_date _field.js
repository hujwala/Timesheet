$(document).ready(function(){
	
	var date = $("#timesheetDate").val();
	$("#hiddenDate").val(date);

	function updateHiddenField() {
		date = $("#timesheetDate").val();
		$("#hiddenDate").val(date);
	}

	$("#timesheetDate").on("change", updateHiddenField)
	
});
if (@time_sheet.valid? && @total_minutes < 1440){
@time_sheet.save
}else {
	flash[:error] = "Exceeds 24 hours"
$(document).on('click', '#time_sheet1', function(e){
    $("#time_sheet1").submit();
    window.location.reload();
    e.preventDefault();
  })
}