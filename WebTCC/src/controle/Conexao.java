package controle;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Conexao {
	private static String db = "tcc_ifpa";
	private static String endereco = "localhost";
	private static String porta = "3306";
	private static String caminho = "jdbc:mysql://"+ endereco +":"+ porta +"/" + db;
	private static String login = "root";
	private static String senha = "root";
	private static Connection con;
	
	public static Connection conectar() {
		// Função que realiza a conexeão com o banco
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			System.out.println("Carregou o driver");
			
			con = DriverManager.getConnection(caminho, login, senha);
			System.out.println("Estabeleceu conexao");
			
		} catch (ClassNotFoundException e) {
			System.out.println("Erro ao carregar o Driver");
			System.out.println(e);
		
		} catch (SQLException e) {
			System.out.println("Erro ao tentar estabelecer conexao");
			System.out.println(e);
		}
		
		
		return con;
	}
}
