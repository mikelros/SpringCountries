package org.sistema.springmvc.forms.models;

/**
 * Represents a Task.
 * 
 * @author Eugenia Pérez Martínez
 *
 */
public class Task {

	private int id;
	private String name;
	private String description;
	private User user;
	
	/**
	 * default constructor
	 */
	public Task () {
		
	}
	
	/**
	 * @param id
	 * @param name
	 * @param description
	 * @param user
	 */
	public Task(int id, String name, String description, User user) {
		this.id = id;
		this.name = name;
		this.description = description;
		this.user = user;
	}

	/**
	 * @return the id
	 */
	public int getId() {
		return id;
	}

	/**
	 * @param id the id to set
	 */
	public void setId(int id) {
		this.id = id;
	}

	/**
	 * @return the name
	 */
	public String getName() {
		return name;
	}

	/**
	 * @param name the name to set
	 */
	public void setName(String name) {
		this.name = name;
	}

	/**
	 * @return the description
	 */
	public String getDescription() {
		return description;
	}

	/**
	 * @param description the description to set
	 */
	public void setDescription(String description) {
		this.description = description;
	}

	/**
	 * @return the user
	 */
	public User getUser() {
		return user;
	}

	/**
	 * @param user the user to set
	 */
	public void setUser(User user) {
		this.user = user;
	}

	

}
