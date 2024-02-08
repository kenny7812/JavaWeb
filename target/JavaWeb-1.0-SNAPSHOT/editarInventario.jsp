<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
    <title>Editar Inventario</title>
</head>
<body>
    <%
        String ID_inventario=request.getParameter("ID_inventario");
        String Fecha_Registro=request.getParameter("Fecha_Registro");
        String Tipo_Movimiento=request.getParameter("Tipo_Movimiento");
        String Producto_ID=request.getParameter("Producto_ID");
        String Cantidad=request.getParameter("Cantidad");
    %>
    <div class="container mt-5">
        <div class="row">
            <div class="col-sm">
                <form action="editarInventario.jsp" method="post">
                    <div class="form-group">
                        <label for="Fecha_Registro">Fecha Registro</label>
                        <input type="text" class="form-control" id="Fecha_Registro" value="<%= Fecha_Registro %>" name="Fecha_Registro" placeholder="Fecha Registro" required="required">
                    </div> 
                    <div class="form-group">
                        <label for="Tipo_Movimiento">Tipo Movimiento</label>
                        <input type="text" class="form-control" id="Tipo_Movimiento" value="<%= Tipo_Movimiento %>" name="Tipo_Movimiento" placeholder="Tipo Movimiento" required="required">
                    </div>
                    <div class="form-group">
                        <label for="Producto_ID">Producto ID</label>
                        <input type="text" class="form-control" id="Producto_ID" value="<%= Producto_ID %>" name="Producto_ID" placeholder="Producto ID" required="required">
                    </div>
                    <div class="form-group">
                        <label for="Cantidad">Cantidad</label>
                        <input type="text" class="form-control" id="Cantidad" value="<%= Cantidad %>" name="Cantidad" placeholder="Cantidad" required="required">
                    </div>
                    <a href="tienda.jsp" class="btn btn-danger">Cancelar <i class="fa fa-ban" aria-hidden="true"></i></a>
                    <button type="submit" name="enviar" class="btn btn-primary">Guardar <i class="fa fa-floppy-o" aria-hidden="true"></i></button>
                    <input type="hidden" name="ID_inventario" value="<%= ID_inventario %>" >
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
                st.executeUpdate("UPDATE inventario SET Fecha_Registro='"+Fecha_Registro+"', Tipo_Movimiento='"+Tipo_Movimiento+"', Producto_ID='"+Producto_ID+"', Cantidad='"+Cantidad+"' WHERE ID_inventario='"+ID_inventario+"';");
                request.getRequestDispatcher("tienda.jsp").forward(request, response);
            } catch (Exception e) {
               out.print(e);
            }
        }
    %>
</body>
</html>
