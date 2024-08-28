<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <title>Crear Producto</title>
    </head>
    <body>
        <div class="container mt-5">
            <div class="row">
                <div class="col-sm">
                    <form action="crearProducto.jsp" method="post">
                        <div class="form-group">
                            <label for="ID_producto">ID</label>
                            <input type="text" class="form-control" id="ID_producto" name="ID_producto" placeholder="ID" required="required">
                        </div>
                        <div class="form-group">
                            <label for="nombre">Nombre</label>
                            <input type="text" class="form-control" id="nombre" name="nombre" placeholder="Nombre" required="required">
                        </div> 
                        <div class="form-group">
                            <label for="descripcion">Descripción</label>
                            <input type="text" class="form-control" id="descripcion" name="descripcion" placeholder="Descripción" required="required">
                        </div>
                        <div class="form-group">
                            <label for="precio">Precio</label>
                            <input type="text" class="form-control" id="precio" name="precio" placeholder="Precio" required="required">
                        </div>
                        <div class="form-group">
                            <label for="cantidad_stock">Cantidad en Stock</label>
                            <input type="text" class="form-control" id="cantidad_stock" name="cantidad_stock" placeholder="Cantidad en Stock" required="required">
                        </div>
                        <button type="submit" name="enviar" class="btn btn-primary">Guardar <i class="fa fa-floppy-o" aria-hidden="true"></i></button>
                    </form>
                </div>
            </div> 
        </div> 
        <%
            if(request.getParameter("enviar")!=null){
                String ID_producto=request.getParameter("ID_producto");
                String nombre=request.getParameter("nombre");
                String descripcion=request.getParameter("descripcion");
                String precio=request.getParameter("precio");
                String cantidad_stock=request.getParameter("cantidad_stock");
            
                try {
                    Connection con=null;
                    Statement st=null;
                
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sistema_inventario?user=root&password=100122");
                    st = con.createStatement();
                    st.executeUpdate("INSERT INTO producto (ID_producto, Nombre, Descripcion, Precio, Cantidad_Stock) VALUES ('"+ID_producto+"','"+nombre+"','"+descripcion+"','"+precio+"','"+cantidad_stock+"');");
                    request.getRequestDispatcher("Producto.jsp").forward(request, response);
                } catch (Exception e) {
                   out.print(e);
                }
            }
        %>
    </body>
</html>

