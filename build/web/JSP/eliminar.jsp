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
    <body>
        <div id="navbar">
            <ul>
                <li><a href="../index.html" target="_self">PrestaLibros</a></li>
            </ul>
        </div>
        <% try {
                Connection CON_ENT = null;
                Class.forName("com.mysql.jdbc.Driver");
                CON_ENT = DriverManager.getConnection("jdbc:mysql://localhost:3306/libreria?user=root&password=");
                PreparedStatement PS;
        %>
        <div>
            <form action="eliminar.jsp" method="POST">
                <label for="busqueda">Introduce el numero de Prestamo a eliminar:</label>
                <input type="number" id="pnumPrestamo" name="pnumPrestamo" placeholder="Obligatorio"/>
                <input type="submit" value="Entregar" name="entregar"/>
            </form>
        </div>
        <% if (request.getParameter("entregar") != null) {
                String bID = request.getParameter("pnumPrestamo");
                String SQL_ENT = "DELETE FROM prestamo WHERE numPrestamo = "+bID+";";
                PS = CON_ENT.prepareStatement(SQL_ENT);
                PS.executeUpdate(SQL_ENT);
                response.sendRedirect("../JSP/consulta.jsp");
            }
        } catch (Exception e2) {
        %> <div id="result"> <h3>No se encontro registro. Por favor valida. </h3></div><% }
        %>
    </body>
</html>
