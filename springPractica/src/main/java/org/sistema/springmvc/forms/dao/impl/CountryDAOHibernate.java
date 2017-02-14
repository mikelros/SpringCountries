package org.sistema.springmvc.forms.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.sistema.springmvc.forms.models.Country;
import org.springframework.transaction.annotation.Transactional;

/**
 * 
 * @author Mikel Ros
 *
 */

public class CountryDAOHibernate extends GenericDAOHibernate<Country> {
	@Transactional
	public void deleteAll() {

		Query query = getSession().createQuery("DELETE from Country c");

		query.executeUpdate();
	}

	@Transactional(readOnly = true)
	public List<Country> searchCountries(String name) {
		Query query = getSession().createQuery("FROM Country c WHERE c.name LIKE :name");
		query.setParameter("name", "%" + name + "%");
		return query.list();
	}
}
