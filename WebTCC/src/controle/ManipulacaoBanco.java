package controle;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import controle.Conexao;

public class ManipulacaoBanco {
	// Classe que executa as funções das classes 'DAO'
	
	public static Connection con;
    public static Statement stm;
    
	public static void executarQuery(String sql){
		con = Conexao.conectar();
		try {
			stm = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		
		try {
			stm.executeUpdate(sql);
			System.out.println("Operacao realizada com sucesso");
		} catch (SQLException e) {
			System.out.println("Erro ao realizar operacao");
			System.out.println(e);
		}
	}
	
	
	public static ResultSet alterarDados(String sql) {		
		con = Conexao.conectar();
		try {
			stm = con.createStatement();
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		ResultSet resultado = null;
		
		try {
			resultado = stm.executeQuery(sql);
			System.out.println("Dados alterados com sucesso");
			
		} catch (SQLException e) {
			System.out.println("Erro ao realizar operacao");
			System.out.println(e);
		}
		
		return resultado;
	}
}
