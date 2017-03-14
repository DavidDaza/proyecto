function pregunta() {// Editar Usuario (cambiar alerta)
    if (confirm('¿Estas seguro de enviar este formulario?')) {
        document.editar.submit();
    }
}

var error = false;

$(document).ready(function () {


    $('.input-emai').on('focusout', function (event) {
        event.preventDefault();
        $.ajax({
            url: 'iniciar',
            dataType: 'text',
            method: 'POST',
            data: {'correo': $(this).val(), 'textOpcion': 4},
        }).done(function (data) {
            if (data === 'ok') {
                $('#resultado5').removeClass('alert-success');
                $('#resultado5').addClass('alert-danger');
                $('#resultado5').html('<b>¡Error!</b> Ya hay un usuario registrado con ese correo.');
                error = true;

            } else {
                error = false;

            }
        });
    });

});

/*Validacion Formulario de Registro*/
$(document).ready(function () {

    var validacion1 = true;
    var validacion2 = true;
    var validacion3 = true;
    var validacion4 = true;
    var validacion5 = true;
    var validacion6 = true;
    var validacion7 = true;
    var validacion8 = true;
    var validacion9 = true;
    var validacion10 = true;
    console.log(validacion8);
    console.log(validacion9);
    var validarSujeto = new RegExp(/^[a-z\d_]{4,25}$/i);
    $('#pass').keyup(function (e) {
        var strongRegex = new RegExp("^(?=.{8,})(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*\\W).*$", "g");
        var mediumRegex = new RegExp("^(?=.{7,})(((?=.*[A-Z])(?=.*[a-z]))|((?=.*[A-Z])(?=.*[0-9]))|((?=.*[a-z])(?=.*[0-9]))).*$", "g");
        var enoughRegex = new RegExp("(?=.{6,}).*", "g");
        if (false == enoughRegex.test($(this).val())) {
            $('#contra1').html('Más caracteres.');
        } else if (strongRegex.test($(this).val())) {
            $('#contra1').addClass('alert-success');
            $('#contra1').html('Fuerte!');
        } else if (mediumRegex.test($(this).val())) {
            $('#contra1').className = 'alert';
            $('#contra1').html('Media!');
        } else {
            $('#contra1').className = 'error';
            $('#contra1').html('Débil!');
        }
        return false;
    });
//Validacion Nombre
    $('#nom1').on('focusout', function (e) {
        var nom1 = $('#nom1').val()
        var vali = new RegExp(/^[a-z\d_]{4,25}$/i);
        if (nom1.trim() === '') {
            $('#resultado1').addClass('alert-danger');
            $('#resultado1').html('<strong>¡Error!</strong> Este campo es requerido, no debe ir vacío.');
            validacion1 = true;
        } else if (false == validarSujeto.test(nom1)) {
            $('#resultado1').addClass('alert-danger');
            $('#resultado1').html('<strong>¡Error!</strong> ¡Error! Este campo debe contener mínimo 4 caracteres y máximo 25 y no puede llevar caracteres especiales.');
            validacion1 = true;
        } else {
            $('#resultado1').removeClass('alert-danger');
            $('#resultado1').addClass('alert-success');
            $('#resultado1').html('Correcto!');
            validacion1 = false;
        }

    });
//Validacion Apellido1    
    $('#ape1').on('focusout', function (e) {
        var apel1 = $('#ape1').val();

        if (apel1.trim() === '') {
            $('#resultado3').addClass('alert-danger');
            $('#resultado3').html('<strong>¡Error!</strong> Este campo es requerido, no debe ir vacío.');
            validacion3 = true;
        } else if (false == validarSujeto.test(apel1)) {
            $('#resultado3').addClass('alert-danger');
            $('#resultado3').html('<strong>¡Error!</strong> ¡Error! Este campo debe contener mínimo 4 caracteres y máximo 25 y no puede llevar caracteres especiales.');
            validacion3 = true;
        } else {
            $('#resultado3').removeClass('alert-danger');
            $('#resultado3').addClass('alert-success');
            $('#resultado3').html('Correcto!');
            validacion3 = false;
        }

    });
// Validar Email
    $('#email').on('focusout', function () {
        var ema = $('#email').val();
        var validarCorreo = new RegExp(/\w+@\w+\.+[a-z]/);
        if (ema.trim() === '') {
            $('#resultado5').removeClass('alert-success');
            $('#resultado5').addClass('alert-danger');
            $('#resultado5').html('<strong>¡Error!</strong> Este campo es requerido, no debe ir vacío.');
            validacion5 = true;
        } else if (false == validarCorreo.test(ema)) {

            $('#resultado5').html('<strong>¡Error!</strong> ¡Error! Este campo debe contener mínimo 4 caracteres y máximo 35 y debe ser un correo.');
            validacion5 = true;
        } else {
            $('#resultado5').removeClass('alert-danger');
            $('#resultado5').addClass('alert-success');
            $('#resultado5').html('Correcto!');
            validacion5 = false;
        }
    });
    $('#email1').on('focusout', function () {
        var ema = $('#email').val();
        var ema1 = $('#email1').val();
        var validarCorreo = new RegExp(/\w+@\w+\.+[a-z]/);
        if (ema1.trim() === '') {
            $('#resultado10').removeClass('alert-success');
            $('#resultado10').addClass('alert-danger');
            $('#resultado10').html('<strong>¡Error!</strong> Este campo es requerido, no debe ir vacío.');
            validacion10 = true;
        } else if (ema !== ema1) {

            $('#resultado10').html('<strong>¡Error!</strong> ¡Error! No coinciden el correos');
            validacion10 = true;
        } else {
            $('#resultado10').removeClass('alert-danger');
            $('#resultado10').addClass('alert-success');
            $('#resultado10').html('Correcto!');
            validacion10 = false;
        }
    });


//validar DIRECCION 

    $('#direccion').on('focusout', function () {
        var direc = $('#direccion').val();
        if (direc.trim() === '') {

            $('#resultado6').addClass('alert-danger');
            $('#resultado6').html('<strong>¡Error!</strong> Este campo es requerido, no debe ir vacío.');
            validacion6 = true;
        } else if (direc.length > 30 || direc.length < 5) {

            $('#resultado6').addClass('alert-danger');
            $('#resultado6').html('<strong>¡Error!</strong> Este campo debe contener mínimo 5 caracteres y máximo 30.');
            validacion6 = true;
        } else {
            $('#resultado6').removeClass('alert-danger');
            $('#resultado6').addClass('alert-success');
            $('#resultado6').html('Correcto!');
            validacion6 = false;
        }
    });

    // Validar Documento



    $('#documento').on('focusout', function () {
        var doc = $('#documento').val();
        var tipoDoc = $('#tipoDoc').val();
        var tipo = parseInt(tipoDoc);
        if (doc.trim() === '') {

            $('#resultado7').addClass('alert-danger');
            $('#resultado7').html('<strong>¡Error!</strong> Este campo es requerido, no debe ir vacío.');
            validacion7 = true;
        } else if (doc.length < 5 || doc.length > 20 || isNaN(doc) && tipo === 1) {

            $('#resultado7').html('<strong>¡Error!</strong> ¡Error! Este campo debe contener mínimo 5 caracteres y máximo 20 y el documento debe ser numerico.');
            $('#resultado7').addClass('alert-danger');

            validacion7 = true;
        } else if (doc.length < 5 || doc.length > 20 && tipo === 2) {

            $('#resultado7').addClass('alert-danger');
            $('#resultado7').html('<strong>¡Error!</strong> ¡Error! Este campo debe contener mínimo 5 caracteres y máximo 20');

            validacion7 = true;
        } else if (doc.length < 5 || doc.length > 20 || isNaN(doc) && tipo === 3) {
            $('#resultado7').html('<strong>¡Error!</strong> ¡Error! Este campo debe contener mínimo 5 caracteres y máximo 20 y el documento debe ser numerico.');
            $('#resultado7').addClass('alert-danger');

            validacion7 = true;

        } else {
            $('#resultado7').removeClass('alert-danger');
            $('#resultado7').addClass('alert-success');
            $('#resultado7').html('Correcto!');
            validacion7 = false;

        }
        console.log(tipoDoc);
    });
    //validar contraseña
    $('#contra1').on('focusout', function () {
        var contra = $('#contra1').val();
        if (contra.trim() === '') {
            $('#resultado8').removeClass('alert-success');
            $('#resultado8').removeClass('alert-warning');
            $('#resultado8').addClass('alert-danger');
            $('#resultado8').html('<strong>¡Error!</strong> Este campo es requerido, no debe ir vacío.');
            validacion8 = true;
            validacion4 = false;
        } else {

        }

    });

    //Validar fuerza contraseña
    $('#contra1').keyup(function (e) {
        var strongRegex = new RegExp("^(?=.{8,})(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*\\W).*$", "g");
        var mediumRegex = new RegExp("^(?=.{7,})(((?=.*[A-Z])(?=.*[a-z]))|((?=.*[A-Z])(?=.*[0-9]))|((?=.*[a-z])(?=.*[0-9]))).*$", "g");
        var enoughRegex = new RegExp("(?=.{6,}).*", "g");
        if (false == enoughRegex.test($(this).val())) {
            $('#resultado8').removeClass('alert-danger');
            $('#resultado8').removeClass('alert-success');
            $('#resultado8').addClass('alert-danger');
            $('#resultado8').html('La contraseña debe ser minimo de 6 caracteres');
            validacion8 = true;
            validacion4 = true;
        } else if (strongRegex.test($(this).val())) {

            $('#resultado8').removeClass('alert-danger');
            $('#resultado8').removeClass('alert-warning');
            $('#resultado8').addClass('alert-success');
            $('#resultado8').html('La contraseña es segura!');
            validacion8 = false;
            validacion4 = false;
        } else if (mediumRegex.test($(this).val())) {
            $('#resultado8').removeClass('alert-danger');
            $('#resultado8').removeClass('alert-success');
            $('#resultado8').addClass('alert-warning');
            $('#resultado8').html('La contraseña es medianamente debil! debe llevar numeros y caracteres especiales');
            validacion8 = true;
            validacion4 = true;
        } else {
            $('#resultado8').removeClass('alert-success');
            $('#resultado8').removeClass('alert-warning');
            $('#resultado8').addClass = ('alert-danger');
            $('#resultado8').html('La contraseña es muy debil! Debe llevar mayusculas y minusculas');
            validacion8 = true;
            validacion4 = true;
        }
        return false;
    });
///validar contra2
    $('#contra2').on('focusout', function () {
        var cont2 = $('#contra2').val();
        var cont1 = $('#contra1').val();
        if (cont2.trim() === '') {
            $('#resultado9').removeClass('alert-success');
            $('#resultado9').addClass('alert-danger');
            $('#resultado9').html('<strong>¡Error!</strong> Este campo es requerido, digite su contraseña de nuevo.');
            validacion2 = false;
            validacion9 = true;
        } else {


        }
    });
//validar contra2 
    $('#contra2').keyup(function () {
        var cont2 = $('#contra2').val();
        var cont1 = $('#contra1').val();
        if (cont1 !== cont2) {
            $('#resultado9').removeClass('alert-success');
            $('#resultado9').addClass('alert-danger');
            $('#resultado9').html('<strong>¡Error!</strong> la contraseñas no coinsiden.');
            validacion9 = true;
            validacion2 = true;
        } else {
            $('#resultado9').removeClass('alert-danger');
            $('#resultado9').addClass('alert-success');
            $('#resultado9').html('<strong>¡Ok!</strong> la contraseñas si coinsiden.');
            validacion9 = false;
            validacion2 = true;
        }
    });


//No permite enviar el formulario hasta que el retorno sea TRUE
    $("#form-register").submit(function () {
        if (validacion1) {///nombre1
            $(location).attr('href', '#nombre1');
            $('#nom1').focus();
            return false;
        } else if (validacion3) {///apellido1
            $(location).attr('href', '#apellido1');
            $('#ape1').focus();
            return false;
        } else if (validacion5 || error === true) {//correo
            $(location).attr('hreft', '#correo');
            $('#email').focus();
            return false;
        } else if (validacion6) {//direccion
            $(location).attr('hreft', '#direccion');
            $('#direccion').focus();
            return false;
        } else if (validacion7) {//documento
            $(location).attr('hreft', '#documento');
            $('#documento').focus();
            return false;
        } else if (validacion8) {
            $(location).attr('hreft', '#contra1');
            $('#contra1').focus();
            return false;
        } else if (validacion9) {
            $(location).attr('hreft', '#contra2');
            $('#contra2').focus();
            return false;
        } else if (validacion10) {
            $(location).attr('hreft', '#email1');
            $('#email').focus();
        }

        return true;


    });
    //Actualizar cuenta validar campos
    $("#edit-men").submit(function () {
        if (validacion1) {///nombre1
            $(location).attr('href', '#nombre1');
            $('#nom1').focus();
            return false;
        } else if (validacion3) {///apellido1
            $(location).attr('href', '#apellido1');
            $('#ape1').focus();
            return false;
        } else if (validacion5 || error === true) {//correo
            $(location).attr('hreft', '#correo');
            $('#email').focus();
            return false;
        } else if (validacion6) {//direccion
            $(location).attr('hreft', '#direccion');
            $('#direccion').focus();
            return false;
        } else if (validacion7) {//documento
            $(location).attr('hreft', '#documento');
            $('#documento').focus();
            return false;
        }

        return true;


    });

});
///tabla editable del menu AddUniformes.jsp  funcion de seleccion multiple 
$(document).ready(function () {
    $("#mytable #checkall").click(function () {
        if ($("#mytable #checkall").is(':checked')) {
            $("#mytable input[type=checkbox]").each(function () {
                $(this).prop("checked", true);
            });

        } else {
            $("#mytable input[type=checkbox]").each(function () {
                $(this).prop("checked", false);
            });
        }
    });

    $("[data-toggle=tooltip]").tooltip();
});









