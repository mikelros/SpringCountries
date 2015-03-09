package org.sistema.springmvc.forms.dtos;


/**
 * Represents a Task.
 * 
 * @author Eugenia Pérez Martínez
 *
 */
public class TaskDTO {

	private int id;
	private String name;
	private String description;
	//Adding new fields
	private int userId;
	private String userLogin;
	
	/**
	 * default constructor
	 */
	public TaskDTO () {
		
	}
	
	/**
	 * @param id
	 * @param name
	 * @param description
	 * @param user
	 */
	public TaskDTO(int id, String name, String description, int userId, String userLogin) {
		this.id = id;
		this.name = name;
		this.description = description;
		this.userId = userId;
		this.userLogin = userLogin;
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

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getUserLogin() {
		return userLogin;
	}

	public void setUserLogin(String userLogin) {
		this.userLogin = userLogin;
	}


	
	

}
