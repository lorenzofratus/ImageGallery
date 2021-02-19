package it.polimi.tiw.lf.gallery.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import it.polimi.tiw.lf.gallery.beans.Comment;
import it.polimi.tiw.lf.gallery.exceptions.BadCommentFormat;

public class CommentDAO {
	private Connection connection;
	
	public CommentDAO(Connection connection) {
		this.connection = connection;
	}
	
	public List<Comment> findCommentsByImage(int imageId) throws SQLException {
		List<Comment> comments = new ArrayList<>();
		String query = "SELECT * FROM comment WHERE image = ?";
		try(PreparedStatement pstatement = connection.prepareStatement(query)) {
			pstatement.setInt(1, imageId);
			try(ResultSet result = pstatement.executeQuery()) {
				while(result.next()) {
					Comment comment = new Comment();
					comment.setId(result.getInt("id"));
					comment.setUsername(result.getString("user"));
					comment.setText(result.getString("text"));
					comment.setImage(result.getInt("image"));
					comments.add(comment);
				}
			}
		}
		return comments;
	}
	
	public void addComment(String username, String text, int imageId) throws SQLException, BadCommentFormat {
		if(username == null || username.equals(""))
			throw new BadCommentFormat("Not valid username");
		if(text == null || text.equals(""))
			throw new BadCommentFormat("Not valid comment");
	
		String query = "INSERT into comment (user, text, image) VALUES(?, ?, ?)";
		connection.setAutoCommit(false);
		try(PreparedStatement pstatement = connection.prepareStatement(query)) {
			pstatement.setString(1, username);
			pstatement.setString(2, text);
			pstatement.setInt(3, imageId);
			pstatement.executeUpdate();
			connection.commit();
		} catch (SQLException e) {
			connection.rollback();
			throw e;
		}
	}	
}
