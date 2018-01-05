var globalStorage = {
    features: {},
    userInfo: {}
}

var textOne,
    textTwo,
    textThree,
    textFour

$(document).ready(function () {
    clickEvents();
    // pullUserInfo();
    // prefillForm();
    inputActive();

})


function pullUserInfo() {
    var first, last, email
    first = getQueryParam('first')
    last = getQueryParam('last')
    email = getQueryParam('email')

    if (first == 'first')
        first = ''
    if (last == 'last')
        last = ''
    if (email == 'email')
        email = ''

    return [first, last, email]
}

function prefillForm(firstname, lastname, email) {
    var one,
        two,
        three
    one = two = three = true
    if (firstname != 'First' && firstname != '') {
        $('#first').val(firstname);
        one = false
    }

    if (lastname != 'Last' && lastname != '') {
        $('#last').val(lastname)
        two = false
    }

    if (email != 'Email' && email != '') {
        $('#email').val(email)
        three = false
    }

    if (one || two || three) {
        $('#form h2').html('PLEASE ENTER YOUR INFORMATION')
    }
}

function clickEvents() {
    $('.button').click(function () {
        var that = $(this)
        if (that.hasClass('rsvp')) {
            rsvpEvents()
        } else if (that.hasClass('info') && !that.hasClass('post')) {
            infoEvents()
        } else if (that.hasClass('confirm')) {
            submitForm()
        } else if (that.hasClass('post')) {
            postInfoEvents()
        }
    })

    if (isIOS()) {
        $('input').on('blur', function (e) {
            /*e.preventDefault();
            e.stopPropagation();
            window.scrollTo(0, 0);*/
        });
    }

    $('input').on('focus', function () {
        var that = $(this)
        var num = that.data('num')
        $('hr[data-num=' + num + ']').addClass('show')
        that.off('focus')
    })
}

function inputActive() {
    $('input').blur(function() {
        if( !$(this).val().length == 0 ) {
            $(this).addClass('filled');
        }
    });
}

function submitForm() {
    // quickGlow($('.button.confirm'))

    var first = $('#first').val(),
        last = $('#last').val(),
        email = $('#email').val(),
        company = $('#company').val();

    $('.error.first').html('')
    $('.error.last').html('')
    $('.error.email').html('')
    $('.error.company').html('')

    var errors = verifyForm()

    if (errors[0] != '' || errors[1] != '' || errors[2] != '' || errors[3] != '') {
        $('.error.first').html(errors[0])
        $('.error.last').html(errors[1])
        $('.error.email').html(errors[2])
        $('.error.company').html(errors[3])
        return
    }

    $.post('/submit',
      {
        'first': first,
        'last': last,
        'email': email,
        'company': company
      },
      function (response) {
        if (response.success) {
            $('#form').addClass('hide')
            $('#thankYou').removeClass('hide')
            if (globalStorage.features.annyang)
                annyang.removeCommands(['rsvp', 'info', 'back'])
        } else {
            $('.error.email').html(response.msg)
        }
      })
      .fail(function (response) {
        $('.error.company').html('There was an error submitting the form.')
      });
}

function verifyForm() {
    var first = $('#first').val(),
        last = $('#last').val(),
        email = $('#email').val(),
        company = $('#company').val();

    var errors = []

    if (first.length < 1)
        errors.push('Please provide your first name')
    else
        errors.push('')

    if (last.length < 1)
        errors.push('Please provide your last name')
    else
        errors.push('')

    if ((email.length < 1) || !validateEmail(email))
        errors.push('Please provide a valid email address')
    else
        errors.push('')

    if (company.length < 1)
        errors.push('Please provide your company name')
    else
        errors.push('')

    return errors
}

function validateEmail(email) {
  var emailReg = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
  return emailReg.test(email);
}
