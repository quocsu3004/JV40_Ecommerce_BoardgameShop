<script>
    $().ready(function () {
        $("#demoForm").validate({
            onfocusout: false,
            onkeyup: false,
            onclick: false,
            rules: {
                "name": {
                    required: true,

                },
                "discount": {
                    required: true,
                    min: 1,
                    max: 100

                },
                "startDate": {
                    required: true,
                    date: true

                },
                "endDate": {
                    required: true,
                    date: true

                }


            }
        });
    });
</script>