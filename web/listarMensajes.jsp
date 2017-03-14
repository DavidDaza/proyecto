<%-- 
    Document   : menu_listar
    Created on : 15-ago-2016, 0:00:16
    Author     : jhon
--%>



<%@page import="java.util.ArrayList"%>
<%@page import="modelo.DAO.DaoMensaje"%>
<%@page import="modelo.BEAN.BeanMensaje"%>
<%@page import="modelo.DAO.DaoUsuario"%>
<%@page import="modelo.BEAN.BeanUsuario"%>



<%@page contentType="text/html" pageEncoding="UTF-8" errorPage="Error404.jsp"%>
<% HttpSession sesion = request.getSession(false);
  String admin = (String) sesion.getAttribute("admin");
  String usuario = (String) sesion.getAttribute("usuario");
  String nombre = (String) sesion.getAttribute("nombre");

  if (sesion.getAttribute("usuario") != null) {
    response.sendRedirect("menu.jsp");
  } else if (sesion.getAttribute("admin") == null) {
    response.sendRedirect("login.jsp");
  }


%>
<!DOCTYPE html>
<html class="ht">
  <head>

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
    <link rel="shortcut icon" href="imagenes/icono.png">  
    <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
    <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link href="css/_css.css" rel="stylesheet" type="text/css"/>
    <!--link redes sociales-->
    <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
    <link href="css/css.redessociales.css" rel="stylesheet" type="text/css"/>
    <!--fin redes sociales-->
    <title>Lista de Usuarios</title>
  </head>
  <body class="bd">

    <%            BeanUsuario beanUs = new BeanUsuario();
      DaoUsuario daoUs = new DaoUsuario();
      beanUs.setCorreo(admin);
      daoUs.contruirObjetoUsuario(beanUs);
      BeanMensaje beanMs = new BeanMensaje();
      DaoMensaje daoMs = new DaoMensaje();

    %>

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

              <li class=""><a href="menuAdmin.jsp">Inicio</a></li>

              <!--Menu desplegable-->
              <li class="dropdown ">

                <a href="#" class="glyphicon glyphicon-wrench " data-toggle="dropdown" > Opciones  <span class="caret "></span> </a>

                <ul class="dropdown-menu ">

                  <li class="col-sm-3">
                  <li><a href="menuA_listar.jsp?pagina=0"><i class="glyphicon glyphicon-list"></i> Listar de Usuarios </a></li>



                </ul>
              </li>
              <!--Menu fin desplegable-->
              <!--Menu desplegable-->
              <li class="dropdown ">

                <a href="#" class="glyphicon glyphicon-option-vertical " data-toggle="dropdown" > Agregar/Editar  <span class="caret "></span> </a>

                <ul class="dropdown-menu ">

                  <li class="col-sm-3">
                  <li><a href="Adduniformes.jsp"><i class="glyphicon glyphicon-tasks"></i> Uniformes Catalogo </a></li>
                  <li><a href=""><i class="glyphicon glyphicon-question-sign"></i> Prendas </a></li>
                  <li><a href=""><i class="glyphicon glyphicon-question-sign"></i> Instituciones </a></li>



                </ul>
              </li>
              <!--Menu fin desplegable-->
              <!--Menu desplegable-->
              <li class="dropdown ">
                <div class="col-md-12">

                  <ul class="social-network social-circle">                   
                    <li><a href="#" class="icoFacebook" title="Facebook"><i class="fa fa-facebook"></i></a></li>
                    <li><a href="#" class="icoTwitter" title="Twitter"><i class="fa fa-twitter"></i></a></li>                    
                  </ul>				
                </div>
              </li>
              <!--Menu fin desplegable-->




            </ul>


            <ul class="nav navbar-nav navbar-right">
              <li class="dropdown">
                <a href="#" data-toggle="dropdown"><img src="imagenes/avatar4.png" alt=""/><b> <%= beanUs.getNombre1()%></b> <span class="caret"></span></a>
                <ul class="dropdown-menu">
                  <li><a href="listarMensajes.jsp"><i class="icon-envelope"></i> Mensajes <span class="badge badge-info">4</span></a></li>
                  <li><a href="iniciar?textOpcion=3">Salir<span class="glyphicon glyphicon-log-out pull-right"></span></a></li>  
                  <li class="divider"></li>

                </ul>
              </li>
            </ul>
          </div>



        </div>
      </div>
    </nav>

    <!--Fin menu superior-->


    <div class="container">



      <div class="row">

        <h2>Mensajes</h2>
        <p class="lead">
          Mensajes en la base de datos
        </p>

        <div class="alert alert-info">
          <h4>Lista de Mensajes</h4>
          <p>Aqui podra ver los mensajes enviados por los clientes </p>

        </div>
        <div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1 form-group">

          <div class="input-group buscador-principal">    					
            <input name="search_param" value="all" id="search_param" type="hidden">         
            <input class="form-control" name="x" placeholder="¿Buscar Mensaje?" type="text">

            <span class="input-group-btn">
              <button class="btn btn-primary" type="button"><span class="glyphicon glyphicon-search"></span> BUSCAR</button>
            </span>
          </div>
        </div>


        <%int pagina = 0; //pagina a mostrar
          if (request.getParameter("pagina") == null) {
            pagina = 0;
          } else {
            pagina = Integer.parseInt(request.getParameter("pagina"));
          }


        %>

        <table id="mytable" class="table table-bordred table-striped ">

          <tr>
            <th>Nº</th>
            <th>Nombre</th>
            <th>Apellido</th>
            <th>Correo</th>
            <th>Empresa</th>
            <th>Fecha</th>
            <th>Asunto</th>
            <th>Mensaje</th>

          </tr>

          <%                            ArrayList<BeanMensaje> listaMensaje = daoMs.listarMensajes(pagina * 10, 10);

            int cont = pagina * 10;

                      for (BeanMensaje listaMensajes : listaMensaje) {%>
          <tr>
            <td><%=cont + 1%></td>
            <td><%= listaMensajes.getNombre()%> </td>
            <td><%= listaMensajes.getApellido()%> </td>
            <td><%= listaMensajes.getCorreo()%> </td>
            <td><%= listaMensajes.getEmpresa()%> </td>
            <td><%= listaMensajes.getFecha()%> </td>
            <td><%= listaMensajes.getAsunto()%> </td>
            <td><textarea disabled="" class="txtareal"><%= listaMensajes.getMensaje()%></textarea> </td>

          </tr>
          <% cont++;
                      }%>

        </table>   



        <ul class="pagination pull-left">



          <%if (pagina > 0) {%> 
          <li class=""><a href="?pagina=<%=pagina - 1%>"><span class="glyphicon glyphicon-chevron-left"></span></a></li>
              <%} else {%>
          <li class="disabled"><a ><span class="glyphicon glyphicon-chevron-left"></span></a></li>
              <%}%>
              <%
                int numeroRegistros = daoMs.verRegistrosMensajes();
                int numerPagina = numeroRegistros / 10;

                for (int i = 0; i <= numerPagina; i++) {

                  if (i == pagina) {
              %>
          <li class="active"><a href="?pagina=<%=(i)%>"><%=i + 1%></a></li> 

          <%} else {
          %>
          <li class=""><a href="?pagina=<%=(i)%>"><%=i + 1%></a></li> 

          <%}
                      }%>
          <%if (pagina < numerPagina) {%> 
          <li><a href="?pagina=<%=pagina + 1%>"><span class="glyphicon glyphicon-chevron-right"></span></a></li>

          <%} else {%>
          <li class="disabled" ><a><span class="glyphicon glyphicon-chevron-right"></span></a></li>

          <%}%>
        </ul>




      </div>
    </div>




    <footer class="container-fluid text-center">
      <p>Footer ® David Daza</p>
    </footer>
    <script src="js/jquery.js" type="text/javascript"></script>
    <script src="js/bootstrap.min.js" type="text/javascript"></script>
    <script src="js/_js.js" type="text/javascript"></script>
  </body>
</html>