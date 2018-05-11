package utilidade;

import java.io.FileOutputStream;
import java.io.OutputStream;
import java.sql.ResultSet;
import java.text.DateFormat;
import java.util.Calendar;
import java.util.Date;

import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Document;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.Font.FontFamily;
import com.itextpdf.text.Image;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Rectangle;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;

import DAO.AlunosDAO;
import DAO.OrientadoresDAO;
import modelo.Aluno;
import modelo.Orientador;

public class PDFTeste {
    public static void main(String[] args) throws Exception {
    	Orientador ori = new Orientador(1, "Marcio Warris", "TADS");
    	Aluno aluno = new Aluno(2015790019);
    	aluno = AlunosDAO.preencherAluno(aluno);
    	ResultSet observacoes = OrientadoresDAO.getObservacoes(ori, aluno);
    	
    	String caminho = "pdfs/faatcc_"+ aluno.getMatricula() +".pdf";
    	
    	Calendar c = Calendar.getInstance();
		Date data = c.getTime();
		DateFormat f;

		f = DateFormat.getDateInstance(DateFormat.LONG);
		
    	
        Document doc = null;
        OutputStream os = null;

        try {
            //cria o documento tamanho A4, margens de 2,54cm
        	Rectangle rect = new Rectangle(841, 595);
        	Font fontCabecalho = new Font(FontFamily.HELVETICA, 10, Font.BOLD),
        		 fontTitulo = new Font(FontFamily.HELVETICA, 12, Font.BOLD),
        		 fontPadrao = new Font(FontFamily.HELVETICA, 10, Font.NORMAL);
            doc = new Document(rect, 72, 72, 72, 72);
            
            Image logo_republica = Image.getInstance("imgs/republica.jpg");
            Image logo_ifpa = Image.getInstance("imgs/ifpa.jpg");
            
            logo_republica.scaleToFit(60, 60);
            logo_ifpa.scaleToFit(80, 80);
            
            logo_republica.setAbsolutePosition(72, 595-(72+60));
            logo_ifpa.setAbsolutePosition(841-(72+80), 595-(72+80));
            
          //adiciona o texto ao PDF
            Paragraph cabecalho = new Paragraph(
            		"SERVI�O P�BLICO FEDERAL\n" +
            		"MINIST�RIO DA EDUCA��O\n" +
            		"INSTITUTO FEDERAL DE EDUCA��O, CI�NCIA E TECNOLOGIA DO PAR�\n" +
            		"CAMPUS BEL�M\n" +
            		"DIRETORIA DE ENSINO",
            		fontCabecalho);
            cabecalho.setAlignment(Element.ALIGN_CENTER);
            
            Paragraph titulo = new Paragraph("FICHA DE ACOMPANHAMENTO DAS ATIVIDADES DO TRABALHO DE CONCLUS�O DE CURSO", fontTitulo);
            titulo.setAlignment(Element.ALIGN_CENTER);
            titulo.setSpacingAfter(10);
            titulo.setSpacingBefore(10);
            
            Paragraph informacoes = new Paragraph(String.format(
            		"Orientador: %s --- Ano/ Semestre: %s \n" +
            		"Curso: %s --- Turma: %s \n" +
            		"Alunos/Orientandos: %s \n" +
            		"Titulo do TCC: %s"
            		, ori.getNome(), aluno.getAnoSemestre(), aluno.getCurso(), aluno.getTurma(), aluno.getNome(), aluno.getTituloTCC())
            		, fontPadrao);
            informacoes.setAlignment(Element.ALIGN_JUSTIFIED);
            informacoes.setSpacingAfter(10);
            informacoes.setSpacingBefore(10);
            
            Paragraph rodape = new Paragraph(String.format(
            		"%s/PA, %s.", 
            		aluno.getCampus(), f.format(data))
            		, fontTitulo);
            rodape.setAlignment(Element.ALIGN_JUSTIFIED);
            rodape.setSpacingAfter(10);
            rodape.setSpacingBefore(10);
            
            Paragraph assinaturas = new Paragraph(
            		"_____________________________________________________               _________________________________________________\n" +
            		"            Assinatura do Professor/Orientador                                                     Assinatura do Coordenador\n"
            		, fontCabecalho);
            assinaturas.setAlignment(Element.ALIGN_JUSTIFIED);
            assinaturas.setSpacingBefore(10);
            
            PdfPTable table = new PdfPTable(3);
            table.setWidthPercentage((float) 100.0);
            table.setSpacingAfter(20);
            
            PdfPCell header_data = new PdfPCell(new Paragraph("DATA", fontCabecalho));
            PdfPCell header_observacao = new PdfPCell(new Paragraph("OBSERVA��ES E CONSIDERA��ES SOBRE A ORENTA��O", fontCabecalho));
            PdfPCell header_assinaturas = new PdfPCell(new Paragraph("ASSINATURA DOS ORIENTANDOS E ORIENTADOR", fontCabecalho));
            
            header_data.setBackgroundColor(BaseColor.LIGHT_GRAY);
            header_observacao.setBackgroundColor(BaseColor.LIGHT_GRAY);
            header_assinaturas.setBackgroundColor(BaseColor.LIGHT_GRAY);
            
            table.addCell(header_data);
            table.addCell(header_observacao);
            table.addCell(header_assinaturas);
            
            if(observacoes.next()) {
            	do {
            		table.addCell(observacoes.getDate("data_obs").toString());
            		table.addCell(observacoes.getString("observacao"));
            		table.addCell("");
            	} while(observacoes.next());
            } else {
            	table.addCell("\n\n");
            	table.addCell("\n\n");
            	table.addCell("\n\n");
            }
            
            

            //cria a stream de sa�da
            os = new FileOutputStream(caminho);

            //associa a stream de sa�da ao 
            PdfWriter.getInstance(doc, os);

            //abre o documento
            doc.open();
            
            doc.add(logo_republica);
            doc.add(logo_ifpa);
            doc.add(cabecalho);
            doc.add(titulo);
            doc.add(informacoes);
            doc.add(table);
            doc.add(rodape);
            doc.add(assinaturas);

        } finally {
            if (doc != null) {
                //fechamento do documento
                doc.close();
            }
            if (os != null) {
                //fechamento da stream de sa�da
                os.close();
            }
        }
    }
}