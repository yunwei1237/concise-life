$(function(){
	CKEDITOR.config.height = 550;
	/*CKEDITOR.config.width = 'auto';*/
	CKEDITOR.replace("content");
	$("#reset").click(function(){
		$("input").val("");
		CKEDITOR.instances.content.setData("");
	});
	/*$("#submit").click(function(){
		var title = $("#title").val();
		var stem = encodeURI(CKEDITOR.instances.content.getData());
		window.location = "viewJournal2?title="+title+"&text="+stem;
		return false;
	});*/
});