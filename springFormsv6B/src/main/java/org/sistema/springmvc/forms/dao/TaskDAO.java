package org.sistema.springmvc.forms.dao;

import java.util.List;

import org.sistema.springmvc.forms.models.Task;

/**
 * Interface for a TaskDAO.
 * 
 * @author Eugenia Pérez Martínez.
 *
 */
public interface TaskDAO {

	/**
	 * This is the method to be used to create a record in the Student table.
	 */
	public int create(Task task);

	/**
	 * This is the method to be used to list down a record from the Student
	 * table corresponding to a passed student id.
	 */
	public Task selectById(Integer id);

	/**
	 * This is the method to be used to list down all the records from the
	 * Student table.
	 */
	public List<Task> selectAll();

	/**
	 * This is the method to be used to delete a record from the Student table
	 * corresponding to a passed student id.
	 */
	public void delete(Integer id);

	/**
	 * This is the method to be used to update a record into the Student table.
	 */
	public void update(Integer id, Task task);
}
