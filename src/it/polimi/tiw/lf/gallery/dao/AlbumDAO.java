package it.polimi.tiw.lf.gallery.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import it.polimi.tiw.lf.gallery.beans.Album;

public class AlbumDAO {
	private Connection connection;
	
	public AlbumDAO(Connection connection) {
		this.connection = connection;
	}
	
	public List<Album> findAlbumsList() throws SQLException {
		List<Album> albums = new ArrayList<>();
		String query = "SELECT * FROM album ORDER BY date DESC";
		try(PreparedStatement pstatement = connection.prepareStatement(query)) {
			try(ResultSet result = pstatement.executeQuery()) {
				while(result.next()) {
					Album album = new Album();
					album.setId(result.getInt("id"));
					album.setTitle(result.getString("title"));
					album.setDate(result.getDate("date"));
					albums.add(album);
				}
			}
		}
		return albums;
	}
	
	public Album findAlbumById(int albumId) throws SQLException {
		Album album = null;
		String query = "SELECT * FROM album WHERE id = ?";
		try(PreparedStatement pstatement = connection.prepareStatement(query)) {
			pstatement.setInt(1, albumId);
			try(ResultSet result = pstatement.executeQuery()) {
				if(result.next()) {
					album = new Album();
					album.setId(result.getInt("id"));
					album.setTitle(result.getString("title"));
					album.setDate(result.getDate("date"));
				}
			}
		}
		return album;		
	}
}
