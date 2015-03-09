package org.sistema.springmvc.forms.models;

import java.util.HashSet;
import java.util.Set;

/**
 * Represents a user.
 * 
 * @author Eugenia Pérez Martínez
 *
 */
public class User {

	private int id;
	private String login;
	private String description;
	private String password;
	private Set<Task> tasks = new HashSet<Task>();

	/**
	 * default constructor
	 */
	public User() {
	}

	/**
	 * constructor with parameters
	 * @param id
	 * @param login
	 * @param description
	 * @param password
	 */
	public User(int id, String login, String description, String password) {
		this.id = id;
		this.login = login;
		this.description = description;
		this.password = password;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getLogin() {
		return login;
	}

	public void setLogin(String login) {
		this.login = login;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	/**
	 * @return the tasks
	 */
	public Set<Task> getTasks() {
		return tasks;
	}

	/**
	 * @param tasks the tasks to set
	 */
	public void setTasks(Set<Task> tasks) {
		this.tasks = tasks;
	}
	
	/**
	 * 
	 * @param task
	 */
	public void addTask(Task task){
		this.tasks.add(task);
		task.setUser(this);
	}

}
