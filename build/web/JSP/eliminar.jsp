<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.Driver"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <title>Entregar un libro</title>
        <link rel="stylesheet" href="../index.css">
    </head>
    <body background="lentes.jpg" style="background-position:center; background-repeat: no-repeat;
          background-attachment: fixed;
          background-position: center;"
          width: 100%; height: 100%;
          >
        <div id="navbar">
            <ul>
                <li><a href="../index.html" target="_self">PrestaLibros</a></li>
            </ul>
        </div>
        <% try {
                Connection CON_ENT = null;
                Class.forName("com.mysql.jdbc.Driver");
                CON_ENT = DriverManager.getConnection("jdbc:mysql://localhost/libreria?user=root&password=");
                PreparedStatement PS;
        %>
        <div  style="top: 10%">
            <form action="eliminar.jsp" method="POST">
                <mark> <label for="busqueda">Introduce el numero de Prestamo a eliminar:</label></mark>
                <input type="number" id="pnumPrestamo" name="pnumPrestamo" placeholder="Obligatorio"/>
                <input type="submit" value="Entregar" name="entregar"/>
            </form>
        </div>
        <% if (request.getParameter("entregar") != null) {
                String bID = request.getParameter("pnumPrestamo");
                String SQL_ENT = "DELETE FROM prestamos WHERE id_prestamo = "+bID+";";
                PS = CON_ENT.prepareStatement(SQL_ENT);
                PS.executeUpdate(SQL_ENT);
                response.sendRedirect("../JSP/consulta.jsp");
            }
        } catch (Exception e2) {
        %> <div id="result"> <h3>No se encontro registro. Por favor valida. </h3></div><% }
        %>
    </body>
</html>
