package DAO;

import java.sql.ResultSet;
import java.sql.SQLException;

import controle.ManipulacaoBanco;
import modelo.Aluno;

public class AlunosDAO {
	/* 
	 * M�todo de cadastro de novo aluno
	 * que recebe um objeto Alunos e insere
	 * seus dados no banco de dados
	 * @return Boolean - Cadastro realizado
	 */
	public static boolean cadastrar(Aluno aluno) {
		
		ResultSet resultado = buscarAluno(aluno);
		
		try {
			if(resultado.next()) {
				System.out.println("Aluno ja cadastrado!");
				return false;
			} else {
				String sql = String.format("INSERT INTO alunos(matricula, nome, curso, campus, turma, ano_semestre, titulo_tcc, senha) "
						+ "VALUES(%d, '%s', '%s', '%s', '%s', '%s', '%s', md5('%s'))",
						aluno.getMatricula(), aluno.getNome(), aluno.getCurso(), aluno.getCampus(), aluno.getTurma(), aluno.getAnoSemestre(),
						aluno.getTituloTCC(), aluno.getSenha());
				
				ManipulacaoBanco.inserirDados(sql);
				
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}

	public static void deletar(Aluno aluno) {
		ResultSet resultado = buscarAluno(aluno);
				
		try {
			if(resultado.next()) {
				String sql = String.format("DETELE FROM alunos WHERE matricula=%d", aluno.getMatricula());
				ManipulacaoBanco.inserirDados(sql);
				
			} else {
				System.out.println("ERRO! Aluno nao encontrado!\nPor favor, verifique os dados.");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void atualizar(int matriculaErrado, Aluno aluno) {
		Aluno alunoErrado = new Aluno();
		alunoErrado.setMatricula(matriculaErrado);
		ResultSet resultado = buscarAluno(alunoErrado);
		
		try {
			if(resultado.next()) {
				String sql = "UPDATE alunos SET ";
				
				if(aluno.getMatricula() != 0) {
					sql += "matricula=" + aluno.getMatricula();
					sql += String.format(" WHERE matricula = %d", matriculaErrado);
					ManipulacaoBanco.inserirDados(sql);
				}
				if(!aluno.getNome().equals("")) {
					sql += String.format("nome='%s'", aluno.getNome());
					sql += String.format(" WHERE matricula = %d", matriculaErrado);
					ManipulacaoBanco.inserirDados(sql);
				}
				if(!aluno.getCurso().equals("")) {
					sql += String.format("curso='%s'", aluno.getCurso());
					sql += String.format(" WHERE matricula = %d", matriculaErrado);
					ManipulacaoBanco.inserirDados(sql);
				}
				if(!aluno.getCampus().equals("")) {
					sql += String.format("campus='%s'", aluno.getCampus());
					sql += String.format(" WHERE matricula = %d", matriculaErrado);
					ManipulacaoBanco.inserirDados(sql);
				}
				if(!aluno.getTurma().equals("")) {
					sql += String.format("turma='%s'", aluno.getTurma());
					sql += String.format(" WHERE matricula = %d", matriculaErrado);
					ManipulacaoBanco.inserirDados(sql);
				}
				if(!aluno.getAnoSemestre().equals("")) {
					sql += String.format("ano_semestre='%s'", aluno.getAnoSemestre());
					sql += String.format(" WHERE matricula = %d", matriculaErrado);
					ManipulacaoBanco.inserirDados(sql);
				}
				if(!aluno.getTituloTCC().equals("")) {
					sql += String.format("titulo_tcc='%s'", aluno.getTituloTCC());
					sql += String.format(" WHERE matricula = %d", matriculaErrado);
					ManipulacaoBanco.inserirDados(sql);
				}
				if(!aluno.getSenha().equals("")) {
					sql += String.format("senha=md5('%s')", aluno.getSenha());
					sql += String.format(" WHERE matricula = %d", matriculaErrado);
					ManipulacaoBanco.inserirDados(sql);
				}
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}
	

	public static ResultSet login(Aluno aluno) {
		ResultSet resultado;
		String sql = String.format("SELECT * FROM alunos WHERE matricula=%d AND senha=md5('%s')", aluno.getMatricula(), aluno.getSenha());
		
		resultado = ManipulacaoBanco.buscarDados(sql);
		return resultado;
	}
	
	public static ResultSet buscarAluno(Aluno aluno) {
		String sql = String.format("SELECT * FROM alunos WHERE matricula=%d", aluno.getMatricula());
		
		return ManipulacaoBanco.buscarDados(sql);
	}
}
