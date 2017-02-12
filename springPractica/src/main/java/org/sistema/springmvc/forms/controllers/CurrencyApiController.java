package org.sistema.springmvc.forms.controllers;

import java.util.List;

import org.sistema.springmvc.forms.dao.impl.CurrencyDAOHibernate;
import org.sistema.springmvc.forms.models.Currency;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

/**
 * API Controller for currencies.
 * 
 * @author Mikel Ros
 *
 */
@Controller
public class CurrencyApiController {
	@Autowired
	private CurrencyDAOHibernate currencyDAO;
	private Gson gson = new GsonBuilder().excludeFieldsWithoutExposeAnnotation().create();

	
	@RequestMapping(value = "/api/currencies", method = RequestMethod.GET, produces = "application/json")
	@ResponseBody
	public String getCurrencies() {
		List<Currency> currencies = currencyDAO.selectAll(Currency.class);
		return gson.toJson(currencies);
	}
	
	@RequestMapping(value = "/api/currencies/{id}", method = RequestMethod.GET, produces = "application/json")
	@ResponseBody
	public String getCurrency(@PathVariable(value = "id") Integer id) {
		Currency currency = currencyDAO.selectById(id, Currency.class);
		return gson.toJson(currency);
	}
	
	@RequestMapping(value = "/api/currencies/last/{id}", method = RequestMethod.GET, produces = "application/json")
	@ResponseBody
	public String getLastCurrencies(@PathVariable(value = "id") Integer id) {
		List<Currency> currencies = currencyDAO.lastCurrencies(id);
		return gson.toJson(currencies);
	}
	
	@RequestMapping(value = "/api/currencies/new", method = RequestMethod.POST, consumes = "application/json")
	@ResponseBody
	public void insertCurrency(@RequestBody String json) {
		System.out.println("TRYING TO INSERT IN JSON:" + json);
		System.out.println("TRYING TO INSERT IN DATA:" + gson.fromJson(json, Currency.class).toString());
		currencyDAO.insert(gson.fromJson(json, Currency.class));
	}
	
	@RequestMapping(value = "/api/currencies/update", method = RequestMethod.PUT, consumes = "application/json")
	@ResponseBody
	public void updateCurrency(@RequestBody String json) {
		currencyDAO.update(gson.fromJson(json, Currency.class));
		
	}
	
	@RequestMapping(value = "/api/currencies/delete/{id}", method = RequestMethod.DELETE, produces = "application/json")
	@ResponseBody
	public void deleteCurrency(@PathVariable(value = "id") Integer id) {
		currencyDAO.delete(currencyDAO.selectById(id, Currency.class));
	}


}
