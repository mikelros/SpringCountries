package org.sistema.springmvc.forms.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.sistema.springmvc.forms.dao.CountryDAO;
import org.sistema.springmvc.forms.models.Country;
import org.springframework.transaction.annotation.Transactional;

/**
 * Generic DAO to share logic between all the specific DAOs.
 * 
 * @author Eugenia P�rez Mart�nez
 *
 */

public class CountryDAOHibernate extends GenericDAOHibernate<Country> {
	@Transactional
	public void deleteAll() {

		Query query = getSession()
						.createQuery("DELETE from Country c");
		
		query.executeUpdate();
	}
}
