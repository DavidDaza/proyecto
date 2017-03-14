<%-- 
    Document   : prueba
    Created on : 1/03/2017, 06:40:46 PM
    Author     : Andrés
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Frameset//EN" "http://www.w3.org/TR/html4/frameset.dtd">
<html>
  <head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>TUniforme</title>

    <!-- Bootstrap Core CSS -->
    <link rel="shortcut icon" href="imagenes/icono.png">  
    <link href="css/bootstrap_1.css" rel="stylesheet" type="text/css"/>
    <link href="css/bootstrap.min_2.css" rel="stylesheet" type="text/css"/>
    <link href="css/_css.css" rel="stylesheet" type="text/css"/>
    <link href="css/business-casual.css" rel="stylesheet" type="text/css"/>

    <!-- Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Josefin+Slab:100,300,400,600,700,100italic,300italic,400italic,600italic,700italic" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

  </head>

  <body>


    <div class="brand"><img src="imagenes/logotipotuniforme.png" alt=""/></div>




    <!-- Navigation -->
  <nav class="navbar navbar-default" role="navigation">
    <div class="container">

      <!-- Brand and toggle get grouped for better mobile display -->
      <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
          <span class="sr-only">Toggle navigation</span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
        </button>

      </div>
      <!-- Collect the nav links, forms, and other content for toggling -->
      <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
        <ul class="nav navbar-nav">
          <li class="active"><a href="index.jsp">Inicio</a></li>
          <li><a href="catalogo.jsp">Catálogo</a></li>
          <li><a href="QuienesSomos.jsp">¿Quienes somos?</a></li>
          <li><a href="contactenos.jsp">Contactenos</a></li>
        </ul>

        <ul class="nav navbar-nav navbar-right">



          <li class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown"><b>Login</b> <span class="glyphicon glyphicon-log-in"></span></a>
            <ul id="login-dp" class="dropdown-menu">

              <div class="row">
                <div class="col-md-12">

                  <label>Login </label>              


                  <form class="form" role="form" method="post" action="iniciar" accept-charset="UTF-8" id="login-nav">
                    <div class="form-group">

                      <label class="sr-only  " for="correo">Correo Electronico</label>
                      <input type="email" class="form-control" name="correo" placeholder="Email address" required>
                    </div>
                    <div class="form-group">

                      <label class="sr-only" for="pass">Contraseña</label>
                      <input type="password" class="form-control" name="pass" placeholder="Password" required>
                      <div class="help-block text-right"><a href="">¿Olvido su contraseña?</a></div>
                      <div class="help-block text-right"><a href="registro.jsp">¿Registrarse?</a></div>
                    </div>
                    <div class="form-group">
                      <input type="submit" class="btn btn-primary btn-block" value="Ingresar">
                      <input type="hidden" name="textOpcion" value="1">
                    </div>

                  </form>
                </div>
              </div>

            </ul>
            </div>
            <!-- /.navbar-collapse -->
            </div>
            <!-- /.container -->
            </nav>

            <div class="container">

              <div class="row">
                <div class="box">
                  <div class="col-lg-12 text-center">
                    <div id="carousel-example-generic" class="carousel slide">
                      <!-- Indicators -->
                      <ol class="carousel-indicators hidden-xs">
                        <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                        <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                        <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                      </ol>

                      <!-- Wrapper for slides -->
                      <div class="carousel-inner">
                        <div class="item active">
                          <img class="img-responsive img-full" src="imagenes/slide1.png" alt="">
                        </div>
                        <div class="item">
                          <img class="img-responsive img-full" src="imagenes/prueba4.png" alt="">
                        </div>
                        <div class="item">
                          <img class="img-responsive img-full" src="imagenes/slide3.png" alt="">
                        </div>
                      </div>

                      <!-- Controls -->
                      <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
                        <span class="icon-prev"></span>
                      </a>
                      <a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
                        <span class="icon-next"></span>
                      </a>
                    </div>
                    <h2 class="brand-before">
                      <small>Bienvenido a</small>
                    </h2>
                    <h1 class="brand-name">Tuniforme</h1>
                    <hr class="tagline-divider">

                  </div>
                </div>
              </div>

              <div class="row">
                <div class="box">
                  <div class="col-lg-12">
                    <hr>
                    <h2 class="intro-text text-center">Todo Bien
                      <strong>vale la pena visitar</strong>
                    </h2>
                    <hr>
                    <img class="img-responsive img-border img-left" src="imagenes/todobien.png" alt="">
                    <hr class="visible-xs">
                    <p>Ofrecemos un amplio surtido de uniformes y ropa con excelente calidad.
                      Tuniforme realiza envíos con una amplia cobertura en la ciudad en mas de más de 1.000 productos.
                      En nuestra gama encontrará ropa infantil, ropa de mujer y hombre,como tambien lo son uniformes escolares,además de accesorios.</p>
                    <p>Como distribuidor o agente comercial, Tuniforme le ofrece un stock remanente de artículos escolares y prendas conocidas.
                      También le ofrecemos la posibilidad de comprar ropa,uniformes escolares y crear tu propio estilo en nuestra tienda online de comercio 
                      al por mayor.</p>

                  </div>
                </div>
              </div>

              <div class="row">
                <div class="box">
                  <div class="col-lg-12">
                    <hr>
                    <h2 class="intro-text text-center">
                      <strong>Nuestra Experiencia</strong>
                    </h2>
                    <hr>
                    <p>Llevamos mas de 30 años en la fabricación de ropa escolar mujer y hombre.
                      Toda la ropa se confecciona internamente, desde el tisaje hasta la confección, el acabado y el embalaje.
                      Cuenta con personal altamente cualificado: para el modelaje, tisaje, confección y control de calidad del producto acabado.
                      Nuestros puntos fuertes son la calidad superior de nuestros productos.</p>

                  </div>
                </div>
              </div>

            </div>
            <!-- /.container -->

          <footer>
            <div class="container">
              <div class="row">
                <div class="col-lg-12 text-center">
                  <li><a href="registro.jsp"><span class="glyphicon glyphicon-list-alt"></span> Regístrate</a></li>
                  <p>Copyright &copy; Your Website 2014</p>
                </div>
              </div>
            </div>
          </footer>

          <!-- jQuery -->
          <script src="js/bootstrap.js" type="text/javascript"></script>
          <script src="js/jquery_1.js" type="text/javascript"></script>
          <script src="js/bootstrap.min_1.js" type="text/javascript"></script>
          <script src="js/_js.js" type="text/javascript"></script>

          <!-- Script to Activate the Carousel -->
          <script>
            $('.carousel').carousel({
              interval: 5000 //changes the speed
            });
          </script>
          </body>
          </html>
