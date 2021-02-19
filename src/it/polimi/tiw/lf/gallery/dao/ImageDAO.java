package it.polimi.tiw.lf.gallery.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import it.polimi.tiw.lf.gallery.beans.Image;

public class ImageDAO {
	private Connection connection;
	
	public ImageDAO(Connection connection) {
		this.connection = connection;
	}
	
	public List<Image> findImagesByAlbum(int albumId) throws SQLException {
		List<Image> images = new ArrayList<>();
		String query = "SELECT * FROM image WHERE album = ? ORDER BY date DESC";
		try(PreparedStatement pstatement = connection.prepareStatement(query)) {
			pstatement.setInt(1, albumId);
			try(ResultSet result = pstatement.executeQuery()) {
				while(result.next()) {
					Image image = new Image();
					image.setId(result.getInt("id"));
					image.setTitle(result.getString("title"));
					image.setDescription(result.getString("description"));
					image.setDate(result.getDate("date"));
					image.setSrc(result.getString("src"));
					image.setAlbum(result.getInt("album"));
					images.add(image);
				}
			}
		}
		return images;
	}
	
	public Image findImageById(int imageId) throws SQLException {
		Image image = null;
		String query = "SELECT * FROM image WHERE id = ?";
		try(PreparedStatement pstatement = connection.prepareStatement(query)) {
			pstatement.setInt(1, imageId);
			try(ResultSet result = pstatement.executeQuery()) {
				if(result.next()) {
					image = new Image();
					image.setId(result.getInt("id"));
					image.setTitle(result.getString("title"));
					image.setDescription(result.getString("description"));
					image.setDate(result.getDate("date"));
					image.setSrc(result.getString("src"));
					image.setAlbum(result.getInt("album"));
				}
			}
		}
		return image;		
	}
}
