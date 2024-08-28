<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <title>Crear Compra</title>
    </head>
    <body>
        <div class="container mt-5">
            <div class="row">
                <div class="col-sm">
                    <form action="crearCompra.jsp" method="post">
                        <div class="form-group">
                            <label for="ID_compra">ID Compra</label>
                            <input type="text" class="form-control" id="ID_compra" name="ID_compra" placeholder="ID Compra" required="required">
                        </div>
                        <div class="form-group">
                            <label for="Fecha_Compra">Fecha Compra</label>
                            <input type="text" class="form-control" id="Fecha_Compra" name="Fecha_Compra" placeholder="Fecha Compra" required="required">
                        </div> 
                        <div class="form-group">
                            <label for="Numero_Factura">Número Factura</label>
                            <input type="text" class="form-control" id="Numero_Factura" name="Numero_Factura" placeholder="Número Factura" required="required">
                        </div>
                        <div class="form-group">
                            <label for="Cantidad_Comprada">Cantidad Comprada</label>
                            <input type="text" class="form-control" id="Cantidad_Comprada" name="Cantidad_Comprada" placeholder="Cantidad Comprada" required="required">
                        </div>
                        <div class="form-group">
                            <label for="Precio_Unitario">Precio Unitario</label>
                            <input type="text" class="form-control" id="Precio_Unitario" name="Precio_Unitario" placeholder="Precio Unitario" required="required">
                        </div>
                        <div class="form-group">
                            <label for="Producto_ID">Producto ID</label>
                            <input type="text" class="form-control" id="Producto_ID" name="Producto_ID" placeholder="Producto ID" required="required">
                        </div>
                        <div class="form-group">
                            <label for="Proveedor_ID">Proveedor ID</label>
                            <input type="text" class="form-control" id="Proveedor_ID" name="Proveedor_ID" placeholder="Proveedor ID" required="required">
                        </div>
                        <button type="submit" name="enviar" class="btn btn-primary">Guardar <i class="fa fa-floppy-o" aria-hidden="true"></i></button>
                    </form>
                </div>
            </div> 
        </div> 
        <%
            if(request.getParameter("enviar")!=null){
                String ID_compra=request.getParameter("ID_compra");
                String Fecha_Compra=request.getParameter("Fecha_Compra");
                String Numero_Factura=request.getParameter("Numero_Factura");
                String Cantidad_Comprada=request.getParameter("Cantidad_Comprada");
                String Precio_Unitario=request.getParameter("Precio_Unitario");
                String Producto_ID=request.getParameter("Producto_ID");
                String Proveedor_ID=request.getParameter("Proveedor_ID");
            
                try {
                    Connection con=null;
                    Statement st=null;
                
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sistema_inventario?user=root&password=100122");
                    st = con.createStatement();
                    st.executeUpdate("INSERT INTO compra (ID_compra, Fecha_Compra, Numero_Factura, Cantidad_Comprada, Precio_Unitario, Producto_ID, Proveedor_ID) VALUES ('"+ID_compra+"','"+Fecha_Compra+"','"+Numero_Factura+"','"+Cantidad_Comprada+"','"+Precio_Unitario+"','"+Producto_ID+"','"+Proveedor_ID+"');");
                    request.getRequestDispatcher("Compra.jsp").forward(request, response);
                } catch (Exception e) {
                   out.print(e);
                }
            }
        %>
    </body>
</html>

