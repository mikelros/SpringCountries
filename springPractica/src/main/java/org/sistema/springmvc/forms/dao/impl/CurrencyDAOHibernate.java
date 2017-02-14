package org.sistema.springmvc.forms.dao.impl;

import java.util.List;

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

	@Transactional(readOnly = true)
	public List<Currency> lastCurrencies(Integer id) {

		Query query = getSession().createQuery("from Currency c where c.id > :id order by c.id");

		query.setParameter("id", id);

		return query.list();
	}

}
