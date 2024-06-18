<%-- 
    Document   : registerPage
    Created on : Jun 13, 2024, 1:40:54?AM
    Author     : josue
--%>

<%@page import="files.Encryptor"%>
<%@page import="files.documentWriter"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Registro de Usuarios</title>
        <link rel="stylesheet" href="registerPageStyle.css"> 
    </head>
    <body>
        <header>
            <div class="logos">
                <img src="images/logo-UCR.jpeg" alt="logi ucr" class="ucrlogo"/>
                <img src="images/cie-horizontal.jpeg" alt="Logo CIE regional" class="cielogo"/>
            </div>
            <nav>
                <a href="#">Accesibilidad</a>
                <a href="index.jsp">Inicio</a>
                <a href="registerPage.jsp">Participar</a>
                <a href="#">Contactanos</a>
                <a href="#">Cronograma</a>
                <a href="#">Localización</a>
            </nav>
        </header>

        <div class="container">
            <h2>Registro de Usuarios</h2>
            <form method="POST">
                <div class="form-group">
                    <label for="nombre">Nombre:</label>
                    <input type="text" id="nombre" name="nombre" required>
                </div>
                <div class="form-group">
                    <label for="correo">Correo:</label>
                    <input type="email" id="correo" name="correo" required>
                </div>
                <div class="form-group">
                    <label for="identificacion">Identificación:</label>
                    <input type="text" id="identificacion" name="identificacion" required>
                </div>
                <div class="form-group">
                    <label for="institucion">Institución Educativa:</label>
                    <input type="text" id="institucion" name="institucion" required>
                </div>
                <div class="form-group">
                    <label for="area">Área de Interés:</label>
                    <input type="text" id="area" name="area" required>
                </div>
                <div class="form-group">
                    <label for="tipo">Tipo de Participante:</label>
                    <select id="tipo" name="tipo" required>
                        <option value="asistente">Asistente</option>
                        <option value="ponente">Ponente</option>
                        <option value="empresa">Empresa</option>
                        <option value="estudiante">Estudiante</option>
                        <option value="docente">Docente</option>
                    </select>
                </div>

                <div class="form-group-submit">
                    <input type="submit" value="Registrarse">
                </div>
            </form>
            <%
                if ("POST".equalsIgnoreCase(request.getMethod())) {
                    String nombre = request.getParameter("nombre");
                    String correo = request.getParameter("correo");
                    String identificacion = request.getParameter("identificacion");
                    String institucion = request.getParameter("institucion");
                    String area = request.getParameter("area");
                    String tipo = request.getParameter("tipo");
                    String rol = request.getParameter("rol");

                    String dataToEncrypt = nombre + ";" + correo + ";" + identificacion + ";" + institucion + ";" + area + ";" + tipo + ";" + rol;

                    try {
                        String encryptedData = Encryptor.encryptData(dataToEncrypt);
                        String fileName = "";
                        switch (tipo) {
                            case "asistente":
                                fileName = "assistant.txt";
                                break;
                            case "ponente":
                                fileName = "speakers.txt";
                                break;
                            case "empresa":
                                fileName = "company.txt";
                                break;

                            case "estudiante":
                                fileName = "students.txt";
                                break;

                            case "docente":
                                fileName = "professors.txt";
                                break;
                            default:
                                fileName = "otros.txt";
                                break;
                        }

                        documentWriter.saveToFile(encryptedData, fileName);
                        out.println("<p>Enviado Correctamente!</p>");
                    } catch (Exception e) {
                        out.println("<p>Error al enviar: " + e.getMessage() + "</p>");
                    }
                }
            %>

        </div>
        <footer class="footer">
            <div>&copy; 2024 Tech Conference. All rights reserved.</div>
            <nav>
                <a href="#">Privacy Policy</a>
                <a href="#">Terms of Service</a>
            </nav>
        </footer>
    </body>
</html>
