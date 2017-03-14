
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.BEAN.BeanUniforme"%>
<%@page import="modelo.BEAN.BeanUniforme"%>
<%@page import="modelo.DAO.DaoUniforme"%>
<%@page import="modelo.DAO.DaoUsuario"%>
<%@page import="modelo.BEAN.BeanUsuario"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : Adduniformes
    Created on : 31-oct-2016, 22:21:57
    Author     : Davidg//*/*/*/*/*/*/**/*/*/*/*/*/*/*/*/*/*/*/*/
    dsfsgdfgh

--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% HttpSession sesion = request.getSession(false);
    String usuario1 = (String) sesion.getAttribute("admin");
    String usuario2 = (String) sesion.getAttribute("usuario");
    String nombre = (String) sesion.getAttribute("nombre");

    if (sesion.getAttribute("usuario") != null) {
        response.sendRedirect("menu.jsp");
    } else if (sesion.getAttribute("admin") == null) {
        response.sendRedirect("login.jsp");
    }


%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="shortcut icon" href="imagenes/icono.png">  
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/_css.css" rel="stylesheet" type="text/css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Agregar Uniforme</title>
    </head>
    <body>

        <%  BeanUsuario beanUs = new BeanUsuario();
            DaoUsuario daoUs = new DaoUsuario();
            beanUs.setCorreo(usuario1);
            daoUs.contruirObjetoUsuario(beanUs);
            BeanUniforme beanUnif = new BeanUniforme();


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

                            <li><a href="menuAdmin.jsp">Inicio</a></li>

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
                                    <li><a href=""><i class="glyphicon glyphicon-tasks"></i> Uniformes Catalogo </a></li>
                                    <li><a href=""><i class="glyphicon glyphicon-question-sign"></i> Prendas </a></li>
                                    <li><a href=""><i class="glyphicon glyphicon-question-sign"></i> Instituciones </a></li>



                                </ul>
                            </li>
                            <!--Menu fin desplegable-->
                            <!--Menu desplegable-->
                            <li class="dropdown ">

                                <a href="#" class="glyphicon glyphicon-globe " data-toggle="dropdown" > Redes Sociales  <span class="caret "></span> </a>

                                <ul class="dropdown-menu ">

                                    <li class="col-sm-3">
                                    <li><a href=""><i class="glyphicon glyphicon-question-sign"></i> FaceBook </a></li>
                                    <li><a href=""><i class="glyphicon glyphicon-question-sign"></i> Twitter </a></li>




                                </ul>
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
        <!--Fin nav var-->

        <br>
        <br>

        <div class="container">
            <div class="row">
                <div id="alerta">
                    <%

                        if (request.getAttribute("acualizado") != null) { %>
                    <div class="alert alert-success">
                        <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                        <strong>Felicidades!</strong> La acción ha culminado satisfactoriamente.
                        ${acualizado}
                    </div>
                    <%} else if (request.getAttribute("noActualizado") != null) { %>
                    <div class="alert alert-danger">
                        <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                        <strong>Error!</strong> No se ha podido culminar satisfactoriamente.
                        <strong>!</strong>${noActualizado}
                    </div>
                    <% }%>
                </div>
                <!--Informacion-->
                <!--Informacion-->
                <!--Informacion-->
                <div class="alert alert-info">
                    <a href="#" class="close" data-dismiss="alert" aria-label="close"></a>
                    <strong>Buen dia aqui podra agregar los uniformes</strong> <br>Esto se vera en el catalogo de inicio para la posterior compra.
                </div>

                <button type="button" class="btn icon-btn btn-success nt" data-toggle="modal" data-target="#myModal"><a class="btn icon-btn btn-success"><span class="glyphicon btn-glyphicon glyphicon-plus img-circle text-success"></span>Agergar</a></button>
                <button type="button" class="btn icon-btn btn-info"><a class="btn icon-btn btn-info" href="catalogo.jsp"><span class="glyphicon btn-glyphicon glyphicon-link img-circle text-success"></span>Ver Catalogo</a></button>
            </div>
        </div>
        <!-- Modal-->
        <div class="modal fade" id="myModal" role="dialog">
            <div class="modal-dialog">

                <!-- Modal contenido-->
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Agregue un Uniforme</h4>
                    </div>
                    <div class="modal-body">
                        <!--Inicio form insertyar datos-->
                        <form method="POST" action="CrearUniforme" enctype="multipart/form-data" name="formInsert" id="form-AddUniforme">

                            <div class="form-group">
                                <label>Nombre Uniforme</label>
                                <input type="text" name="txtnombreU" id="txtnombreU" placeholder="Nombre de Uniforme" value="" class="form-control"/>
                            </div>
                                <div id="respuesta2" class="  alert-danger" ></div>

                            <div class="form-group">
                                <label>Tipo uniforme</label>
                                <select id="opTipoU" name="opTipoU" class="form-control">
                                    <option value="1">Uniforme Escolar</option>
                                    <option value="2">Uniformes deportivos</option>
                                    <option value="3">Uniformes militares y de fuerzas de seguridad</option>
                                    <option value="4">Uniformes religiosos o hábitos</option>
                                    <option value="5">Otros</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label>Precio</label>
                                <input type="number" name="txtPrecio" placeholder="Precio" value="" class="form-control"/>
                            </div>

                            <div class="form-group">
                                <label>Descripción</label>
                                <textarea  name="textareaDescripU" id="textareaDescrip" class="form-control input-sm" placeholder="Escriba una descripción"></textarea>
                            </div>
                                <div id="respuesta3" class="  alert-danger" ></div>

                            <div class="form-group">
                                <label>Estado</label><br>
                                <select id="opEstadoU" name="opEstadoU" class="form-control">
                                    <option value="true">En venta</option>
                                    <option value="False">No está en venta</option>
                                </select>
                            </div>


                            <div class="form-group">
                                <label>Subir Imagen</label>

                                <div class="input-group">
                                    <span class="input-group-btn">
                                        <span class="btn btn-info btn-file ">
                                            Subir <input class="btn btn-default btn-file disabled btnfi" type="file" name="file" id="imgInp"  accept="image/*" >
                                        </span>
                                    </span>
                                    <input type="text" class="form-control imgsubir" readonly>
                                </div>
                                <div id="respuesta1" class="  alert-danger" ></div>
                                <br>
                                <div id="contenedorimg">
                                    <img id='img-upload'/>
                                </div>

                            </div>
                            <button class="btn btn-success btn-lg btnsubir" id="subir" style="width: 100%;"><span class="glyphicon glyphicon-ok-sign"></span> Guardar</button>


                        </form>
                        <!--Fin formulario agregar-->

                    </div>
                </div>
            </div>
        </div>

        <!--Fin  Modal-->







        <!-- Tabla responsive-->

        <div class="container">
            <div class="row">
                <br>

                <div class="col-md-12">
                    <h4>Uniformes en catalogo para la venta</h4>
                    <div class="table-responsive">

                        <%int pagina = 0; //pagina a mostrar
                            if (request.getParameter("pagina") == null) {
                                pagina = 0;
                            } else {
                                pagina = Integer.valueOf(request.getParameter("pagina"));
                            }
                        %>
                        <table id="mytable" class="table table-bordred table-striped "  >

                            <thead>

                            <th><input type="checkbox" id="checkall" /></th>
                            <th>N°</th>
                            <th>Nombre Uniforme</th>
                            <th>Tipo uniforme</th>
                            <th>Precio</th>
                            <th class="tx">Imagen</th>
                            <th class="tx">Descripción</th>
                            <th>Activo/Inactivo</th>
                            <th>Editar</th>

                            <th>Eliminar</th>
                            </thead>
                            <tbody>
                                <%
                                    DaoUniforme daoUniforme = new DaoUniforme();
                                    ArrayList<BeanUniforme> listaUniforme = daoUniforme.listarUniforme(pagina * 10, 10);
                                    int cont = pagina * 10;
                                    int contador2 = 0;

                                    for (BeanUniforme bnUnifor : listaUniforme) {%>
                                <tr>
                                    <td><input type="checkbox" class="checkthis" /></td>
                                    <td><%=cont + 1%></td>
                                    <td><%=bnUnifor.getNombre_uniforme()%></td>
                                    <td class="imgt" ><%=bnUnifor.getNombreTipo()%></td>
                                    <td>$ <%=bnUnifor.getPrecio()%></td> 
                                    <td><img class="imgl" src="images/<%=bnUnifor.getUrl_diseño_Uniforme()%>" alt=""/></td>
                                    <td class="tx"><textarea disabled="" class="txtareal"><%=bnUnifor.getDescripcion_uniforme()%></textarea> </td>
                                    <% if (bnUnifor.isEstadoUniforme()) {%>
                                    <td ><input checked="" type="checkbox" class="checkthis" disabled="" /></td>                                                               
                                        <%} else {%>
                                    <td > <input type="checkbox" class="checkthis" disabled=""/></td>                                                               
                                        <%}%>
                                    <td><a data-placement="top" data-toggle="tooltip" title="Edit"  ><button class="btn btn-primary btn-xs editar" data-title="Edit" value="<%= bnUnifor.getId_uniforme()%>" data-toggle="modal" data-target="#edit" ><span class="glyphicon glyphicon-pencil"></span></button></a></td>
                                    <td><a data-placement="top" data-toggle="tooltip" title="Delete"><button class="btn btn-danger btn-xs elimina"  value="<%= bnUnifor.getId_uniforme()%>" data-title="Delete" data-toggle="modal" data-target="#delete" ><span class="glyphicon glyphicon-trash"></span></button></a></td>
                                </tr>

                                <%cont++;
                                    }%>








                            </tbody>

                        </table>

                        <div class="clearfix"></div>
                        <ul class="pagination pull-left">



                            <%if (pagina > 1) {%> 
                            <li class=""><a href="?pagina=<%=pagina - 1%>"><span class="glyphicon glyphicon-chevron-left"></span></a></li>
                                    <%} else {%>
                            <li class="disabled"><a ><span class="glyphicon glyphicon-chevron-left"></span></a></li>
                                    <%}%>
                                    <%
                                        int numeroRegistros = daoUniforme.verRegistrosTotales();
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
            </div>
        </div>
                       
        <div class="modal fade" id="edit" tabindex="-1" role="dialog" aria-labelledby="edit" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></button>
                        <h4 class="modal-title custom_align" id="Heading">Editar Uniforme</h4>
                    </div>

                    <div class="modal-body">
                        <input type="hidden" name="txtOpc" value="3">
                        <div class="formulario"></div>

                    </div>
                    <div class="modal-footer ">
                    </div>
                </div>
                <!-- /.modal-content --> 
            </div>
            <!-- /.modal-dialog --> 
        </div>



        <form method="POST" action="CrearUniforme" name="formEliminar" >
            <div class="modal fade" id="delete" tabindex="-1" role="dialog" aria-labelledby="edit" aria-hidden="true">
                <div class="modal-dialog">

                    <div class="build-list">

                    </div>
                    <div class="modal-content">
                        <div class="modal-header">
                            <input type="hidden" class="idDelete" value="" name="idEliminar"/>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></button>
                            <h4 class="modal-title custom_align" id="Heading">Borrar este articulo</h4>
                        </div>
                        <div class="modal-body">

                            <div class="alert alert-danger"><span class="glyphicon glyphicon-warning-sign"></span> Esta usted seguro de eliminar este articulo?</div>

                        </div>
                        <div class="modal-footer ">
                            <button  class="btn btn-success" ><span class="glyphicon glyphicon-ok-sign"></span> SI</button>
                            <input type="hidden" name="txtOpc" value="2">
                            <button type="button" class="btn btn-default" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> No</button>

                        </div>
                    </div>
                    <!-- /.modal-content --> 
                </div>
                <!-- /.modal-dialog --> 
            </div>
        </form>

        <footer class="container-fluid text-center">
            <p>Footer ® David Daza</p>
        </footer>
        <script src="js/jquery.js" type="text/javascript"></script>
        <script src="js/bootstrap.min.js" type="text/javascript"></script>
        <script src="js/_js.js" type="text/javascript"></script>
    </body>
</html>
