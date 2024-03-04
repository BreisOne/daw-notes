package com.example.juegoAPI.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RequestMapping("/")
@RestController
public class controllerAPI {
	int visits;
	
	@GetMapping("/")
	public boolean hello () {
		visits++;
		return true;
	}
	
	@GetMapping("/pista1")
	public String pista1() {
		return "Es calvo cual bola de billar";
	}
	@GetMapping("/pista2")
	public String pista2() {
		return "Cuando se afeita parece una persona diferente";
	}
	@GetMapping("/pista3")
	public String pista3() {
		return "Le gustan las Bases de datos";
	}
	@GetMapping("/resolver/{name}")
	public boolean pista1Resolver(@PathVariable String name) {
		if(name.equalsIgnoreCase("sancho")){
			return true;
		}
		
		return false;
	}
	@GetMapping("/score")
	public int score() {
		return score
	}
	@GetMapping("/score/gsgfshfdhfd/{score}")
	public void
	
	
	
}
