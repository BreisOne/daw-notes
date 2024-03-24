package com.example.juegoAPI.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URI;
import java.net.URISyntaxException;
import java.net.URL;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;


@RequestMapping("/")
@RestController
public class JuegoRestController {
	
	int visits = 0;
	int score = 0;
	
	
	@GetMapping("/statistics")
	public String statics() {
		return "Número de visitas: " + visits;
	}
	
	@GetMapping("/")
	public boolean hello() {
		visits++;
		return true;
	}
	
	@GetMapping("/pista1")
	public String pista1() {
		return "Superheroe de Marvel con traje rojo y azul";
	}
	
	@GetMapping("/pista2")
	public String pista2() {
		return "Su amor es Jane";
	}
	
	@GetMapping("/pista3")
	public String pista3() {
		return "Suele moverse por la ciudad con telas de araña";
	}
	
	@GetMapping("/resolver/{name}")
	public boolean pista1Resolver(@PathVariable String name) {
		if(name.equalsIgnoreCase("spiderman")) {
			return true;
		}
		return false;
	}
	
	@GetMapping("/score")
	public int score() {
		return score;
	}
	
	@GetMapping("/score/ff456889211/{score}")
	public void addScore(@PathVariable int score) {
		this.score = score;
	}
	
	


}

