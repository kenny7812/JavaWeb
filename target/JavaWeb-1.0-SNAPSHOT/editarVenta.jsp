<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
    <title>Editar Venta</title>
</head>
<body>
    <%
        String ID_venta=request.getParameter("ID_venta");
        String Fecha_Venta=request.getParameter("Fecha_Venta");
        String Numero_Factura=request.getParameter("Numero_Factura");
        String Producto_ID=request.getParameter("Producto_ID");
        String Cliente_ID=request.getParameter("Cliente_ID");
        String Cantidad_Vendida=request.getParameter("Cantidad_Vendida");
        String Precio_Unitario=request.getParameter("Precio_Unitario");
    %>
    <div class="container mt-5">
        <div class="row">
            <div class="col-sm">
                <form action="editarVenta.jsp" method="post">
                    <div class="form-group">
                        <label for="Fecha_Venta">Fecha Venta</label>
                        <input type="text" class="form-control" id="Fecha_Venta" value="<%= Fecha_Venta %>" name="Fecha_Venta" placeholder="Fecha Venta" required="required">
                    </div>
                    <div class="form-group">
                        <label for="Numero_Factura">Número Factura</label>
                        <input type="text" class="form-control" id="Numero_Factura" value="<%= Numero_Factura %>" name="Numero_Factura" placeholder="Número Factura" required="required">
                    </div>
                    <div class="form-group">
                        <label for="Producto_ID">Producto ID</label>
                        <input type="text" class="form-control" id="Producto_ID" value="<%= Producto_ID %>" name="Producto_ID" placeholder="Producto ID" required="required">
                    </div>
                    <div class="form-group">
                        <label for="Cliente_ID">Cliente ID</label>
                        <input type="text" class="form-control" id="Cliente_ID" value="<%= Cliente_ID %>" name="Cliente_ID" placeholder="Cliente ID" required="required">
                    </div>
                    <div class="form-group">
                        <label for="Cantidad_Vendida">Cantidad Vendida</label>
                        <input type="text" class="form-control" id="Cantidad_Vendida" value="<%= Cantidad_Vendida %>" name="Cantidad_Vendida" placeholder="Cantidad Vendida" required="required">
                    </div>
                    <div class="form-group">
                        <label for="Precio_Unitario">Precio Unitario</label>
                        <input type="text" class="form-control" id="Precio_Unitario" value="<%= Precio_Unitario %>" name="Precio_Unitario" placeholder="Precio Unitario" required="required">
                    </div>
                    <a href="tienda.jsp" class="btn btn-danger">Cancelar <i class="fa fa-ban" aria-hidden="true"></i></a>
                    <button type="submit" name="enviar" class="btn btn-primary">Guardar <i class="fa fa-floppy-o" aria-hidden="true"></i></button>
                    <input type="hidden" name="ID_venta" value="<%= ID_venta %>" >
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
                st.executeUpdate("UPDATE venta SET Fecha_Venta='"+Fecha_Venta+"', Numero_Factura='"+Numero_Factura+"', Producto_ID='"+Producto_ID+"', Cliente_ID='"+Cliente_ID+"', Cantidad_Vendida='"+Cantidad_Vendida+"', Precio_Unitario='"+Precio_Unitario+"' WHERE ID_venta='"+ID_venta+"';");
                request.getRequestDispatcher("tienda.jsp").forward(request, response);
            } catch (Exception e) {
               out.print(e);
            }
        }
    %>
</body>
</html>

