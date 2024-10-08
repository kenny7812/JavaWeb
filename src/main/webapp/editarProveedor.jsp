<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
    <title>Editar Proveedor</title>
</head>
<body>
    <%
        String ID_Proveedor=request.getParameter("ID_Proveedor");
        String Nombre_Empresa=request.getParameter("Nombre_Empresa");
        String Direccion=request.getParameter("Direccion");
        String Telefono=request.getParameter("Telefono");
    %>
    <div class="container mt-5">
        <div class="row">
            <div class="col-sm">
                <form action="editarProveedor.jsp" method="post">
                    <div class="form-group">
                        <label for="Nombre_Empresa">Nombre Empresa</label>
                        <input type="text" class="form-control" id="Nombre_Empresa" value="<%= Nombre_Empresa %>" name="Nombre_Empresa" placeholder="Nombre Empresa" required="required">
                    </div> 
                    <div class="form-group">
                        <label for="direccion">Dirección</label>
                        <input type="text" class="form-control" id="Direccion" value="<%= Direccion %>" name="Direccion" placeholder="Dirección" required="required">
                    </div>
                    <div class="form-group">
                        <label for="telefono">Teléfono</label>
                        <input type="text" class="form-control" id="Telefono" value="<%= Telefono %>" name="Telefono" placeholder="Teléfono" required="required">
                    </div>
                    <a href="Proveedor.jsp" class="btn btn-danger">Cancelar <i class="fa fa-ban" aria-hidden="true"></i></a>
                    <button type="submit" name="enviar" class="btn btn-primary">Guardar <i class="fa fa-floppy-o" aria-hidden="true"></i></button>
                    <input type="hidden" name="ID_Proveedor" value="<%= ID_Proveedor %>" >
                </form>
            </div>
        </div> 
    </div> 
    <%
        if(request.getParameter("enviar")!=null){
            try {
                Connection con=null;
                Statement st=null;
                
                Class.forName("com.mysql.cj.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sistema_inventario?user=root&password=100122");
                st = con.createStatement();
                st.executeUpdate("UPDATE proveedor SET Nombre_Empresa='"+Nombre_Empresa+"', Direccion='"+Direccion+"', Telefono='"+Telefono+"' WHERE ID_Proveedor='"+ID_Proveedor+"';");
                request.getRequestDispatcher("Proveedor.jsp").forward(request, response);
            } catch (Exception e) {
               out.print(e);
            }
        }
    %>
</body>
</html>

