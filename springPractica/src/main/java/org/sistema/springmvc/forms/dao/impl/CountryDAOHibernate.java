package org.sistema.springmvc.forms.dao.impl;

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
}
