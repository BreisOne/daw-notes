package org.example;

import java.io.IOException;
import java.net.URI;
import java.net.URISyntaxException;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.util.Scanner;

public class Main {
    public static void main(String[] args) throws URISyntaxException, IOException, InterruptedException {

        /*String[] ips = {"192.168.7.21", "192.168.7.17", "192.168.7.13", "192.168.7.9", "192.168.7.5", "192.168.7.1",
                "192.168.7.18", "192.168.7.14", "192.168.7.10", "192.168.7.2", "192.168.7.6", "192.168.7.11",
                "192.168.7.15", "192.168.7.19", "192.168.7.3", "192.168.7.20", "192.168.7.16", "192.168.7.8",
                "192.168.7.4"};*/
        String[] ips = {"localhost", "127.0.0.1"};
        play(ips);
    }

    public static String consumeAPI(String ip, String path) throws URISyntaxException, IOException, InterruptedException {
            URI targetURI = new URI("http://" + ip + ":8080/" + path);
            HttpRequest httpRequest = HttpRequest.newBuilder().uri(targetURI).GET().build();
            HttpClient httpClient = HttpClient.newHttpClient();
            HttpResponse<String> response = httpClient.send(httpRequest, HttpResponse.BodyHandlers.ofString());
            return response.body();
    }

    public static void play(String[] ips) throws URISyntaxException, IOException, InterruptedException {
        int numApis = 0;
        int puntuacion = 0;
        Scanner sc = new Scanner(System.in);

        for (String ip: ips) {
            try{
                //Verifica que la API de la IP está disponible
                    for (int i = 1; i < 4; i++) {
                        //Este bucle es para recorrer las 3 pistas
                        //Truco: "pista" + i para acceder a los endPoints correspondientes
                        //Recuerda que si se quiere resolver en la primera pista, no debería
                        //de mostrarse las siguientes.

                        //Se tendra que diseñar la lógica para resolver en la pista en la que
                        //sepas con certeza el personaje.
                        //Además, si resuelves en la primera pista son 10 puntos, en la segunda
                        //5 puntos y en la tercera 3.
                    }
            }catch (Exception e){
                System.out.println("Api no disponible");
                System.out.println("Error" + e);
            }

            System.out.println("Mi puntuación actual es de :" + puntuacion + " puntos");
            System.out.println(numApis + " de " + ips.length + " preguntas");
        }

        System.out.println("PUNTUACIÓN FINAL: " + puntuacion + " puntos en un total de " + numApis + " preguntas");

        //Comprueba que tu nueva puntuación sea superior a la que tienes en tu API.
        //Si es superior envíala para que quede registrado tu nuevo record.
    }

}