$(document).ready(function () {
    $(".dropdown").hover(
            function () {
                $('.dropdown-menu', this).not('.in .dropdown-menu').stop(true, true).slideDown("400");
                $(this).toggleClass('open');
            },
            function () {
                $('.dropdown-menu', this).not('.in .dropdown-menu').stop(true, true).slideUp("400");
                $(this).toggleClass('open');
            }
    );
});/*AMenu*/



/*Form eliminar de adduniforme.jsp enviar datos */
$(document).ready(function () {


    $(document).on('click', '.elimina', function (e) {
        e.preventDefault();
        var mostrar = $(this).attr('value');
        $('.idDelete').val(mostrar);

    });


    $(document).on('click', '.editar', function (e) {
        e.preventDefault();
        var mostrar = $(this).attr('value');
//    $('.idEdit').val(mostrar);

        $.ajax({//pasar por post datos al controlador
            url: 'editaruniforme.jsp',
            dataType: 'html',
            data: {'idUni': mostrar},
        }).done(function (data) {

            $('.formulario').html(data);

        });

    });




//        $.ajax({//pasar por post datos al controlador
//            url: 'CrearUniforme',
//            dataType: 'html',
//            method: 'POST',
//            data: {'txtOpc': 4},
//        }).done(function (data) {
//
//
//        });


//        $.ajax({
//            url: '',
//            dataType: 'html',
//        }).done(function (data) {
//            $('.build-list').html(data);


//    $(document).on('click', '.mandaredit', function (e) {
//        
//        var mostrar = $(this).attr('value');
//
//
//        $.ajax({//pasar por post datos al controlador
//            url: 'CrearUniforme',
//            dataType: 'html',
//            method: 'POST',
//            data: {'txtOpc': 3},
//        }).done(function (data) {
//
//
//        });
//
//
//
//    });

//    $(document).on('click', '.agregar', function (e) {
//        e.preventDefault();
//
//
//        $.ajax({
//            url: 'insertarUniforme.jsp',
//            dataType: 'html',
//        }).done(function (data) {
//            $('.insert').html(data);
//        });
//    });
//        
//        
//        $.ajax({
//            url: 'editarUniforme.jsp?accion=2&id=+'+mostrar,
//            dataType: 'html',
//        }).done(function (data) {
//            $('.build-list').html(data);
//        });


//        $.ajax({//pasar por post datos al controlador
//            url: 'editarUniforme.jsp',
//            dataType: 'html',
//            method: 'POST',
//            data: {'accion':3, id: mostrar},
//        }).done(function (data) {
//            $('.build-list').html(data);
//        });
});





