<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <title>Base De Datos</title>
    </head>
    <body>
        <% 
            Connection con = null;
            Statement st = null;
            ResultSet rs = null;
        %>
        <h1>Menu Principal</h1>
        <div style="text-align: right; margin-right: 20px;">
            <a href="Producto.jsp"><button>Tabla de Productos</button></a>
            <a href="Proveedor.jsp"><button>Tabla de Proveedores</button></a>
            <a href="Compra.jsp"><button>Tabla de Compras</button></a>
            <a href="Venta.jsp"><button>Tabla de Ventas</button></a>
            <a href="Inventario.jsp"><button>Tabla de Inventario</button></a>
        </div>
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
    </body>
</html>
