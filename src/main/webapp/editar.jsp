<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <title>editar cliente</title>
    </head>
    <body>
        <%
                String ID_cliente=request.getParameter("ID_cliente");
                String nombre=request.getParameter("nombre");
                String direccion=request.getParameter("direccion");
                String telefono=request.getParameter("telefono");
    
        %>
        <div class="container mt-5">
            <div class="row">
                <div class="col-sm">
                    <form action="editar.jsp" method="get">
                        <div class="form-group">
                            <label for="nombre">Nombre</label>
                            <input type="text" class="form-control" id="nombre" value="<%= nombre %>" name="nombre" placeholder="Nombre" required="required">
                        </div> 
                        <div class="form-group">
                            <label for="direccion">Direccion</label>
                            <input type="text" class="form-control" id="direccion" value="<%= direccion %>" name="direccion" placeholder="Direccion" required="required">
                        </div>
                        <div class="form-group">
                            <label for="telefono">Telefono</label>
                            <input type="text" class="form-control" id="telefono" value="<%= telefono %>" name="telefono" placeholder="Telefono" required="required">
                        </div>
                        <a href="tienda.jsp" class="btn btn-danger">Cancelar <i class="fa fa-ban" aria-hidden="true"></i></a>
                        <button type="submit" name="enviar" class="btn btn-primary">Guardar <i class="fa fa-floppy-o" aria-hidden="true"></i></button>
                        <input type="hidden"  name="ID_cliente" value="<%= ID_cliente %>" >
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
                    st.executeUpdate("update cliente set nombre='"+nombre+"', direccion='"+direccion+"', telefono='"+telefono+"' where ID_cliente='"+ID_cliente+"';");
                    request.getRequestDispatcher("tienda.jsp").forward(request, response);
                } catch (Exception e) {
                   out.print(e);
                }
            }
        %>
    </body>
</html>