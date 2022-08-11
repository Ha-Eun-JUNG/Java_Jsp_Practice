package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {
	private Connection conn; //자바와 DB 연결
	private PreparedStatement pstmt; //쿼리문 대기 및 설정
	private ResultSet result; //결과값 받아오기
	
	//기본 생성자
	//DAO가 실행되면 자동으로 생성되는 부분
	//메소드마다 반복되는 코드를 이곳에 넣으면	코드가 간소화됨
	
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
		String sql = "SELECT pw FROM user where id = ?";
		
		try {
			pstmt = conn.prepareStatement(sql); //쿼리문을 대기 시킴
			pstmt.setString(1, id); //첫번째 '?'에 매개변수로 받아온 id를 대입함
			result = pstmt.executeQuery();
			if(result.next()) {
				if(result.getString(1).equals(pw)) {
					return 1; //로그인 성공
				}
				else {
					return 0; //비밀번호 틀림
				}
			}
		return -1; //아이디 없음
		}catch(Exception e){
				e.printStackTrace();
		}
		return -2; //오류
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

