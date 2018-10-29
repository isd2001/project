/**
 * 
 */

$("#new-recomment").on("change", function() {
	var recommnet = $("#new-recomment").val();
	console.log(recommnet);
	var html = "<hr class=\"mb-4\">";
		html += "<div class=\"media mt-3\">";
		html += "<a class=\"pr-3\" href=\"#\">";
		html += "<img src=\"${pageContext.servletContext.contextPath }/image/parcelimage/64x64.jpg\" alt=\"Generic placeholder image\">";
		html += "</a>"
		html += "<div class=\"media-body\">";
		html += "<div class=\"alert alert-secondary\" role=\"alert\">";
		html += "<h5 class=\"mt-0\">Media heading</h5>";
	    html += recommnet;
	    html += "</div>";
		html += "</div>";
		html += "</div>";
		
	$("#view-recomment").append(html);
	document.getElementById("new-recomment").value = "";
})