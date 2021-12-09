<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Consultar registro de Prestamos</title>
        <link rel="stylesheet" href="../index.css">
    </head>
    <body
        <div id="navbar">
        <ul>
            <li><a href="../index.html" target="_self">PrestaLibros</a></li>
        </ul>
    </div>
    <%try {
            Connection CON_CON = null;
            Class.forName("com.mysql.jdbc.Driver");
            CON_CON = DriverManager.getConnection("jdbc:mysql://localhost/libreria?user=root&password=");

            Statement ST_CON = null;
            ResultSet RS_CON = null;
            ST_CON = CON_CON.createStatement();
            RS_CON = ST_CON.executeQuery("SELECT * FROM prestamos;");
    %>
    <h1>Registro de Prestamos</h1>
    <div id="presentacion">
    <table>
        <thead>
            <tr>
                <th>numPrestamo</th>
                <th>fechaSolicitud</th>
                <th>fechaEntrega</th>
                <th>extendible</th>
                <th>idLibro</th>
                <th>numAlumno</th>
            </tr>
        </thead>
        <tbody>
            <% while (RS_CON.next()) {%>
            <tr>
                <td><%=RS_CON.getInt("id_prestamo")%></td>
                <td><%=RS_CON.getString("fecha_solicitud")%></td>
                <td><%=RS_CON.getString("fecha_entrega")%></td>
                <td><%=RS_CON.getString("extentible")%></td>
                <td><%=RS_CON.getInt("id_libro")%></td>
                <td><%=RS_CON.getInt("id_alumno")%></td>
            </tr>
            <% }
                } catch (Exception e) {
                    out.print(e);
                }%>
        </tbody>
    </table>
    </div>
</body>
</html>