//$(document).ready(function () {
//
//    var valor = $('.sel').val().attr('value');
//    $("#opTipoU > option[value=" + valor + "]").attr('selected', 'selected');
////    var valor = $('.sel').val().attr('value');
////    $("#opTipoU option[value=" + valor + "]").attr("selected", true);
//////    $('#paises > option[value="valor"]').attr('selected', 'selected');
//});



//
//$(".btn").click(function (e) {
//
//    var file = $("#imgInp").val();  //Fetch the filename of the submitted file
//    //Check file extension
//    var ext = file.split('.').pop().toLowerCase();   //Check file extension if valid or expected
//    if (file == '') {    //Check if a file was selected
//        //Place warning text below the upload control
//        $("#answereJs2").html("Please select a file first.");
//        e.preventDefault();
//
//    } else {
//
//        if ($.inArray(ext, ['jpeg', 'jpg', 'png']) === -1) {
//            $("#answereJs2").html("Seleccione una imagen (jpeg,jpg,png).");
////        e.preventDefault(); //Prevent submission of form
//        }
//    }
//
//
//});


$(document).on('click', '.btnsubir', function (e) {
    var input = $('.imgsubir').val();
    var ext = input.split('.').pop().toLowerCase();
    if (input == '') {
        e.preventDefault();
        $('#respuesta1').html('<strong>¡Error!</strong> Debe subir una imagen.');
    } else if ($.inArray(ext, ['jpeg', 'jpg', 'png']) === -1) {
        $("#respuesta1").html("Seleccione un formato valido de imagen (jpeg,jpg,png).");
        e.preventDefault();
    } else {
        $('#respuesta1').html('');
    }
});
/*subir archivo*/







