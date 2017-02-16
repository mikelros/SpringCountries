package org.sistema.springmvc.forms.controllers;

import java.util.List;

import javax.validation.Valid;

import org.sistema.springmvc.forms.dao.impl.CurrencyDAOHibernate;
import org.sistema.springmvc.forms.models.Currency;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

/**
 * API Controller for currencies.
 * 
 * @author Mikel Ros
 *
 */
@RestController
@RequestMapping("/api")
public class CurrencyApiController {

	@Autowired
	private CurrencyDAOHibernate currencyDAO;

	@RequestMapping(value = "/currencies", method = RequestMethod.GET)
	public List<Currency> getCurrencies() {
		return currencyDAO.selectAll(Currency.class);
	}

	@RequestMapping(value = "/currencies/{id}", method = RequestMethod.GET)
	public Currency getCurrency(@PathVariable(value = "id") Integer id) {
		return currencyDAO.selectById(id, Currency.class);
	}

	@RequestMapping(value = "/currencies/last/{id}", method = RequestMethod.GET)
	public List<Currency> getLastCurrencies(@PathVariable(value = "id") Integer id) {
		return currencyDAO.lastCurrencies(id);
	}

	@RequestMapping(value = "/currencies/new", method = RequestMethod.POST)
	public int insertCurrency(@RequestBody @Valid Currency currency) {
		return currencyDAO.insert(currency);
	}

	@RequestMapping(value = "/currencies/update/{id}", method = RequestMethod.PUT)
	public void updateCurrency(@PathVariable Integer id, @RequestBody @Valid Currency currency) {
		currency.setId(id);
		currencyDAO.update(currency);

	}

	@RequestMapping(value = "/currencies/delete/{id}", method = RequestMethod.DELETE)
	public void deleteCurrency(@PathVariable(value = "id") Integer id) {
		currencyDAO.delete(currencyDAO.selectById(id, Currency.class));
	}

	public CurrencyDAOHibernate getCurrencyDAO() {
		return currencyDAO;
	}

	public void setCurrencyDAO(CurrencyDAOHibernate currencyDAO) {
		this.currencyDAO = currencyDAO;
	}

}
