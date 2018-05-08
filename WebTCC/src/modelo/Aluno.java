package modelo;

public class Aluno {
	private int matricula = 0; 
	private String nome="", 
				   curso="", 
				   campus="",
				   turma="",
				   anoSemestre="",
				   tituloTCC="",
				   senha="";
	
	public Aluno() {
		
	}
	
	public Aluno(int matricula, String nome, String curso, String campus, String turma, String anoSemestre,
			String tituloTCC, String senha) {
		super();
		this.matricula = matricula;
		this.nome = nome;
		this.curso = curso;
		this.campus = campus;
		this.turma = turma;
		this.anoSemestre = anoSemestre;
		this.tituloTCC = tituloTCC;
		this.senha = senha;
	}
	public int getMatricula() {
		return matricula;
	}
	public void setMatricula(int matricula) {
		this.matricula = matricula;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public String getCurso() {
		return curso;
	}
	public void setCurso(String curso) {
		this.curso = curso;
	}
	public String getCampus() {
		return campus;
	}
	public void setCampus(String campus) {
		this.campus = campus;
	}
	public String getTurma() {
		return turma;
	}
	public void setTurma(String turma) {
		this.turma = turma;
	}
	public String getAnoSemestre() {
		return anoSemestre;
	}
	public void setAnoSemestre(String anoSemestre) {
		this.anoSemestre = anoSemestre;
	}
	public String getTituloTCC() {
		return tituloTCC;
	}
	public void setTituloTCC(String tituloTCC) {
		this.tituloTCC = tituloTCC;
	}
	public String getSenha() {
		return senha;
	}
	public void setSenha(String senha) {
		this.senha = senha;
	}
	
}