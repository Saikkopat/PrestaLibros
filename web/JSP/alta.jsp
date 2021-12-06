<%-- Formulario para alta de prestamos --%>

<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.Driver"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Nuevo Prestamo</title>
        <link rel="stylesheet" href="../index.css">
        <%
            try {
                Connection CONECTDB;
                Class.forName("com.mysql.jdbc.Driver");
                CONECTDB = DriverManager.getConnection("jdbc:mysql://localhost:3306/libreria?user=root&password=");

                Statement ST;
                ResultSet RS;
                ST = CONECTDB.createStatement();
                RS = ST.executeQuery("SELECT numPrestamo FROM prestamo ORDER BY numPrestamo DESC LIMIT 1;");
                RS.next();
        %>
    </head>
    <body>
        <div id="navbar">
            <ul>
                <li><a href="../index.html" target="_self">PrestaLibros</a></li>
            </ul>
        </div>
        <div id="presentacion">
            <form action="alta.jsp" method="POST">
                <label for="fnumPrestamo">Numero de Prestamo:</label>
                <input type="number" id="fnumPrestamo" name="numPrestamo" value=<%= 1 + RS.getInt("numPrestamo")%>><br>
                <%
                } catch (Exception e) { %>
                alert(<% out.print(e);%>);<%
                    }
                %>

                <label for="fnumAlumno">de Alumno</label>
                <input type="number" id="fnumANumero lumno" name="numAlumno" placeholder="Obligatorio"><br>

                <label for="fidLib">Codigo del Libro</label>
                <input type="number" id="fidLibro" name="idLibro" placeholder="Obligatorio"><br>

                <label for="ffechaEntrega">Fecha de Entrega:</label>
                <input type="date" id="ffechaEntrega" name="fechaEntrega" value="2021-12-13"><br>

                <input type="submit" name="solicitud" class="btn" value="Solicitar Prestamo"/>
            </form>
        </div>
                
                <div>
                    
                </div>        
        <%
            if (request.getParameter("solicitud") != null) {
                String pnumPrestamo = request.getParameter("numPrestamo");
                String pnumAlumno = request.getParameter("numAlumno");
                String pidLibro = request.getParameter("idLibro");
                String pfechaEntrega = request.getParameter("fechaEntrega");
                try {
                    Connection CON_SOL = null;
                    Statement ST_SOL = null;
                    Class.forName("com.mysql.jdbc.Driver");
                    CON_SOL = DriverManager.getConnection("jdbc:mysql://localhost:3306/libreria?user=root&password=");
                    ST_SOL = CON_SOL.createStatement();
                    String SQL = "";
                    SQL = "INSERT INTO prestamo VALUES (" + pnumPrestamo + ", now(), now(), 1," + pidLibro + ", " + pnumAlumno + ");";
                    ST_SOL.execute(SQL);
                    request.getRequestDispatcher("confirmacion.jsp").forward(request, response);
                } catch (Exception e2) {
                    out.print(e2);
                }
            }
        %>
    </body>
</html>
