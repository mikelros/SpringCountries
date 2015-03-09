package org.sistema.springmvc.forms.dao;

import java.util.List;

import org.sistema.springmvc.forms.models.User;

/**
 * Interface for a UserDAO.
 * 
 * @author Eugenia Pérez Martínez.
 *
 */
public interface UserDAO {

	/**
	 * This is the method to be used to create a record in the Student table.
	 */
	public int create(User user);

	/**
	 * This is the method to be used to list down a record from the Student
	 * table corresponding to a passed student id.
	 */
	public User selectById(Integer id);

	/**
	 * This is the method to be used to list down all the records from the
	 * Student table.
	 */
	public List<User> selectAll();

	/**
	 * This is the method to be used to delete a record from the Student table
	 * corresponding to a passed student id.
	 */
	public void delete(Integer id);

	/**
	 * This is the method to be used to update a record into the Student table.
	 */
	public void update(Integer id, User user);
}
