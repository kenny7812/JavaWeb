<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% 
        Connection con = null;
        Statement st = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sistema_inventario?user=root&password=100122");
            st=con.createStatement();
            st.executeUpdate("DELETE FROM producto where ID_producto='"+request.getParameter("ID_producto")+"';");
            request.getRequestDispatcher("Producto.jsp").forward(request, response);
            } catch (Exception e) {
            out.print(e);
            }
        %>
    </body>
</html>