//SUBE IMAGEN(NOMBRE LA PREVISUALIZA, y Valida el tamaño )
$(document).ready(function () {
    var tamanoImagen = false;
    var nomUniforme = false;
    var descUniforme = false;
    var validarSujeto1 = new RegExp(/^[a-z\d_]{15,35}$/i);
    var validarSujeto2 = new RegExp(/^[a-z\d_]{15,45}$/i);

    $("#imgInp").change(function (e) {
        var _URL = window.URL;
        var respuesta = false;
        var file, img, origin_file;
        origin_file = this;
        if ((file = this.files[0])) {
            img = new Image();
            img.onload = function () {
                //#img-upload
                if (this.width == 330 && this.height == 660) {//Valida tamaño de imagen 
                    $("#respuesta1").html("");
                    readURL(origin_file);
                    return tamanoImagen = false;//retorna falso si todo esta correcto

                } else {
                    $('#img-upload').attr('src', "");
                    $("#respuesta1").html("La imagen debe ser de un tamaño de 800x500 pixeles.");
                    return tamanoImagen = true;
                }

            };
            img.src = _URL.createObjectURL(file);
        }
//15 maximo 45




    });


    /*Valida Nombre Uniforme*/
    $('#txtnombre').on('focusout', function () {
        var nombreUn = $('#txtnombreU').val();

        if (false == validarSujeto1.test(nombreUn) || nombreUn.trim() == '') {
            $('#respuesta2').html('<strong>¡Error!</strong> ¡Error! Este campo debe contener mínimo 15 caracteres y máximo 35.');
            $('#respuesta2').addClass('alert-danger');
            return nomUniforme = true;

        } else {

            $('#respuesta2').html('');
            return nomUniforme = false;
        }


    });



    $('#textareaDescri').on('focusout', function () {
        var descUni = $('#textareaDescrip').val();

        if (false == validarSujeto2.test(descUni) || descUni.trim() === '') {
            $('#respuesta3').html('<strong>¡Error!</strong> ¡Error! Este campo debe contener mínimo 15 caracteres y máximo 45.');
            $('#respuesta3').addClass('alert-danger');
            return descUniforme = true;

        } else {

            $('#respuesta3').html('');
            return descUniforme = false;
        }


    });

    $("#form-AddUniforme").submit(function () {
        if (tamanoImagen) {
            return false;
        } else if (nomUniforme) {
            return false;
        } else if (descUniforme) {
            return false;

        }
        return true;

    });























    $(document).on('change', '.btn-file :file', function () {
        var input = $(this),
                label = input.val().replace(/\\/g, '/').replace(/.*\//, '');
        input.trigger('fileselect', [label]);
    });

    $('.btn-file :file').on('fileselect', function (event, label) {

        var input = $(this).parents('.input-group').find(':text'),
                log = label;

        if (input.length) {
            input.val(log);
        } else {
            if (log)
                alert(log);
        }

    });
    function readURL(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {
                $('#img-upload').attr('src', e.target.result);
            }
            reader.readAsDataURL(input.files[0]);
        }
    }

});

