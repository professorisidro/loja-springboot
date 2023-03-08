package br.com.isidrocorp.loja.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import br.com.isidrocorp.loja.services.IMensagemService;

@RestController
public class ControllerTeste {
	
	@Autowired
	@Qualifier("alternativa")
	IMensagemService service;
	
	@GetMapping("/hello")
	public String digaOla() {
		return service.gerarUmaMensagem();
	}
}
