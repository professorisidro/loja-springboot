package br.com.isidrocorp.loja.services;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;

@Component
@Qualifier("principal")
public class MensagemServiceImpl1 implements IMensagemService {

	@Override
	public String gerarUmaMensagem() {
		// TODO Auto-generated method stub
		return "Agora vai!!! Vamo entender tudao de SpringBoot!";
	}

}
