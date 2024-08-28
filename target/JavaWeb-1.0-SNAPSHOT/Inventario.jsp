<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="Diseño.css">
        <title>Tabla Inventario</title>
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
            <a href="Venta.jsp"><button>Tabla de Ventas</button></a>
            <a href="Producto.jsp"><button>Tabla de Productos</button></a>
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