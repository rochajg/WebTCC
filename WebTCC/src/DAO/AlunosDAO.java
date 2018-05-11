package DAO;


import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.MalformedURLException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.util.Calendar;
import java.util.Date;

import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.FontFactory;
import com.itextpdf.text.Image;
import com.itextpdf.text.List;
import com.itextpdf.text.ListItem;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfWriter;

import controle.ManipulacaoBanco;
import modelo.Aluno;

public class AlunosDAO {
	/* 
	 * Mï¿½todo de cadastro de novo aluno
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
	
	public static Aluno preencherAluno(Aluno aluno) {
		ResultSet busca = buscarAluno(aluno);
		Aluno alunoPre = new Aluno();
		
		try {
			if(busca.next()) {
				alunoPre.setMatricula(busca.getInt("matricula"));
				alunoPre.setNome(busca.getString("nome"));
				alunoPre.setCurso(busca.getString("curso"));
				alunoPre.setCampus(busca.getString("campus"));
				alunoPre.setTurma(busca.getString("turma"));
				alunoPre.setAnoSemestre(busca.getString("ano_semestre"));	
				alunoPre.setTituloTCC(busca.getString("titulo_tcc"));
				
				return alunoPre;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return null;
	}
	
	public static void gerarTermoAutoria(Aluno aluno) {
				Document document = new Document(PageSize.A4, 72, 72, 72, 72);
				FileOutputStream arquivo = null;
				
				String campus = "Belém";
				String img1 = "//home//leon//Documents//republica.png";
				String img2 = "//home//leon//Documents//ifpa.png";
				
				String nome = "Leon Vagner Cruz Teixeira", matricula = "2015790005", 
						curso = "Tecnologia em Analise e Desenvolvimento de Sistemas",
						tituloTCC = "Aplicação Móvel Para a Rota Turística Belém-Brangança",
						orientador = "Nenhum";
				
				try {
					arquivo = new FileOutputStream("//home//leon//Documents//teste.pdf");
				} catch (FileNotFoundException e) {
					e.printStackTrace();
				}
				
				try {
					PdfWriter.getInstance(document, arquivo);
					
					document.open();
					
					Font fonteCabecalho = FontFactory.getFont(FontFactory.HELVETICA, 8);
					Font fonteTitulo = FontFactory.getFont(FontFactory.HELVETICA, 14, Font.BOLD);
					Font fonteTexto = FontFactory.getFont(FontFactory.HELVETICA, 12);
					
					Image logo_republica = Image.getInstance(String.format(img1));
					Image logo_ifpa = Image.getInstance(String.format(img2));
							
					Paragraph cabecalho = new Paragraph(String.format("SERVIÇO PÚBLICO FEDERAL\n"
							+ "MINISTÉRIO DA EDUCAÇÃO\n"
							+ "INSTITUTO FEDERAL DE EDUCAÇÃO, CIÊNCIA E TECNOLOGIA DO PARÁ\n"
							+ "CAMPUS %s\n"
							+ "DIRETORIA DE ENSINO\n", campus), fonteCabecalho);
					
					Paragraph linhaEmBranco =  new Paragraph("\n");
					
					Paragraph titulo =  new Paragraph("TERMO DE RESPONSABILIDADE DE AUTORIA", fonteTitulo);
					
					Paragraph conteudo1 = new Paragraph(String.format("Eu %s, matrícula nº %s, estudante do curso %s,"
							+ "do IFPA Campus %s, estou ciente de que é considerada utilização indevida, ilegal "
							+ "e/ou plágio, os seguintes casos: \n\n", nome, matricula, curso, campus), fonteTexto);
					
					String texto1 = "Texto de autoria de terceiros.";
					String texto2 = "Texto adaptado em parte ou totalmente.";
					String texto3 = "Texto produzido por terceiros, sob encomenda, mediante pagamento (ou não) de "
							+ "horonários profissionais.";
					
					Paragraph conteudo2 = new Paragraph("Declaro estar ciente de que, caso constado o envolvimento de meu TCC"
							+ "em alguma das situações supracitadas, o mesmo será considerado nulo, tornando-se inválidos todos"
							+ "os atos decorrentes de sua apresentação.", fonteTexto);
					
					Paragraph conteudo3 = new Paragraph("Ademais, estou ciente ainda que tais práticas são consideradas faltas"
							+ "graves, estando seu praticante sujeito às sansões administrativas, disciplinares e penais"
							+ "eventualmente cabíveis.", fonteTexto);
					
					Paragraph conteudo4 = new Paragraph(String.format("Logo, declaro ser de minha autoria o texto referente ao trabalho"
							+ "de Conclusão de Curso sob o título %s, orientado pelo professor %s.", tituloTCC, orientador), fonteTexto);
						
					Calendar c = Calendar.getInstance();
					c.setTime(new Date());
					DateFormat df = DateFormat.getDateInstance(DateFormat.LONG);
					
					Paragraph data = new Paragraph(String.format("%s, %s", campus, df.format(c.getTime())), fonteTexto);
					
					cabecalho.setAlignment(cabecalho.ALIGN_CENTER);
					
					titulo.setAlignment(titulo.ALIGN_CENTER);
					conteudo1.setAlignment(conteudo1.ALIGN_JUSTIFIED);
					conteudo1.setFirstLineIndent(20);
					
					conteudo2.setAlignment(conteudo1.ALIGN_JUSTIFIED);
					conteudo2.setFirstLineIndent(20);
					
					conteudo3.setAlignment(conteudo1.ALIGN_JUSTIFIED);
					conteudo3.setFirstLineIndent(20);
					
					conteudo4.setAlignment(conteudo1.ALIGN_JUSTIFIED);
					conteudo4.setFirstLineIndent(20);
					
					data.setAlignment(data.ALIGN_RIGHT);
					
					logo_republica.setAbsolutePosition(50, 700);
					logo_republica.scaleToFit(50, 50);
					
					logo_ifpa.setAbsolutePosition(500, 700);
					logo_ifpa.scaleToFit(60, 60);
					
					List lista = new List();
					lista.setListSymbol("\u2022 ");
					
					ListItem item1 = new ListItem(texto1, fonteTexto);
					ListItem item2 = new ListItem(texto2, fonteTexto);
					ListItem item3 = new ListItem(texto3, fonteTexto);
					
					item1.setAlignment(Element.ALIGN_MIDDLE);
					item2.setAlignment(Element.ALIGN_MIDDLE);
					item3.setAlignment(Element.ALIGN_MIDDLE);
					lista.add(item1);
					lista.add(item2);
					lista.add(item3);
					
					
					document.add(cabecalho);
					document.add(logo_republica);
					document.add(logo_ifpa);
					document.add(linhaEmBranco);
					document.add(linhaEmBranco);
					document.add(titulo);
					document.add(linhaEmBranco);
					document.add(conteudo1);
					document.add(lista);
					document.add(linhaEmBranco);
					document.add(conteudo2);	
					document.add(conteudo3);
					document.add(conteudo4);
					
				for(int i=0; i<10; i++) {
						document.add(linhaEmBranco);
					}
					document.add(data);
					
					
				} catch(DocumentException de) {
					System.err.println(de.getMessage());
				} catch (MalformedURLException e) {
		
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
				
		        document.close();
			}
}
