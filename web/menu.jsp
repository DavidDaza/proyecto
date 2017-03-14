<%-- 
    Document   : menu
    Created on : 12-ago-2016, 10:13:04
    Author     : David
--%>

<%@page import="modelo.BEAN.BeanUsuario"%>
<%@page import="modelo.DAO.DaoUsuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8" errorPage="Error404.jsp"%>
<% HttpSession sesion = request.getSession(false);
  String usuario = (String) sesion.getAttribute("usuario");
  String admin = (String) sesion.getAttribute("admin");

  String correo = (String) sesion.getAttribute("correo");

  if (sesion.getAttribute("usuario") == null && sesion.getAttribute("admin") == null) {
    response.sendRedirect("login.jsp");
  }

%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
    <link rel="shortcut icon" href="imagenes/icono.png">  
    <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
    <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link href="css/_css.css" rel="stylesheet" type="text/css"/>

    <title>Menu</title>
  </head>

  <body >
    <nav class="navbar navbar-inverse" >
      <div class="container">
        <div class="container-fluid">
          <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>                        
            </button>
            <a class="navbar-brand" href="menu.jsp"><img src="imagenes/icono.png" alt=""/></a>

          </div>
          <div class="collapse navbar-collapse" id="myNavbar">
            <ul class="nav navbar-nav">
              <li class="active"><a href="menu.jsp">Inicio</a></li>
              <li><a href="Disena1.jsp">Crear Uniforme</a></li>
              <li><a href="#">¿Quienes somos?</a></li>
              <li><a href="#">Contactenos</a></li>
            </ul>


            <%                            BeanUsuario dao = new BeanUsuario();
              DaoUsuario daous = new DaoUsuario();
              dao.setCorreo(correo);
              daous.contruirObjetoUsuario(dao);
            %>


            <ul class="nav navbar-nav navbar-right">
              <li class="dropdown">
                <a href="#"  data-toggle="dropdown"><img src="imagenes/avatar3.png" alt=""/><b> <%= dao.getNombre1()%></b> <span class="caret"></span></a>
                <ul class="dropdown-menu">
                  <li><a href="#" data-target="#myModal" data-toggle="modal">Editar mi cuenta <span class="glyphicon glyphicon-cog pull-right"></span></a></li>
                  <li class="divider"></li>
                  <li><a href="#">Mensajes <span class="badge pull-right"> 0 </span></a></li>
                  <li class="divider"></li>
                  <li><a href="#">Mis Pedidos <span class="glyphicon glyphicon-heart pull-right"></span></a></li>
                  <li class="divider"></li>
                  <li><a href="iniciar?textOpcion=3">Salir<span class="glyphicon glyphicon-log-out pull-right"></span></a></li>  
                  <li class="divider"></li>

                </ul>
              </li>
            </ul>

            <!--Editar cuenta--->
            <div id="myModal" class="modal fade" aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" style="display: none;">
              <div class="modal-dialog">
                <div class="modal-content">
                  <div class="modal-header">
                    <div class="modal-body"> 

                      <form role="form" id="edit-menu" name="editar" method="post" action="iniciar">         
                        <div class="form-group">

                          <label for="primer_nombre">Primer Nombre:</label>
                          <a name="nombre1"></a>
                          <input type="text" id="nom1" class="form-control" name="nombre1" value="<%= dao.getNombre1()%>"  autofocus >
                          <div class="message alert-danger" id="resultado1"></div>

                          <a name="nombre2"></a>
                          <label for="segundo_nombre">Segundo Nombre:</label>
                          <input type="text" id="nom2" class="form-control"  name="nombre2" value="<%= dao.getNombre2()%>">
                          <div class="message alert-danger" id="resultado2"></div>

                          <a name="apellido1"></a>
                          <label for="primer_apellido">Primer Apellido:</label>
                          <input type="text" id="ape1" class="form-control"  name="apellido1" value="<%= dao.getApellido1()%>">
                          <div class="message alert-danger" id="resultado3"></div>

                          <a name="apellido2"></a>
                          <label for="segundo_apellido">Segundo Apellido:</label>
                          <input type="text" id="ape2" class="form-control" name="apellido2" value="<%= dao.getApellido2()%>">
                          <div class="message alert-danger" id="resultado4"></div>

                          <a name="direccion"></a>
                          <label for="direccion">Dirección:</label>
                          <input type="text" id="direccion" class="form-control" name="direccion" value="<%= dao.getDireccion()%>">
                          <div class="message alert-danger" id="resultado6"></div>

                          <a name="contra1"></a>
                          <label for="contraseña">Contraseña:</label>
                          <input type="password" id="contra1" class="form-control" name="pass" placeholder="Ingrese Contraseña">
                          <div class="message alert-danger" id="resultado8"></div>

                          <a name="contra2"></a>
                          <label for="confirmar_contraseña">Confirmar Contraseña:</label>
                          <input type="password" id="contra2" class="form-control" name="pass2" placeholder="Confirmar Contraseña">
                          <div class="message alert-danger" id="resultado9"></div>
                        </div>


                        <br>
                        <button  class="btn btn-primary" >Guardar</button>
                        <input type="hidden" name="textOpcion" value="5">
                        <input class="btn btn-default" data-dismiss="modal" type="button" value="Cerrar">
                      </form>


                    </div>
                    <div class="modal-footer">
                    </div>
                  </div>
                </div>


              </div>
            </div>
          </div>
          </nav>

          <!--inicio usuario-prueba-->
  <h1 alight="center">!!Estas perdido!!</h1>
  <h1 class="glyphicon glyphicon-arrow-down"></h1>

          <div class="container text-center">


            <!-- Large modal -->
            <button class="btn btn-default" data-toggle="modal" data-target=".bs-example-modal-lg">clic aqui</button>

            <div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
              <div class="modal-dialog modal-lg">
                <div class="modal-content">
                  <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">

                   
                    <!-- Wrapper for slides -->
                    <div class="carousel-inner">
                      <div class="item active">
                        <img class="img-responsive" src="imagenes/slide1.png" alt="">
                        <div class="carousel-caption">
                          One Image
                        </div>
                      </div>
                      <div class="item">
                        <img class="img-responsive" src="imagenestutorial/index/INICIO2.png" alt="">
                        <div class="carousel-caption">
                          Another Image
                        </div>
                      </div>
                      <div class="item">
                        <img class="img-responsive" src="http://placehold.it/1200x600/fcf00c/000&text=Three" alt="">
                        <div class="carousel-caption">
                          Another Image
                        </div>
                      </div>
                    </div>

                    <!-- Controls -->
                    <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
                      <span class="glyphicon glyphicon-chevron-left"></span>
                    </a>
                    <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
                      <span class="glyphicon glyphicon-chevron-right"></span>
                    </a>
                  </div>
                </div>
              </div>
            </div>
          </div>


          <footer class="container-fluid text-center">
            <p>Footer ® David Daza</p>
          </footer>
          <script src="js/jquery.js" type="text/javascript"></script>
          <script src="js/_jss.js" type="text/javascript"></script>
          <script src="js/bootstrap.min.js" type="text/javascript"></script>
          </body>
          </html>
