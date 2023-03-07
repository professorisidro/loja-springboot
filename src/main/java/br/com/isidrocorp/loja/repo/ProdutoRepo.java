package br.com.isidrocorp.loja.repo;

import org.springframework.data.repository.CrudRepository;

import br.com.isidrocorp.loja.model.Produto;

public interface ProdutoRepo extends CrudRepository<Produto, Integer> {

}
