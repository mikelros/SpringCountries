package org.sistema.springmvc.forms.controllers;

import java.util.List;
import java.util.Map;

import org.sistema.springmvc.forms.dao.CurrencyDAO;
import org.sistema.springmvc.forms.dao.impl.CurrencyDAOHibernate;
import org.sistema.springmvc.forms.dao.impl.GenericDAOHibernate;
import org.sistema.springmvc.forms.models.Country;
import org.sistema.springmvc.forms.models.Currency;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 * Controller for currencies.
 * 
 * @author Eugenia Pérez Martínez
 *
 */
@Controller
public class CurrencyController {
	private static final Logger logger = LoggerFactory.getLogger(CurrencyController.class);

	// si los defino como CountryDAOHibernate... Error:
	// org.springframework.beans.factory.BeanCreationException: Error creating
	// bean with name 'countryController': Injection of autowired dependencies
	// failed; nested exception is
	// org.springframework.beans.factory.BeanCreationException: Could not
	// autowire field: private
	// org.sistema.springmvc.forms.dao.impl.CountryDAOHibernate
	// org.sistema.springmvc.forms.controllers.CountryController.countryDAO;
	// nested exception is
	// org.springframework.beans.factory.NoSuchBeanDefinitionException: No
	// qualifying bean of type
	// [org.sistema.springmvc.forms.dao.impl.CountryDAOHibernate] found for
	// dependency: expected at least 1 bean which qualifies as autowire
	// candidate for this dependency. Dependency annotations:
	// {@org.springframework.beans.factory.annotation.Autowired(required=true)}

	@Autowired
	private GenericDAOHibernate<Currency> currencyDAO;

	/**
	 * handles default /currencies
	 * 
	 * @param model
	 * @return the name of the view to show RequestMapping({"/currencies"})
	 */

	@RequestMapping(method = RequestMethod.GET, value = { "/", "/currencies" })
	public String showCurrencies(Map<String, Object> model) {
		logger.info("Currency showCurrencies. ");

		List<Currency> currencies = currencyDAO.selectAll(Currency.class);
		model.put("currencies", currencies);

		return "currency/currencies";
	}

	/**
	 * handles default /currencies/id
	 * 
	 * @param model
	 * @return the name of the view to show RequestMapping({"/currencies/{id}"})
	 */
	@RequestMapping(method = RequestMethod.GET, value = { "/currencies/{id}" })
	public String currencyDetail(@PathVariable(value = "id") Integer id, Map<String, Object> model) {
		logger.info("Currency detail");

		Currency currency = currencyDAO.selectById(id, Currency.class);
		// The currency gets his own collection of countries load
		model.put("currency", currency);
		
		// We add country for the new country form
		Country country = new Country();
		country.setCurrency(currency);
		model.put("country", country);

		return "currency/currencyDetail";
	}

	/**
	 * handles /currencies/new by GET
	 * 
	 * @return the name of the view to show RequestMapping({"/currencies/new"})
	 */
	@RequestMapping(method = RequestMethod.GET, value = { "/currencies/new" })
	public String newCurrency(Map<String, Object> model) {
		logger.info("Showing custom view GET ");

		model.put("currency", new Currency());

		return "currency/newCurrency";
	}

	/**
	 * handles /currencies/new by POST
	 * 
	 * @return the name of the view to show RequestMapping({"/currencies/new"})
	 */
	@RequestMapping(method = RequestMethod.POST, value = { "/currencies/new" })
	public ModelAndView createCurrency(Currency currency) {
		logger.info("Saveview POST " + currency.getId());

		ModelAndView modelAndView = new ModelAndView();

		currencyDAO.insert(currency);
		// We return view name
		modelAndView.setViewName("currency/created");
		modelAndView.addObject("currency", currency);
		return modelAndView;

	}

	/**
	 * Simply selects the update view
	 */
	@RequestMapping(value = "/currencies/update/{id}", method = RequestMethod.GET)
	public String update(@PathVariable(value = "id") Integer currencyId, Model model) {
		logger.info("Showing update view GET ");

		// We find the currency through DAO and load into model
		model.addAttribute("currency", currencyDAO.selectById(currencyId, Currency.class));

		return "currency/update";
	}

	/**
	 * Handles the POST from the Custom.jsp page to update the Currency.
	 */
	@RequestMapping(value = "/currencies/saveupdate", method = RequestMethod.POST)
	public ModelAndView saveUpdate(Currency currency) {
		logger.info("Save update " + currency.getId());

		currencyDAO.update(currency);

		ModelAndView modelAndView = new ModelAndView();

		// We pass the currency received through this object
		modelAndView.addObject("currency", currency);

		// The same as return "currency/saveUpdate"
		modelAndView.setViewName("currency/saveUpdated");
		return modelAndView;
	}

	/**
	 * Delete the specific currency
	 */
	@RequestMapping(value = "/currencies/delete/{id}", method = RequestMethod.GET)
	public String delete(@PathVariable(value = "id") Integer currencyId, Model model) {
		logger.info("Currency detail /delete");

		Currency currency = currencyDAO.selectById(currencyId, Currency.class);
		model.addAttribute("currency", currency);

		currencyDAO.delete(currency);

		return "currency/deleted";

	}

}