/*CATALOGO*/
/*NUEVO CATALOGO*/
$(document).ready(function () {

    $(".largeGrid").click(function () {
        $(this).find('a').addClass('active');
        $('.smallGrid a').removeClass('active');

        $('.product').addClass('large').each(function () {
        });
        setTimeout(function () {
            $('.info-large').show();
        }, 200);
        setTimeout(function () {

            $('.view_gallery').trigger("click");
        }, 400);

        return false;
    });

    $(".smallGrid").click(function () {
        $(this).find('a').addClass('active');
        $('.largeGrid a').removeClass('active');

        $('div.product').removeClass('large');
        $(".make3D").removeClass('animate');
        $('.info-large').fadeOut("fast");
        setTimeout(function () {
            $('div.flip-back').trigger("click");
        }, 400);
        return false;
    });

    $(".smallGrid").click(function () {
        $('.product').removeClass('large');
        return false;
    });

    $('.colors-large a').click(function () {
        return false;
    });


    $('.product').each(function (i, el) {

        // Lift card and show stats on Mouseover
        $(el).find('.make3D').hover(function () {
            $(this).parent().css('z-index', "20");
            $(this).addClass('animate');
            $(this).find('div.carouselNext, div.carouselPrev').addClass('visible');
        }, function () {
            $(this).removeClass('animate');
            $(this).parent().css('z-index', "1");
            $(this).find('div.carouselNext, div.carouselPrev').removeClass('visible');
        });

        // Flip card to the back side
        $(el).find('.view_gallery').click(function () {

            $(el).find('div.carouselNext, div.carouselPrev').removeClass('visible');
            $(el).find('.make3D').addClass('flip-10');
            setTimeout(function () {
                $(el).find('.make3D').removeClass('flip-10').addClass('flip90').find('div.shadow').show().fadeTo(80, 1, function () {
                    $(el).find('.product-front, .product-front div.shadow').hide();
                });
            }, 50);

            setTimeout(function () {
                $(el).find('.make3D').removeClass('flip90').addClass('flip190');
                $(el).find('.product-back').show().find('div.shadow').show().fadeTo(90, 0);
                setTimeout(function () {
                    $(el).find('.make3D').removeClass('flip190').addClass('flip180').find('div.shadow').hide();
                    setTimeout(function () {
                        $(el).find('.make3D').css('transition', '100ms ease-out');
                        $(el).find('.cx, .cy').addClass('s1');
                        setTimeout(function () {
                            $(el).find('.cx, .cy').addClass('s2');
                        }, 100);
                        setTimeout(function () {
                            $(el).find('.cx, .cy').addClass('s3');
                        }, 200);
                        $(el).find('div.carouselNext, div.carouselPrev').addClass('visible');
                    }, 100);
                }, 100);
            }, 150);
        });

        // Flip card back to the front side
        $(el).find('.flip-back').click(function () {

            $(el).find('.make3D').removeClass('flip180').addClass('flip190');
            setTimeout(function () {
                $(el).find('.make3D').removeClass('flip190').addClass('flip90');

                $(el).find('.product-back div.shadow').css('opacity', 0).fadeTo(100, 1, function () {
                    $(el).find('.product-back, .product-back div.shadow').hide();
                    $(el).find('.product-front, .product-front div.shadow').show();
                });
            }, 50);

            setTimeout(function () {
                $(el).find('.make3D').removeClass('flip90').addClass('flip-10');
                $(el).find('.product-front div.shadow').show().fadeTo(100, 0);
                setTimeout(function () {
                    $(el).find('.product-front div.shadow').hide();
                    $(el).find('.make3D').removeClass('flip-10').css('transition', '100ms ease-out');
                    $(el).find('.cx, .cy').removeClass('s1 s2 s3');
                }, 100);
            }, 150);

        });

        makeCarousel(el);
    });

    $('.add-cart-large').each(function (i, el) {
        $(el).click(function () {
            var carousel = $(this).parent().parent().find(".carousel-container");
            var img = carousel.find('img').eq(carousel.attr("rel"))[0];
            var position = $(img).offset();

            var productName = $(this).parent().find('h4').get(0).innerHTML;

            $("body").append('<div class="floating-cart"></div>');
            var cart = $('div.floating-cart');
            $("<img src='" + img.src + "' class='floating-image-large' />").appendTo(cart);

            $(cart).css({'top': position.top + 'px', "left": position.left + 'px'}).fadeIn("slow").addClass('moveToCart');
            setTimeout(function () {
                $("body").addClass("MakeFloatingCart");
            }, 800);

            setTimeout(function () {
                $('div.floating-cart').remove();
                $("body").removeClass("MakeFloatingCart");


                var cartItem = "<div class='cart-item'><div class='img-wrap'><img src='" + img.src + "' alt='' /></div><span>" + productName + "</span><strong>$39</strong><div class='cart-item-border'></div><div class='delete-item'></div></div>";

                $("#cart .empty").hide();
                $("#cart").append(cartItem);
                $("#checkout").fadeIn(500);

                $("#cart .cart-item").last()
                        .addClass("flash")
                        .find(".delete-item").click(function () {
                    $(this).parent().fadeOut(300, function () {
                        $(this).remove();
                        if ($("#cart .cart-item").size() == 0) {
                            $("#cart .empty").fadeIn(500);
                            $("#checkout").fadeOut(500);
                        }
                    })
                });
                setTimeout(function () {
                    $("#cart .cart-item").last().removeClass("flash");
                }, 10);

            }, 1000);


        });
    })

    /* ----  Image Gallery Carousel   ---- */
    function makeCarousel(el) {


        var carousel = $(el).find('.carousel ul');
        var carouselSlideWidth = 315;
        var carouselWidth = 0;
        var isAnimating = false;
        var currSlide = 0;
        $(carousel).attr('rel', currSlide);

        // building the width of the casousel
        $(carousel).find('li').each(function () {
            carouselWidth += carouselSlideWidth;
        });
        $(carousel).css('width', carouselWidth);

        // Load Next Image
        $(el).find('div.carouselNext').on('click', function () {
            var currentLeft = Math.abs(parseInt($(carousel).css("left")));
            var newLeft = currentLeft + carouselSlideWidth;
            if (newLeft == carouselWidth || isAnimating === true) {
                return;
            }
            $(carousel).css({'left': "-" + newLeft + "px",
                "transition": "300ms ease-out"
            });
            isAnimating = true;
            currSlide++;
            $(carousel).attr('rel', currSlide);
            setTimeout(function () {
                isAnimating = false;
            }, 300);
        });

        // Load Previous Image
        $(el).find('div.carouselPrev').on('click', function () {
            var currentLeft = Math.abs(parseInt($(carousel).css("left")));
            var newLeft = currentLeft - carouselSlideWidth;
            if (newLeft < 0 || isAnimating === true) {
                return;
            }
            $(carousel).css({'left': "-" + newLeft + "px",
                "transition": "300ms ease-out"
            });
            isAnimating = true;
            currSlide--;
            $(carousel).attr('rel', currSlide);
            setTimeout(function () {
                isAnimating = false;
            }, 300);
        });
    }

    $('.sizes a span, .categories a span').each(function (i, el) {
        $(el).append('<span class="x"></span><span class="y"></span>');

        $(el).parent().on('click', function () {
            if ($(this).hasClass('checked')) {
                $(el).find('.y').removeClass('animate');
                setTimeout(function () {
                    $(el).find('.x').removeClass('animate');
                }, 50);
                $(this).removeClass('checked');
                return false;
            }

            $(el).find('.x').addClass('animate');
            setTimeout(function () {
                $(el).find('.y').addClass('animate');
            }, 100);
            $(this).addClass('checked');
            return false;
        });
    });
    /*animacion agregar al catalogo */
    /*$('.add_to_cart').click(function(){
     var productCard = $(this).parent();
     var position = productCard.offset();
     var productImage = $(productCard).find('img').get(0).src;
     var productName = $(productCard).find('.product_name').get(0).innerHTML;                
     
     $("body").append('<div class="floating-cart"></div>');      
     var cart = $('div.floating-cart');      
     productCard.clone().appendTo(cart);
     $(cart).css({'top' : position.top + 'px', "left" : position.left + 'px'}).fadeIn("slow").addClass('moveToCart');        
     setTimeout(function(){$("body").addClass("MakeFloatingCart");}, 800);
     setTimeout(function(){
     $('div.floating-cart').remove();
     $("body").removeClass("MakeFloatingCart");
     
     
     var cartItem = "<div class='cart-item'><div class='img-wrap'><img src='"+productImage+"' alt='' /></div><span>"+productName+"</span><strong>$39</strong><div class='cart-item-border'></div><div class='delete-item'></div></div>";         
     
     $("#cart .empty").hide();           
     $("#cart").append(cartItem);
     $("#checkout").fadeIn(500);
     
     $("#cart .cart-item").last()
     .addClass("flash")
     .find(".delete-item").click(function(){
     $(this).parent().fadeOut(3, function(){
     $(this).remove();
     if($("#cart .cart-item").size() == 0){
     $("#cart .empty").fadeIn(500);
     $("#checkout").fadeOut(500);
     }
     })
     });
     setTimeout(function(){
     $("#cart .cart-item").last().removeClass("flash");
     }, 100 );
     
     }, 1000);
     });*/
});

