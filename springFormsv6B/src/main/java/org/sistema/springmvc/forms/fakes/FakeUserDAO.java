package org.sistema.springmvc.forms.fakes;

import java.util.ArrayList;
import java.util.List;

import org.sistema.springmvc.forms.dao.UserDAO;
import org.sistema.springmvc.forms.models.Task;
import org.sistema.springmvc.forms.models.User;

/**
 * Fake implementation for a UserDAO.
 * 
 * @author Eugenia Pérez Martínez.
 *
 */
public class FakeUserDAO implements UserDAO {
	
	private FakeDatasource mockDB;
	
	/**
	 * default constructor
	 */
	public FakeUserDAO(){
	}
	
	/**

	/**
	 * Returns a number greater or equal than 0 if everything goes well.
	 */
	public int create(User user) {
		user.setId(mockDB.getMockDB().size() + 1);
		mockDB.getMockDB().add(user);
		return user.getId();
	}

	
	/**
	 * Implements one user find.
	 */
	public User selectById(Integer id) {
		List<User> users = selectAll();
		User result = null;

		for (User u : users) {
			if (u.getId() == id) {
				result = u;
			}
		}

		return result;
	}

	/**
	 * Get returns the complete db
	 */
	public List<User> selectAll() {
		return mockDB.getMockDB();
	}
	

	/**
	 * Implements delete operation
	 */
	public void delete(Integer id) {
		List<User> users = selectAll();
		User result = null;

		for (User u : users) {
			if (u.getId() == id) {
				users.remove(u);
				break;
			}
		}
	}
	

	/**
	 * Implements update operation
	 */
	public void update(Integer id, User user) {
		List<User> users = selectAll();

		for (int i = 0; i < users.size(); i++) {

			if (users.get(i).getId() == id) {
				users.set(i, user);
				break;
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
	 * @param mockDB the mockDB to set
	 */
	public void setMockDB(FakeDatasource mockDB) {
		this.mockDB = mockDB;
	}


}
