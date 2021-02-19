package it.polimi.tiw.lf.gallery.controllers;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringEscapeUtils;
import org.thymeleaf.TemplateEngine;
import org.thymeleaf.context.WebContext;
import org.thymeleaf.templatemode.TemplateMode;
import org.thymeleaf.templateresolver.ServletContextTemplateResolver;

import it.polimi.tiw.lf.gallery.beans.Album;
import it.polimi.tiw.lf.gallery.beans.Comment;
import it.polimi.tiw.lf.gallery.beans.Image;
import it.polimi.tiw.lf.gallery.dao.AlbumDAO;
import it.polimi.tiw.lf.gallery.dao.CommentDAO;
import it.polimi.tiw.lf.gallery.dao.ImageDAO;
import it.polimi.tiw.lf.gallery.utils.ConnectionHandler;

@WebServlet("/Album")
public class GoToAlbum extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Connection connection;
	private TemplateEngine templateEngine;
	
	private final int pageSize = 5;
	
	public void init() throws ServletException {
		ServletContext servletContext = getServletContext();
		ServletContextTemplateResolver templateResolver = new ServletContextTemplateResolver(servletContext);
		templateResolver.setTemplateMode(TemplateMode.HTML);
		this.templateEngine = new TemplateEngine();
		this.templateEngine.setTemplateResolver(templateResolver);
		templateResolver.setSuffix(".html");
		connection = ConnectionHandler.getConnection(getServletContext());
	}
	
	public void destroy() {		
		try {
			ConnectionHandler.closeConnection(connection);
		} catch(SQLException e) {
			e.printStackTrace();
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/* Extracts parameters from GET */		
		Integer albumId = null;
		Integer imageId = null;
		try {
			albumId = Integer.parseInt(request.getParameter("album"));
			String imageIdString = StringEscapeUtils.escapeJava(request.getParameter("image"));
			/* ImageId can be null, in this case the default is the first image of the album */
			if(imageIdString != null)
				imageId = Integer.parseInt(imageIdString);
		} catch (NumberFormatException | NullPointerException e) {
			response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Incorrect or missing param values");
			return;
		}		

		/* Fetches the selected album and all its images */
		AlbumDAO aDAO = new AlbumDAO(connection);
		ImageDAO iDAO = new ImageDAO(connection);
		Album album = null;
		List<Image> images = null;
		try {
			album = aDAO.findAlbumById(albumId);
			images = iDAO.findImagesByAlbum(albumId);
		} catch (SQLException e) {
			response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Not possible to recover album");
			return;
		}		

		List<Image> pageImages = null;
		Image prevImage = null;
		Image nextImage = null;		
		Image activeImage = null;
		List<Comment> comments = null;		
		
		if(images.size() > 0) {
			/* If imageId is not null fetches the image from DB. 
			 * If imageId is not null but is not a valid image of the album or if imageId is null 
			 * sets the first of the album as "active" */
			if(imageId != null) {
				final Integer id = imageId;
				activeImage = images.stream().filter(image -> image.getId() == id).collect(Collectors.toList()).get(0);
			}
			if(activeImage == null)
				activeImage = images.get(0);
			
			/* Fetches all activeImage comments from DB */		
			CommentDAO cDAO = new CommentDAO(connection);
			try {
				comments = cDAO.findCommentsByImage(activeImage.getId());
			} catch (SQLException e) {
				response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Not possible to recover comments");
				return;
			}
	
			/* Selects the group of "pageSize" images the activeImage belongs to.
			 * Finds, if present, an image in each neighboring group that will act as activeImage
			 * if the user clicks on prev or next buttons */
			int imageIndex = images.indexOf(activeImage);
			int lowerBound = (int)Math.floorDiv(imageIndex, pageSize) * pageSize;
			int upperBound = Math.min(images.size(), lowerBound + pageSize);
			pageImages = images.subList(lowerBound, upperBound);	
			if(lowerBound > 0)
				prevImage = images.get(imageIndex - pageSize);
			if(upperBound < images.size())
				nextImage = images.get(Math.min(images.size() - 1, imageIndex + pageSize));
		}
		
		/* If the album is empty many of this objects will be null,
		 * this case is handled in the template */
		String path = "/WEB-INF/album.html";
		ServletContext servletContext = getServletContext();
		final WebContext ctx = new WebContext(request, response, servletContext, request.getLocale());
		ctx.setVariable("album", album);
		ctx.setVariable("images", pageImages);
		ctx.setVariable("prev", prevImage);	
		ctx.setVariable("next", nextImage);			
		ctx.setVariable("active", activeImage);	
		ctx.setVariable("comments", comments);	
		templateEngine.process(path, ctx, response.getWriter());
	}
}
