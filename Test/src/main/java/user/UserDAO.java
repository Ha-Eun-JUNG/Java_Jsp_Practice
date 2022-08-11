package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {
	private Connection conn; //�ڹٿ� DB ����
	private PreparedStatement pstmt; //������ ��� �� ����
	private ResultSet result; //����� �޾ƿ���
	
	//�⺻ ������
	//DAO�� ����Ǹ� �ڵ����� �����Ǵ� �κ�
	//�޼ҵ帶�� �ݺ��Ǵ� �ڵ带 �̰��� ������	�ڵ尡 ����ȭ��
	
	public UserDAO() {
		try {
			String dbURL = "jdbc:mariadb://localhost:3306/user";
			String dbID = "root";
			String dbPassword = "9786";
			Class.forName("org.mariadb.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		}catch (Exception e){
			e.printStackTrace();
		}
	}
	
	public int login(String id, String pw) {
		String sql = "SELECT id, pw FROM user where id = ?";
		
		try {
			pstmt = conn.prepareStatement(sql); //�������� ��� ��Ŵ
			pstmt.setString(1, id); //ù��° '?'�� �Ű������� �޾ƿ� id�� ������
			result = pstmt.executeQuery();
			if(result.next()) {
				if(result.getString(1).equals(pw)) {
					return 1; //�α��� ����
				}
				else {
					return 0; //��й�ȣ Ʋ��
				}
			}
		return -1; //���̵� ����
		}catch(Exception e){
				e.printStackTrace();
		}
		return -2; //����
	}
	
	public int join(User user) {
		String sql = "INSERT INTO user(name, id, pw) VALUES (?, ?, ?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user.getName());
			pstmt.setString(2, user.getId());
			pstmt.setString(3, user.getPw());
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
		
	}
}

