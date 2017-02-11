package org.sistema.springmvc.forms.dao.impl;

import org.hibernate.Query;
import org.sistema.springmvc.forms.models.Currency;
import org.springframework.transaction.annotation.Transactional;

/**
 * 
 * @author Mikel Ros
 *
 */

public class CurrencyDAOHibernate extends GenericDAOHibernate<Currency> {
	@Transactional
	public void deleteAll() {

		Query query = getSession().createQuery("DELETE from Country c");

		query.executeUpdate();

		query = getSession().createQuery("DELETE from Currency c");

		query.executeUpdate();
	}
}
