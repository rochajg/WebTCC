package DAO;

import java.sql.ResultSet;
import java.sql.SQLException;

import controle.ManipulacaoBanco;
import modelo.Alunos;
import modelo.Orientadores;

public class OrientadoresDAO {
	
	public static boolean cadastrar(Orientadores orientador) {
		
		ResultSet resultado = buscarOrientador(orientador);
		
		try {
			if(resultado.next()) {
				System.out.println("Orientador ja cadastrado!");
				return false;
			} else {
				String sql = String.format("INSERT INTO orientadores(nome, curso, login, senha) VALUES('%s', '%s', '%s', md5('%s')",
						orientador.getNome(), orientador.getCurso(), orientador.getLogin(), orientador.getSenha());
				
				ManipulacaoBanco.inserirDados(sql);
				System.out.println("Orientador cadastrado com sucesso!");
				
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}

	public static void adicionarOrientando(Orientadores orientador, Alunos aluno) {
		ResultSet resultado = buscarOrientador(orientador);
		
		try {
			if(resultado.next()) {
				
				String sql = String.format("INSERT INTO orientador_aluno(id_orientador, id_aluno) VALUES(%d, %d)",
					resultado.getInt("id"), aluno.getMatricula());
				ManipulacaoBanco.inserirDados(sql);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public static void adicionarObservacao(String observacao, Orientadores orientador, Alunos aluno) {
		String sql = String.format("CALL addObservacao('%s', '%s', %d)", observacao, orientador.getNome(), aluno.getMatricula());
		
		ManipulacaoBanco.inserirDados(sql);
	}
	
	public static ResultSet getObservacoes(Orientadores orientador, Alunos aluno) {
		String sql = String.format("CALL getObservacoes('%s', %d)", orientador.getNome(), aluno.getMatricula());		
		ResultSet resultado = ManipulacaoBanco.buscarDados(sql);
		
		return resultado;
	}
	
	public static ResultSet buscarOrientador(Orientadores orientador) {
		String sql = String.format("SELECT * FROM orientadores WHERE nome='%s'", orientador.getNome());
		return ManipulacaoBanco.buscarDados(sql);
	}
}
