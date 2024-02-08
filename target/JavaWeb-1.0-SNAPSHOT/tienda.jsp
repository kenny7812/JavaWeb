<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <title>Base De Datos Tienda</title>
    </head>
    <body>
        <% 
            Connection con = null;
            Statement st = null;
            ResultSet rs = null;
        %>

        <div class="container mt-5">
            <div class="row">
                <div class="col-sm">
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th scope="col" colspan="4" class="text-center">CLIENTE</th>
                                <th scope="col">
                                    <a href="crear.jsp"> <i class="fa fa-user-plus" aria-hidden="true"></i></a> <!-- DE ESTA MISMA LINEA ES EL EJEMPLO PARA LAS DEMAS TABLAS DE IR A CREAR EL USUARIO DE LAS OTRAS TABLAS -->
                                </th>
                            </tr>
                            <tr>
                                <th scope="col">ID</th>
                                <th scope="col">Nombre</th>
                                <th scope="col">Direccion</th>
                                <th scope="col">Telefono</th>
                                <th scope="col">Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                try {
                                    Class.forName("com.mysql.cj.jdbc.Driver");
                                    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sistema_inventario?user=root&password=100122");
                                    st=con.createStatement();
                                    rs=st.executeQuery("SELECT * FROM cliente");
                                    while(rs.next()) {
                            %>
                            <tr>
                                <th scope="row"><%= rs.getString("ID_cliente") %></th>
                                <td><%= rs.getString("nombre") %></td>
                                <td><%= rs.getString("direccion") %></td>
                                <td><%= rs.getString("telefono") %></td>
                                <td>
                                    <a href="editar.jsp?ID_cliente=<%= rs.getString("ID_cliente") %>&nombre=<%= rs.getString("nombre") %>&direccion=<%= rs.getString("direccion") %>&telefono=<%= rs.getString("telefono") %>"><i class="fa fa-pencil" aria-hidden="true"></i></a>
                                    <a href="borrar.jsp?ID_cliente=<%= rs.getString("ID_cliente") %>" class="ml-1"><i class="fa fa-trash" aria-hidden="true"></i></a>
                                </td>
                            </tr>
                            <%
                                    }
                                } 
                                catch (Exception e){
                                    out.print("error mysql "+e);
                                }
                            %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <div class="container mt-5">
            <div class="row">
                <div class="col-sm">
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th scope="col" colspan="7" class="text-center">COMPRAS</th>
                                <th scope="col">
                                    <a href="crearCompra.jsp"> <i class="fa fa-plus" aria-hidden="true"></i></a>
                                </th>
                            </tr>
                            <tr>
                                <th scope="col">ID Compra</th>
                                <th scope="col">Fecha Compra</th>
                                <th scope="col">Número Factura</th>
                                <th scope="col">Cantidad Comprada</th>
                                <th scope="col">Precio Unitario</th>
                                <th scope="col">Producto ID</th>
                                <th scope="col">Proveedor ID</th>
                                <th scope="col">Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                try {
                                    Class.forName("com.mysql.cj.jdbc.Driver");
                                    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sistema_inventario?user=root&password=100122");
                                    st=con.createStatement();
                                    rs=st.executeQuery("SELECT * FROM compra");
                                    while(rs.next()) {
                            %>
                            <tr>
                                <th scope="row"><%= rs.getString("ID_Compra") %></th>
                                <td><%= rs.getString("Fecha_Compra") %></td>
                                <td><%= rs.getString("Numero_Factura") %></td>
                                <td><%= rs.getString("Cantidad_Comprada") %></td>
                                <td><%= rs.getString("Precio_Unitario") %></td>
                                <td><%= rs.getString("Producto_ID") %></td>
                                <td><%= rs.getString("Proveedor_ID") %></td>
                                <td>
                                    <a href="editarCompra.jsp?ID_Compra=<%= rs.getString("ID_Compra") %>&Fecha_Compra=<%= rs.getString("Fecha_Compra") %>&Numero_Factura=<%= rs.getString("Numero_Factura") %>&Cantidad_Comprada=<%= rs.getString("Cantidad_Comprada") %>&Precio_Unitario=<%= rs.getString("Precio_Unitario") %>&Producto_ID=<%= rs.getString("Producto_ID") %>&Proveedor_ID=<%= rs.getString("Proveedor_ID") %>"><i class="fa fa-pencil" aria-hidden="true"></i></a>
                                    <a href="borrarCompra.jsp?ID_Compra=<%= rs.getString("ID_Compra") %>" class="ml-1"><i class="fa fa-trash" aria-hidden="true"></i></a>
                                </td>
                            </tr>
                            <%
                                    }
                                } 
                                catch (Exception e){
                                    out.print("error mysql "+e);
                                }
                            %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <div class="container mt-5">
            <div class="row">
                <div class="col-sm">
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th scope="col" colspan="5" class="text-center">PRODUCTOS</th>
                                <th scope="col">
                                    <a href="crearProducto.jsp"> <i class="fa fa-plus" aria-hidden="true"></i></a>
                                </th>
                            </tr>
                            <tr>
                                <th scope="col">ID Producto</th>
                                <th scope="col">Nombre</th>
                                <th scope="col">Descripción</th>
                                <th scope="col">Precio</th>
                                <th scope="col">Cantidad en Stock</th>
                                <th scope="col">Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                try {
                                    Class.forName("com.mysql.cj.jdbc.Driver");
                                    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sistema_inventario?user=root&password=100122");
                                    st = con.createStatement();
                                    rs = st.executeQuery("SELECT * FROM producto");
                                    while (rs.next()) {
                            %>
                            <tr>
                                <th scope="row"><%= rs.getString("ID_producto") %></th>
                                <td><%= rs.getString("Nombre") %></td>
                                <td><%= rs.getString("Descripcion") %></td>
                                <td><%= rs.getString("Precio") %></td>
                                <td><%= rs.getString("Cantidad_Stock") %></td>
                                <td>
                                    <a href="editarProducto.jsp?ID_producto=<%= rs.getString("ID_producto") %>&Nombre=<%= rs.getString("Nombre") %>&Descripcion=<%= rs.getString("Descripcion") %>&Precio=<%= rs.getString("Precio") %>&Cantidad_Stock=<%= rs.getString("Cantidad_Stock") %>"><i class="fa fa-pencil" aria-hidden="true"></i></a>
                                    <a href="borrarProducto.jsp?ID_producto=<%= rs.getString("ID_producto") %>" class="ml-1"><i class="fa fa-trash" aria-hidden="true"></i></a>
                                </td>
                            </tr>
                            <%
                                    }
                                } catch (Exception e) {
                                    out.print("error mysql " + e);
                                }
                            %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <div class="container mt-5">
            <div class="row">
                <div class="col-sm">
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th scope="col" colspan="5" class="text-center">PROVEEDORES</th>
                                <th scope="col">
                                    <a href="crearProveedor.jsp"> <i class="fa fa-plus" aria-hidden="true"></i></a>
                                </th>
                            </tr>
                            <tr>
                                <th scope="col">ID Proveedor</th>
                                <th scope="col">Nombre Empresa</th>
                                <th scope="col">Dirección</th>
                                <th scope="col">Teléfono</th>
                                <th scope="col">Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                try {
                                    Class.forName("com.mysql.cj.jdbc.Driver");
                                    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sistema_inventario?user=root&password=100122");
                                    st = con.createStatement();
                                    rs = st.executeQuery("SELECT * FROM proveedor");
                                    while (rs.next()) {
                            %>
                            <tr>
                                <th scope="row"><%= rs.getString("ID_Proveedor") %></th>
                                <td><%= rs.getString("Nombre_Empresa") %></td>
                                <td><%= rs.getString("Direccion") %></td>
                                <td><%= rs.getString("Telefono") %></td>
                                <td>
                                    <a href="editarProveedor.jsp?ID_Proveedor=<%= rs.getString("ID_Proveedor") %>&Nombre_Empresa=<%= rs.getString("Nombre_Empresa") %>&Direccion=<%= rs.getString("Direccion") %>&Telefono=<%= rs.getString("Telefono") %>"><i class="fa fa-pencil" aria-hidden="true"></i></a>
                                    <a href="borrarProveedor.jsp?ID_Proveedor=<%= rs.getString("ID_Proveedor") %>" class="ml-1"><i class="fa fa-trash" aria-hidden="true"></i></a>
                                </td>
                            </tr>
                            <%
                                    }
                                } catch (Exception e) {
                                    out.print("Error MySQL: " + e);
                                }
                            %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <div class="container mt-5">
            <div class="row">
                <div class="col-sm">
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th scope="col" colspan="6" class="text-center">VENTAS</th>
                                <th scope="col">
                                    <a href="crearVenta.jsp"> <i class="fa fa-plus" aria-hidden="true"></i></a>
                                </th>
                            </tr>
                            <tr>
                                <th scope="col">ID Venta</th>
                                <th scope="col">Fecha Venta</th>
                                <th scope="col">Número Factura</th>
                                <th scope="col">Producto ID</th>
                                <th scope="col">Cliente ID</th>
                                <th scope="col">Cantidad Vendida</th>
                                <th scope="col">Precio Unitario</th>
                                <th scope="col">Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                try {
                                    Class.forName("com.mysql.cj.jdbc.Driver");
                                    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sistema_inventario?user=root&password=100122");
                                    st = con.createStatement();
                                    rs = st.executeQuery("SELECT * FROM venta");
                                    while (rs.next()) {
                            %>
                            <tr>
                                <th scope="row"><%= rs.getString("ID_venta") %></th>
                                <td><%= rs.getString("Fecha_Venta") %></td>
                                <td><%= rs.getString("Numero_Factura") %></td>
                                <td><%= rs.getString("Producto_ID") %></td>
                                <td><%= rs.getString("Cliente_ID") %></td>
                                <td><%= rs.getString("Cantidad_Vendida") %></td>
                                <td><%= rs.getString("Precio_Unitario") %></td>
                                <td>
                                    <a href="editarVenta.jsp?ID_venta=<%= rs.getString("ID_venta") %>&Fecha_Venta=<%= rs.getString("Fecha_Venta") %>&Numero_Factura=<%= rs.getString("Numero_Factura") %>&Producto_ID=<%= rs.getString("Producto_ID") %>&Cliente_ID=<%= rs.getString("Cliente_ID") %>&Cantidad_Vendida=<%= rs.getString("Cantidad_Vendida") %>&Precio_Unitario=<%= rs.getString("Precio_Unitario") %>"><i class="fa fa-pencil" aria-hidden="true"></i></a>
                                    <a href="borrarVenta.jsp?ID_venta=<%= rs.getString("ID_venta") %>" class="ml-1"><i class="fa fa-trash" aria-hidden="true"></i></a>
                                </td>
                            </tr>
                            <%
                                    }
                                } catch (Exception e) {
                                    out.print("Error MySQL: " + e);
                                }
                            %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <div class="container mt-5">
            <div class="row">
                <div class="col-sm">
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th scope="col" colspan="5" class="text-center">INVENTARIO</th>
                                <th scope="col">
                                    <a href="crearInventario.jsp"> <i class="fa fa-plus" aria-hidden="true"></i></a>
                                </th>
                            </tr>
                            <tr>
                                <th scope="col">ID Inventario</th>
                                <th scope="col">Fecha Registro</th>
                                <th scope="col">Tipo Movimiento</th>
                                <th scope="col">Producto ID</th>
                                <th scope="col">Cantidad</th>
                                <th scope="col">Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% 
                                try {
                                    Class.forName("com.mysql.cj.jdbc.Driver");
                                    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sistema_inventario?user=root&password=100122");
                                    st = con.createStatement();
                                    rs = st.executeQuery("SELECT * FROM inventario");
                                    while (rs.next()) {
                            %>
                            <tr>
                                <th scope="row"><%= rs.getString("ID_inventario") %></th>
                                <td><%= rs.getString("Fecha_Registro") %></td>
                                <td><%= rs.getString("Tipo_Movimiento") %></td>
                                <td><%= rs.getString("Producto_ID") %></td>
                                <td><%= rs.getString("Cantidad") %></td>
                                <td>
                                    <a href="editarInventario.jsp?ID_inventario=<%= rs.getString("ID_inventario") %>&Fecha_Registro=<%= rs.getString("Fecha_Registro") %>&Tipo_Movimiento=<%= rs.getString("Tipo_Movimiento") %>&Producto_ID=<%= rs.getString("Producto_ID") %>&Cantidad=<%= rs.getString("Cantidad") %>"><i class="fa fa-pencil" aria-hidden="true"></i></a>
                                    <a href="borrarInventario.jsp?ID_inventario=<%= rs.getString("ID_inventario") %>" class="ml-1"><i class="fa fa-trash" aria-hidden="true"></i></a>
                                </td>
                            </tr>
                            <% 
                                    }
                                } catch (Exception e) {
                                    out.print("Error MySQL: " + e);
                                }
                            %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </body>
</html>
