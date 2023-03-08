package br.com.isidrocorp.loja.services;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;

@Component
@Qualifier("alternativa")
public class MensagemSErviceImplAlternativa implements IMensagemService {

	@Override
	public String gerarUmaMensagem() {
		// TODO Auto-generated method stub
		return "Mensagem Alternativa de testes";
	}
	
	
}
