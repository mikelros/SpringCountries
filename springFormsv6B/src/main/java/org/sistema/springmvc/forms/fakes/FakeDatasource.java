package org.sistema.springmvc.forms.fakes;

import java.util.ArrayList;
import java.util.List;

import org.sistema.springmvc.forms.dao.UserDAO;
import org.sistema.springmvc.forms.models.Task;
import org.sistema.springmvc.forms.models.User;

/**
 * Fake DataSource, provides database for fake DAOS
 * 
 * @author Eugenia Pérez Martínez.
 *
 */
public class FakeDatasource  {
	
	private List<User> mockDB;
	
	/**
	 * default constructor
	 */
	public FakeDatasource(){
		init();
	}
	
	/**
	 * inits fake/mock database
	 */
	private void init () {
		mockDB = new ArrayList<User>();
		User user1 = new User(1, "sjobs", "Apple CEO", "stewie");
		User user2 = new User(2, "lellison", "Oracle CEO", "larry");
		User user3 = new User(3, "bgates", "Microsoft CEO", "imrich");
		User user4 = new User(4, "mzuckerberg", "Facebook CEO", "selfie");

		// Create new tasks
		Task task1 = new Task(1,"Read","Read a book",user1);
		Task task2 = new Task(2,"Plant","Plant a tree",user1);

		Task task3 = new Task(3,"Learn","Learn NoSQL",user2);
		Task task4 = new Task(4,"Spend less","Spend less money",user2);

		Task task5 = new Task(5,"Program","Learn Java",user3);
		
		Task task6 = new Task(6,"Buy","Buy another company",user4);

		// assign tasks to users
		user1.getTasks().add(task1);
		user1.getTasks().add(task2);

		user2.getTasks().add(task3);
		user2.getTasks().add(task4);

		user3.getTasks().add(task5);
		user4.getTasks().add(task6);

		mockDB.add(user1);
		mockDB.add(user2);
		mockDB.add(user3);
		mockDB.add(user4);
	}

	/**
	 * @return the mockDB
	 */
	public List<User> getMockDB() {
		return mockDB;
	}

	/**
	 * @param mockDB the mockDB to set
	 */
	public void setMockDB(List<User> mockDB) {
		this.mockDB = mockDB;
	}

	

}
