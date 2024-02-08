<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
    <title>Editar Producto</title>
</head>
<body>
    <%
        String ID_producto=request.getParameter("ID_producto");
        String Nombre=request.getParameter("Nombre");
        String Descripcion=request.getParameter("Descripcion");
        String Precio=request.getParameter("Precio");
        String Cantidad_Stock=request.getParameter("Cantidad_Stock");
    %>
    <div class="container mt-5">
        <div class="row">
            <div class="col-sm">
                <form action="editarProducto.jsp" method="get">
                    <div class="form-group">
                        <label for="nombre">Nombre</label>
                        <input type="text" class="form-control" id="Nombre" value="<%= Nombre %>" name="Nombre" placeholder="Nombre" required="required">
                    </div> 
                    <div class="form-group">
                        <label for="descripcion">Descripción</label>
                        <input type="text" class="form-control" id="Descripcion" value="<%= Descripcion %>" name="Descripcion" placeholder="Descripción" required="required">
                    </div>
                    <div class="form-group">
                        <label for="precio">Precio</label>
                        <input type="text" class="form-control" id="Precio" value="<%= Precio %>" name="Precio" placeholder="Precio" required="required">
                    </div>
                    <div class="form-group">
                        <label for="cantidad_stock">Cantidad en Stock</label>
                        <input type="text" class="form-control" id="Cantidad_Stock" value="<%= Cantidad_Stock %>" name="Cantidad_Stock" placeholder="Cantidad en Stock" required="required">
                    </div>
                    <a href="tienda.jsp" class="btn btn-danger">Cancelar <i class="fa fa-ban" aria-hidden="true"></i></a>
                    <button type="submit" name="enviar" class="btn btn-primary">Guardar <i class="fa fa-floppy-o" aria-hidden="true"></i></button>
                    <input type="hidden" name="ID_producto" value="<%= ID_producto %>" >
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
                st.executeUpdate("update producto set Nombre='"+Nombre+"', Descripcion='"+Descripcion+"', Precio='"+Precio+"', Cantidad_Stock='"+Cantidad_Stock+"' where ID_producto='"+ID_producto+"';");
                request.getRequestDispatcher("tienda.jsp").forward(request, response);
            } catch (Exception e) {
               out.print(e);
            }
        }
    %>
</body>
</html>
