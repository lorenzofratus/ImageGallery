package it.polimi.tiw.lf.gallery.controllers;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringEscapeUtils;

import it.polimi.tiw.lf.gallery.beans.Image;
import it.polimi.tiw.lf.gallery.dao.CommentDAO;
import it.polimi.tiw.lf.gallery.dao.ImageDAO;
import it.polimi.tiw.lf.gallery.exceptions.BadCommentFormat;
import it.polimi.tiw.lf.gallery.utils.ConnectionHandler;

@WebServlet("/AddComment")
public class AddComment extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Connection connection;
	
	public void init() throws ServletException {
		connection = ConnectionHandler.getConnection(getServletContext());
	}
	
	public void destroy() {		
		try {
			ConnectionHandler.closeConnection(connection);
		} catch(SQLException e) {
			e.printStackTrace();
		}
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/* Extracts parameters from POST */
		Integer imageId = null;
		String username = null;
		String text = null;
		try {
			imageId = Integer.parseInt(request.getParameter("image"));
			username = StringEscapeUtils.escapeJava(request.getParameter("username"));
			text = StringEscapeUtils.escapeJava(request.getParameter("text"));
			/* Text parameter cannot be empty */
			if(text == null || text.equals("")) {
				response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Your comment cannot be empty");
				return;
			}
			/* Username parameter can be empty, in this case the default is "Anonymous" */
			if(username == null || username.equals(""))
				username = "Anonymous";
		} catch (NumberFormatException | NullPointerException e) {
			response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Incorrect or missing param values");
			return;
		}		
		
		/* Looks for the image to comment it */
		CommentDAO cDAO = new CommentDAO(connection);
		ImageDAO iDAO = new ImageDAO(connection);
		Image image = null;
		try {
			image = iDAO.findImageById(imageId);
			/* ImageId is not a correct image */
			if(image == null) {
				response.sendError(HttpServletResponse.SC_NOT_FOUND, "Image not found");
				return;
			}
			/* Adds the comment */
			cDAO.addComment(username, text, imageId);
		} catch (SQLException e) {
			response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Not possible to create comment");
			return;
		} catch (BadCommentFormat e ) {
			response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Incorrect param values");
			return;
		}
		
		/* Redirects to the Album page */
		response.sendRedirect(getServletContext().getContextPath() + "/Album?album=" + image.getAlbum() + "&image=" + imageId);
	}
}
