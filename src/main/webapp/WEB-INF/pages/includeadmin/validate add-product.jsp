<!--For Password Validation By JQuery-->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
$().ready(function() {
	$("#demoForm").validate({
		onfocusout: false,
		onkeyup: false,
		onclick: false,
		rules: {
			"name": {
				required: true,
				maxlength: 15
			},
			"price": {
				required: true,
                                min : 1
				
			},
			"quantity": {
				required: true,
                                min : 1
			},
                        "age": {
				required: true
                                
			}
                        ,
                        "totalPlayer": {
				required: true
                                
			}
		}
	});
});
</script>
