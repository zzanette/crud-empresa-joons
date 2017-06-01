<?php

class Model {
	
	private $db;

	public function __construct(){
		$this->db = DB::getConnection();
	}

	public function getEmployees() {
		$s = $this->db->query("SELECT f.nome as nome, f.sobrenome as sobre, f.rg, f.cpf, s.nome as setor  FROM funcionario f INNER JOIN setor s on s.id = f.id_setor;");

		return $s->fetchAll(PDO::FETCH_ASSOC);;
	}

	public function getClients() {
		$s = $this->db->query("SELECT *  FROM cliente;");

		return $s->fetchAll(PDO::FETCH_ASSOC);
	}

	public function getTotal($table, $col){
		$s = $this->db->query("SELECT format(sum(" .$col. "),2) as total FROM " . $table .";");

		return $s->fetch(PDO::FETCH_ASSOC);
	}

	 public function getCount($table){
        $s = $this->db->query("SELECT count(*) as total FROM " . $table .";");

        return $s->fetch(PDO::FETCH_ASSOC);
    }
}