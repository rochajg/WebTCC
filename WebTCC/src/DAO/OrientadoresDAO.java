package DAO;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import controle.ManipulacaoBanco;
import modelo.Aluno;
import modelo.Orientador;

public class OrientadoresDAO {
	
	public static boolean cadastrar(Orientador orientador) {
		
		ResultSet resultado = buscarOrientador(orientador);
		
		try {
			if(resultado.next()) {
				System.out.println("Orientador ja cadastrado!");
				return false;
			} else {
				String sql = String.format("INSERT INTO orientadores(nome, curso, login, senha) VALUES('%s', '%s', '%s', md5('%s'))",
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

	public static void adicionarOrientando(Orientador orientador, Aluno aluno) {
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
	
	public static void adicionarObservacao(String observacao, Orientador orientador, Aluno aluno) {
		String sql = String.format("CALL addObservacao('%s', '%s', %d)", observacao, orientador.getNome(), aluno.getMatricula());
		System.out.println(aluno.getMatricula());
		
		ManipulacaoBanco.inserirDados(sql);
	}
	
	public static ResultSet getObservacoes(Orientador orientador, Aluno aluno) {
		String sql = String.format("CALL getObservacoes('%s', %d)", orientador.getNome(), aluno.getMatricula());		
		ResultSet resultado = ManipulacaoBanco.buscarDados(sql);
		
		return resultado;
	}
	
	public static ResultSet login(Orientador orientador) {
		ResultSet resultado;
		String sql = String.format("SELECT * FROM orientadores WHERE login='%s' AND senha=md5('%s')", orientador.getLogin(), orientador.getSenha());
		
		resultado = ManipulacaoBanco.buscarDados(sql);
		
		return resultado;
	}
	
	public static ArrayList<Aluno> buscarOrientandos(Orientador orientador) {
		String sql = String.format("SELECT id_aluno FROM orientador_aluno WHERE id_orientador=%d", orientador.getId());
		ResultSet listaOrientandos = ManipulacaoBanco.buscarDados(sql);
		ArrayList<Aluno> alunos = new ArrayList<Aluno>();
		
		try {
			if(listaOrientandos.next())
				do {
					ResultSet aluno = AlunosDAO.buscarAluno(new Aluno(listaOrientandos.getInt("id_aluno")));
					
					if(aluno.next()) {
						alunos.add(new Aluno(
								aluno.getInt("matricula"),
								aluno.getString("nome"),
								aluno.getString("curso"),
								aluno.getString("campus"),
								aluno.getString("turma"),
								aluno.getString("ano_semestre"),
								aluno.getString("titulo_tcc")
								));
						System.out.println(aluno.getString("nome"));
					} 
				} while(listaOrientandos.next()) ;
			
			return alunos;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
		
	}
	
	public static boolean addOrientando(Orientador ori, int mat) {
		String sql = String.format("SELECT * FROM alunos WHERE matricula=%d", mat);
		ResultSet busca = ManipulacaoBanco.buscarDados(sql);
		
		
		try {
			if(busca.next()) {
				sql = String.format("SELECT * FROM orientador_aluno WHERE id_orientador=%d AND id_aluno=%d", ori.getId(), mat);
				busca = ManipulacaoBanco.buscarDados(sql);
				if(!busca.next()) {
					sql = String.format("INSERT INTO orientador_aluno(id_orientador, id_aluno) VALUES(%d, %d)", ori.getId(), mat);
					ManipulacaoBanco.inserirDados(sql);
					return true;
				}
			} else {
				return false;
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		return false;
		
	}
	
	public static ResultSet buscarOrientador(Orientador orientador) {
		String sql = String.format("SELECT * FROM orientadores WHERE nome='%s'", orientador.getNome());
		return ManipulacaoBanco.buscarDados(sql);
	}
}
