package org.sistema.springmvc.forms.dao.impl;

import org.hibernate.Query;
import org.sistema.springmvc.forms.dao.CurrencyDAO;
import org.sistema.springmvc.forms.models.Currency;
import org.springframework.transaction.annotation.Transactional;

/**
 * Generic DAO to share logic between all the specific DAOs.
 * 
 * @author Eugenia P�rez Mart�nez
 *
 */

public class CurrencyDAOHibernate extends GenericDAOHibernate<Currency> {
	@Transactional
	public void deleteAll() {

		Query query = getSession()
				.createQuery("DELETE from Country c");

		query.executeUpdate();
		
		query = getSession()
						.createQuery("DELETE from Currency c");
		
		query.executeUpdate();
	}
}
