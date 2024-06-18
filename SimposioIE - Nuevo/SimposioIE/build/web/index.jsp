<%-- 
    Document   : index
    Created on : 13 jun 2024, 08:39:48
    Author     : sergi
--%>

<%@page import="files.documentWriter"%>
<%@page import="files.Encryptor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Tech Conference 2023</title>
        <link rel="stylesheet" href="homePageStyle.css">
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

        <main>
            <section class="title-background text-center" id="title-page">
                <div class="container-title">
                    <br>
                    <h1 class="mb-4">XII Simposio Informática Empresarial</h1>
                    <p class="mb-8">“Transformación digital, desarrollo regional”</p>
                    <div>
                        <a href="registerPage.jsp" class="button">Participar</a>

                        <button class="button button-outline">Leer más</button>
                    </div>
                </div>
            </section>

            <section class="container-info grid-2">
                <div class="text-content">
                    <h2 class="mb-4 mt-16">Sobre el Simposio</h2>
                    <p class="informacion">
                        El Simposio de Informática Empresarial es un evento anual 
                        organizado por la Universidad de Costa Rica en sus 
                        diferentes sedes regionales. Este evento destaca por unir 
                        la fuerza académica regional e involucrar tanto al 
                        estudiantado como a la Sede Rodrigo Facio. A través del 
                        simposio, se han abierto líneas de diálogo, compartido 
                        experiencias, promovido el acercamiento profesional y 
                        empresarial, involucrado a la sociedad en las actividades 
                        universitarias y motivado la investigación desde diversas 
                        perspectivas.
                    </p>
                    <div class="grid-2 info-details">
                        <div>
                            <h3 class="mb-4">Fecha</h3>
                            <p>June 15-16, 2023</p>
                            <br>
                            <h3 class="mb-4">Tópicos de Interés</h3>
                            <ul>
                                <li>Computación en la Nube</li>
                                <li>Inteligencia Artificial</li>
                                <li>Inteligencia Artificial</li>
                            </ul>
                        </div>
                        <div class="columnaDosInfo">
                            <h3 class="mb-4">Localización</h3>
                            <p>Universidad de Costa Rica, Sede del Sur.</p>
                            <h3 class="mb-4 ponentes-title">Ponentes</h3>
                            <p>Más de 20 Expertos</p>
                        </div>
                    </div>
                </div>
                <div class="img-container">
                    <img src="images/clubcentro-frente.crdownload" class="info-img" alt="Imagen Sede Sur" style="border-radius: 30px;">
                </div>
            </section>





            <section class="schedule">
                <div class="container-schedule text-center">
                    <h2 class="mb-8 shchedule-title">Cronograma del Simposio</h2>

                    <div class="container">
                        <form action="" method="get">
                            <button class="button" type="submit" name="selectedDay" value="Day 1">Día 1</button>
                            <button class="button" type="submit" name="selectedDay" value="Day 2">Día 2</button>
                            <button class="button" type="submit" name="selectedDay" value="Day 3">Día 3</button>
                        </form>
                    </div>
                    <br>


                    <div class="grid grid-3">
                        <div class="card keynote">
                            <h3>Keynote Address</h3>
                            <p>Join us for the opening keynote address by industry leaders.</p>
                            <p class="text-gray-500">9:00 AM - 10:00 AM</p>
                        </div>
                        <div class="card workshops">
                            <h3>Technical Workshops</h3>
                            <p>Participate in hands-on workshops to learn new skills.</p>
                            <p class="text-gray-500">10:30 AM - 12:00 PM</p>
                        </div>
                        <div class="card caca">
                            <h3>Caca</h3>
                            <p>Sergy huele a caca.</p>
                            <p class="text-gray-500">9:00 AM - 10:00 AM</p>
                        </div>
                    </div>

                </div>
            </section>

            <section>
                <div class="container-contactus">
                    <h2 class="mb-8">Contáctanos</h2>
                    <form class="form-grid" method="POST">
                        <div class="form-group">
                            <label for="name">Nombre</label>
                            <input type="text" id="name" name="name" required>
                        </div>
                        <div class="form-group">
                            <label for="lastName">Apellidos</label>
                            <input type="text" id="lastName" name="lastName" required>
                        </div>
                        <div class="form-group">
                            <label for="phoneNumber">Numero de Telefono</label>
                            <input type="text" id="phoneNumber" name="phoneNumber" required>
                        </div>
                        <div class="form-group">
                            <label for="email">Correo</label>
                            <input type="email" id="email" name="email" required>
                        </div>
                        <div class="form-group full-width">
                            <label for="message">Detalle</label>
                            <textarea id="message" name="message" rows="5" required></textarea>
                        </div>
                        <div class="form-group full-width">
                            <button type="submit" class="button">Enviar</button>
                        </div>
                    </form>
                    <%
                        if ("POST".equalsIgnoreCase(request.getMethod())) {
                            String nombre = request.getParameter("name");
                            String apellidos = request.getParameter("lastName");
                            String telefono = request.getParameter("phoneNumber");
                            String correo = request.getParameter("email");
                            String detalle = request.getParameter("message");
                            String dataToEncrypt = nombre + ";" + apellidos + ";" + telefono + ";" + correo + ";" + detalle;

                            try {
                                String encryptedData = Encryptor.encryptData(dataToEncrypt);
                                documentWriter.saveToFile(encryptedData, "contactUs.txt");
                                out.println("<p>Enviado Correctamente!</p>");
                            } catch (Exception e) {
                                out.println("<p>Error al enviar: " + e.getMessage() + "</p>");
                            }
                        }
                    %>

                </div>
            </section>
        </main>

        <footer class="footer">
            <div>&copy; Universidad de Costa Rica, Sede del Sur.</div>
            <nav>
                <a href="#">Privacy Policy</a>
                <a href="#">Terms of Service</a>
            </nav>
        </footer>
    </body>
</html>
