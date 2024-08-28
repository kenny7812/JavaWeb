<%@page import="java.sql.*"%>
<%@page import="java.math.BigInteger"%>
<%@page import="java.security.MessageDigest"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
    <title>Datos Usuario</title>
</head>
<body>
    <%
        HttpSession sesion = request.getSession();
        if (sesion.getAttribute("logueado") == null || sesion.getAttribute("logueado").equals("0")) {
            response.sendRedirect("login.jsp");
        }
        Connection con = null;
        Statement st = null;
    %>
    <div class="container mt-5">
        <div class="row">
            <div class="col-sm">
                <form action="datosUsuario.jsp" method="post">
                    <div class="mb-3">
                        <label>Usuario</label>
                        <input type="text" class="form-control" name="username" placeholder="usuario" value="<%= sesion.getAttribute("username") %>">
                    </div>
                    <div class="mb-3">
                        <label>Password</label>
                        <input type="password" class="form-control" name="password1" placeholder="password">
                    </div>
                    <div class="mb-3">
                        <label>Repita su password</label>
                        <input type="password" class="form-control" name="password2" placeholder="Repita su password">
                    </div>
                    <button type="submit" name="guardar" class="btn btn-primary">Guardar</button>
                    <a href="tienda.jsp" class="btn btn-danger">Cancelar</a>
                </form>
            </div>
        </div>
    </div>
    <%
        if (request.getParameter("guardar") != null) {
            String username = request.getParameter("username");
            String password1 = request.getParameter("password1");
            String password2 = request.getParameter("password2");

            if (password1.equals(password2)) {
                String encryptedPassword = getMD5(password1); // Encriptar la contraseña antes de guardarla

                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sistema_inventario", "root", "100122");
                    st = con.createStatement();
                    String sql = "UPDATE login_users SET username='" + username + "', password='" + encryptedPassword + "' WHERE id='" + sesion.getAttribute("id") + "';";
                    st.executeUpdate(sql);
                    sesion.setAttribute("username", username);
                    response.sendRedirect("tienda.jsp");
                } catch (Exception e) {
                    out.print(e);
                } finally {
                    if (st != null) try { st.close(); } catch (SQLException e) { e.printStackTrace(); }
                    if (con != null) try { con.close(); } catch (SQLException e) { e.printStackTrace(); }
                }
            } else {
                out.print("Las contraseñas no son iguales.");
            }
        }
    %>
</body>
<%!
    public String getMD5(String input) {
        try {
            MessageDigest md = MessageDigest.getInstance("MD5");
            byte[] encBytes = md.digest(input.getBytes());
            BigInteger numero = new BigInteger(1, encBytes);
            String encString = numero.toString(16);
            while (encString.length() < 32) {
                encString = "0" + encString;
            }
            return encString;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
%>
</html>

