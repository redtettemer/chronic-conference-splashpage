$(document).ready(function () {
    formSubmission();

});


function formSubmission() {
    $('#form').find('form').submit(function (e) {
        e.preventDefault();

        clearErrors();

        var name = $('#form form input#name').val(),
            email = $('#form form input#email').val(),
            phone = $('#form form input#phone').val(),
            store = $('#form form input#store').val(),
            conference = $('#form form input#conference')[0].checked,
            dinner = $('#form form input#dinner')[0].checked;

        var errors = validate(name, email, phone, conference, dinner, store);

        if (errors[0] || errors[1] || errors[2] || errors[3] || errors[4])
            showErrors(errors);
        else {
            $.ajax({
                type: 'POST',
                url: '/submit',
                data: {name: name, phone: phone, email: email, conference: conference, dinner: dinner, store: store},
                success: function (r) {
                   if (r['success']) {
                       //success

                       //code that fades out form and fades in success screen.
                       $('#formContainer').addClass('hide');
                       $('#thankYou').removeClass('hide');

                   }
                   else  {
                       $('.already-registered').addClass('show')
                   }
                },
                error: function (r) {
                    showErrors(['We\'re sorry, the request has failed', null])
                }
            })
        }
    })

    function clearErrors() {
        //hides error states//

        $('p.error.name').removeClass('show');

        $('p.error.phone').removeClass('show');

        $('p.error.email').removeClass('show');
        $('p.error.store').removeClass('show');

        $('p.error.attendance').removeClass('show');

        $('.already-registered').removeClass('show');
    }


    function showErrors(errors) {
        //shows error states//

        if (errors[0]) {
            $('p.error.name').addClass('show')
        }
        if (errors[1]) {
            $('p.error.phone').addClass('show')
        }
        if (errors[2]) {
            $('p.error.email').addClass('show')
        }
        if (errors[3]) {
            $('p.error.attendance').addClass('show')
        }
        if (errors[4]) {
            $('p.error.store').addClass('show')
        }

    }

    function validate(name, email, phone, conference, dinner, store) {
        //need to accept email, phone, name as inputs//

        var errorsArr = [true, true, true, true, true];

        if (name.length > 1) {
            errorsArr[0] = false
        }

        if (validateEmail(email)) {
            errorsArr[1] = false
        }

        if (phone.length >= 10) {
            var cleanedPhone = phone.replace(/-/g, '');
            if (!isNaN(cleanedPhone))
                errorsArr[2] = false
        }

        if (conference || dinner)
            errorsArr[3] = false;

        if (store.length > 1)
            errorsArr[4] = false

        return errorsArr
    }
}


function validateEmail(email) {
    var emailReg = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    return emailReg.test(email);
}