/*jefer- funtion imagenes para canvas */

/*canvas*/

function draw(direction) {
    var c = document.getElementById("myCanvas");
    var ctx = c.getContext("2d");
    ctx.clearRect(0, 0, c.width, c.height);
    var img = document.getElementById("lamp");
    var pat = ctx.createPattern(img, direction);
    ctx.rect(0, 0, 400, 500);
    ctx.fillStyle = pat;
    ctx.fill();
}
function draw2(direction2) {
    var c = document.getElementById("myCanvas");
    var ctx = c.getContext("2d");
    ctx.clearRect(0, 0, c.width, c.height);
    var img2 = document.getElementById("lam");
    var pat = ctx.createPattern(img2, direction2);
    ctx.rect(0, 0, 400, 500);
    ctx.fillStyle = pat;
    ctx.fill();
}
function draw3(direction2) {
    var c = document.getElementById("myCanvas");
    var ctx = c.getContext("2d");
    ctx.clearRect(0, 0, c.width, c.height);
    var img2 = document.getElementById("lampa");
    var pat = ctx.createPattern(img2, direction2);
    ctx.rect(0, 0, 400, 500);
    ctx.fillStyle = pat;
    ctx.fill();
}
/*inicio administrador-redes sociales */

$(document).ready(function () {
  $('.material-button-toggle').on("click", function () {
    $(this).toggleClass('open');
    $('.option').toggleClass('scale-on');
  });
});

/*inicio administrador-contenido */
var activeEl = 2;
$(function () {
  var items = $('.btn-nav');
  $(items[activeEl]).addClass('active');
  $(".btn-nav").click(function () {
    $(items[activeEl]).removeClass('active');
    $(this).addClass('active');
    activeEl = $(".btn-nav").index(this);
  });
});

/*calendario*/
$(function () {
  $('#datetimepicker12').datetimepicker({
    inline: true,
    sideBySide: true
  });
});


