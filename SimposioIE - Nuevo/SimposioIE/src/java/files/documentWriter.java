/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package files;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.charset.StandardCharsets;
import java.nio.file.Path;
/**
 *
 * @author josue
 */
import java.nio.file.*;
import java.nio.charset.StandardCharsets;
import java.io.IOException;

public class documentWriter {
    public static void saveToFile(String encryptedData, String fileName) throws Exception {
        // Especifica la ruta del directorio donde quieres guardar el archivo
        String directoryPath = "D:\\SERGIO\\OneDrive\\Documentos\\NetBeansProjects\\SimposioIE\\SimposioIE\\txts";
        
        Path path = Paths.get(directoryPath, fileName);
        
        if (!Files.exists(path.getParent())) {
            Files.createDirectories(path.getParent());
        }

        try {
            // Abrir el archivo en modo append
            Files.write(path, (encryptedData + System.lineSeparator()).getBytes(StandardCharsets.UTF_8), StandardOpenOption.CREATE, StandardOpenOption.APPEND);
        } catch (IOException e) {
            throw new Exception("Error al guardar los datos: " + e.getMessage(), e);
        }
    }
}
