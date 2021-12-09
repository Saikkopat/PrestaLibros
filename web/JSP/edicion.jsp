<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.Driver"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <title>Editar un Prestamo</title>
        <link rel="stylesheet" href="../index.css">
    </head>
    <body>
        <div id="navbar">
            <ul>
                <li><a href="../index.html" target="_self">PrestaLibros</a></li>
            </ul>
        </div>
        <% try {
                Connection CON_EDIC = null;
                Class.forName("com.mysql.jdbc.Driver");
                CON_EDIC = DriverManager.getConnection("jdbc:mysql://localhost/libreria?user=root&password=");
                Statement ST_EDIC;
                ResultSet RS_EDIC;
                ST_EDIC = CON_EDIC.createStatement();%>
        <div id="presentacion">
            <form action="edicion.jsp" method="POST">
                <label for="busqueda">Introduce el numero de Prestamo:</label>
                <input type="number" name="fID" placeholder="Obligatorio"/>
                <input type="submit" value="Buscar" name="buscar"/>
            </form>
        </div>
        <% if (request.getParameter("buscar") != null) {
                String bID = request.getParameter("fID");
                String SQL_EDIC = "SELECT * FROM prestamos WHERE id_prestamo = '" + bID + "'";
                RS_EDIC = ST_EDIC.executeQuery(SQL_EDIC);
                RS_EDIC.next();
                if (RS_EDIC != null) {%>
        <div id="result">
            <form action="edicion.jsp" method="POST">
                <label for="fnumPrestamo">Numero de Prestamo:</label>
                <input type="string" name="fnumPrestamo" value=<%=RS_EDIC.getString("id_prestamo")%> disabled><br />
                <label for="fnumAlumno">Numero de Alumno</label>
                <input type="string" name="fnumAlumno" value=<%= RS_EDIC.getString("id_alumno")%> ><br />
                <label for="fidLibro">Codigo del Libro</label>
                <input type="string" name="fidLibro" value=<%= RS_EDIC.getString("id_libro")%>><br />
                <%--
                <label for="ffechaEntrega">Fecha de Entrega:</label>
                ---%>
                <input type="submit" name="actualiza" value="Actualizar Prestamo" />
            </form>
        </div>
        <%                
                    if (request.getParameter("actualiza") != null) {
                    String unumPrestamo = request.getParameter("fnumPrestamo");
                    String unumAlumno = request.getParameter("fnumAlumno");
                    String uidLibro = request.getParameter("fidLibro");
                    if(unumPrestamo != null && unumAlumno != null && uidLibro != null){
                    PreparedStatement PS;
                    String SQL_MOD = "UPDATE prestamos SET (id_libro = '"+uidLibro+"', id_alumno = '"+unumAlumno+"') WHERE id_prestamo = '"+unumPrestamo+";";
                    PS = CON_EDIC.prepareStatement(SQL_MOD);
                    PS.executeUpdate();
                    ST_EDIC.close();
                    PS.close();
                    CON_EDIC.close();
            }
                    response.sendRedirect("../JSP/consulta.jsp");
            }               
            }
            }
        } catch (Exception e2) {
        out.print(e2); }
        %>
    </body>
</html>
