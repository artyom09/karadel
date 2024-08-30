// -----------> ajax jQuery
$(function () {
    // flexslider
    if ($(".flexslider-thumbnails").length) {
        $(".flexslider-thumbnails").flexslider({
            animation: "slide",
            controlNav: "thumbnails",
        });
    }

    var form = $("#contacts-form"),
        message = $(".contact__msg"),
        form_data; // Success function

    var forms = $("#subscriber"),
        message = $(".contact__msg"),
        form_data; // Success function

    function done_func() {
        let lang = $("html").attr("lang");
        if (lang == "hy") {
            (message = "Ձեր հարցումը հաջողությամբ ուղարկվել է"),
                (info = "Շնորհակալություն"),
                (button = "Փակել");
        } else if (lang == "ru") {
            (message = "Ваш запрос был успешно отправлен"),
                (info = "Спасибо"),
                (button = "Закрыть");
        } else if (lang == "en") {
            (message = "Your request has been successfully sent"),
                (info = "Thanks"),
                (button = "Close");
        }
        Swal.fire({
            icon: "success",
            title: info,
            text: message,
            confirmButtonText: button,
            confirmButtonColor: "#222",
        });
        form.find('button:not([type="submit"]), textarea').val("");
        $("#contacts-form")[0].reset();
    } // fail function

    function fail_func() {
        let lang = $("html").attr("lang");
        if (lang == "hy") {
            (message = "Լրացրեք պարտադիր լրացման դաշտերը"),
                (info = "Ուշադրություն"),
                (button = "Փակել");
        } else if (lang == "ru") {
            (message = "Пожалуйста, заполните обязательные поля"),
                (info = "Внимание"),
                (button = "Закрыть");
        } else if (lang == "en") {
            (message = "Please fill in the required fields"),
                (info = "Oops"),
                (button = "Close");
        }
        Swal.fire({
            icon: "error",
            title: info,
            text: message,
            confirmButtonText: button,
            confirmButtonColor: "#222",
        });
    }

    form.submit(function (e) {
        e.preventDefault();
        form_data = $(this).serialize();
        $.ajax({
            type: "POST",
            url: form.attr("action"),
            data: form_data,
        })
            .done(done_func)
            .fail(fail_func);
    });

    forms.submit(function (e) {
        e.preventDefault();
        form_data = $(this).serialize();
        $.ajax({
            type: "POST",
            url: forms.attr("action"),
            data: form_data,
        })
            .done(done_funcs)
            .fail(fail_funcs);
    });

    function done_funcs() {
        let lang = $("html").attr("lang");
        if (lang == "hy") {
            (message = "Դուք հաջողությամբ բաժանորդագրվել եք"),
                (info = "Շնորհակալություն"),
                (button = "Փակել");
        } else if (lang == "ru") {
            (message = "Вы успешно подписались"),
                (info = "Спасибо"),
                (button = "Закрыть");
        } else if (lang == "en") {
            (message = "You have successfully subscribed"),
                (info = "Thanks"),
                (button = "Close");
        }
        Swal.fire({
            icon: "success",
            title: info,
            text: message,
            confirmButtonText: button,
            confirmButtonColor: "#222",
        });
        form.find('button:not([type="submit"]), textarea').val("");
        $("#subscriber")[0].reset();
    } // fail function

    function fail_funcs() {
        let lang = $("html").attr("lang");
        if (lang == "hy") {
            (message = "Լրացրեք պարտադիր լրացման դաշտերը"),
                (info = "Ուշադրություն"),
                (button = "Փակել");
        } else if (lang == "ru") {
            (message = "Пожалуйста, заполните обязательные поля"),
                (info = "Внимание"),
                (button = "Закрыть");
        } else if (lang == "en") {
            (message = "Please fill in the required fields"),
                (info = "Oops"),
                (button = "Close");
        }
        Swal.fire({
            icon: "error",
            title: info,
            text: message,
            confirmButtonText: button,
            confirmButtonColor: "#222",
        });
    }
});
/*##################
--------------------------
- ajax form area ends here
--------------------------
##################*/
