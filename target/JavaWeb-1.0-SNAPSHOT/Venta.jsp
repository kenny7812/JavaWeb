<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="Diseño.css">
        <title>Tabla Venta</title>
    </head>
    <body>
        <% 
            Connection con = null;
            Statement st = null;
            ResultSet rs = null;
        %>
        <br>
        <div class="container-buttons">
            <a href="tienda.jsp"><button>Tabla de Clientes</button></a>
            <a href="Proveedor.jsp"><button>Tabla de Proveedores</button></a>
            <a href="Compra.jsp"><button>Tabla de Compras</button></a>
            <a href="Producto.jsp"><button>Tabla de Productos</button></a>
            <a href="Inventario.jsp"><button>Tabla de Inventario</button></a>
        </div>
        <div class="container mt-5">
            <div class="row">
                <div class="col-sm">
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th scope="col" colspan="7" class="text-center">VENTAS</th>
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
    </body>
</html>