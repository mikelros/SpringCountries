package org.sistema.springmvc.forms.fakes;

import java.util.ArrayList;
import java.util.List;

import org.sistema.springmvc.forms.dao.TaskDAO;
import org.sistema.springmvc.forms.models.Task;
import org.sistema.springmvc.forms.models.User;

/**
 * Fake implementation for a TaskDAO.
 * 
 * @author Eugenia Pérez Martínez.
 *
 */
public class FakeTaskDAO implements TaskDAO {

	private FakeDatasource mockDB;

	/**
	 * default constructor
	 */
	public FakeTaskDAO() {
	}

	/**
	 * Returns a number greater or equal than 0 if everything goes well.
	 */
	public int create(Task task) {
		task.setId(selectAll().size() + 1);

		List<User> users = mockDB.getMockDB();

		for (User u : users) {
			if (u.getId() == task.getUser().getId()) {
				u.getTasks().add(task);
				break;
			}
		}
		return task.getId();
	}

	/**
	 * Implements one task find.
	 */
	public Task selectById(Integer id) {
		List<Task> tasks = selectAll();
		Task result = null;

		for (Task t : tasks) {
			if (t.getId() == id)
				result = t;
		}

		return result;
	}

	/**
	 * Get returns the complete db
	 */
	public List<Task> selectAll() {
		List<Task> tasks = new ArrayList<Task>();
		List<User> users = mockDB.getMockDB();

		for (User u : users) {
			tasks.addAll(u.getTasks());
		}

		return tasks;
	}

	/**
	 * Implements delete operation
	 */
	public void delete(Integer id) {
		List<User> users = mockDB.getMockDB();

		for (User u : users) {
			for (Task t : u.getTasks()) {
				if (t.getId() == id) {
					u.getTasks().remove(t);
					return;
				}
			}
		}
	}

	/**
	 * Implements update operation
	 */
	public void update(Integer id, Task task) {
		List<User> users = mockDB.getMockDB();

		for (User u : users) {
			for (Task t : u.getTasks()) {
				if (t.getId() == id) {
					// Desvinculo la tarea del anterior usuario
					u.getTasks().remove(t);
				}
			}
			
			if(u.getId() == task.getUser().getId()){
				//Añado la tarea al nuevo usuario
				u.addTask(task);
			}
		}	
		
	}

	/**
	 * @return the mockDB
	 */
	public FakeDatasource getMockDB() {
		return mockDB;
	}

	/**
	 * @param mockDB
	 *            the mockDB to set
	 */
	public void setMockDB(FakeDatasource mockDB) {
		this.mockDB = mockDB;
	}

}
