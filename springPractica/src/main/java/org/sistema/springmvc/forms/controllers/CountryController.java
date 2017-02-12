package org.sistema.springmvc.forms.controllers;

import java.util.List;
import java.util.Map;
import javax.validation.Valid;
import org.sistema.springmvc.forms.dao.impl.CountryDAOHibernate;
import org.sistema.springmvc.forms.dao.impl.CurrencyDAOHibernate;
import org.sistema.springmvc.forms.models.Country;
import org.sistema.springmvc.forms.models.Currency;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 * Controller for countries.
 * 
 * @author Mikel Ros
 *
 */
@Controller
public class CountryController {
	private static final Logger logger = LoggerFactory.getLogger(CountryController.class);

	@Autowired
	private CountryDAOHibernate countryDAO;

	@Autowired
	private CurrencyDAOHibernate currencyDAO;

	/**
	 * handles default /countries
	 * 
	 * @param model
	 * @return the name of the view to show RequestMapping({"/countries"})
	 */

	@RequestMapping(method = RequestMethod.GET, value = { "/countries" })
	public String showCountries(Map<String, Object> model) {
		logger.info("Currency showCountries. ");

		List<Country> countries = countryDAO.selectAll(Country.class);
		model.put("countries", countries);

		return "country/countries";
	}

	/**
	 * handles /countries/id
	 * 
	 * @param model
	 * @return the name of the view to show RequestMapping({"/countries/{id}"})
	 */
	@RequestMapping(method = RequestMethod.GET, value = { "/countries/{id}" })
	public String currencyCountryDetail(@PathVariable(value = "id") Integer id, Map<String, Object> model) {
		logger.info("Currency country detail");

		Country country = countryDAO.selectById(id, Country.class);
		model.put("country", country);

		return "country/countryDetail";
	}

	/**
	 * handles /currencies/new by GET
	 * 
	 * @return the name of the view to show RequestMapping({"/countries/new"})
	 */
	@RequestMapping(method = RequestMethod.GET, value = { "/countries/new" })
	public String newCountry(Map<String, Object> model) {
		logger.info("Showing custom view GET ");

		Country c = new Country();
		c.setCurrency(new Currency());

		model.put("country", c);
		model.put("currencies", currencyDAO.selectAll(Currency.class));

		return "country/newCountry";
	}

	/**
	 * THIS IS THE ONE INSIDE DETAIL
	 * 
	 * handles /currencies/country/new by POST
	 * 
	 * @return the name of the view to show RequestMapping({"/currencies/new"})
	 */
	@RequestMapping(method = RequestMethod.POST, value = { "/countries/new" })
	public ModelAndView createCountry(@Valid Country country, BindingResult bindingResult) {

		ModelAndView modelAndView = new ModelAndView();

		if (bindingResult.hasErrors()) {
			modelAndView.setViewName("currency/currencyDetail");
			modelAndView.addObject("country", country);
			modelAndView.addObject("currency", currencyDAO.selectById(country.getCurrency().getId(), Currency.class));
			return modelAndView;
		}

		countryDAO.insert(country);
		// We return view name
		modelAndView.setViewName("country/created");
		modelAndView.addObject("country", country);
		return modelAndView;
	}

	/**
	 * handles /currencies/country/new by POST
	 * 
	 * @return the name of the view to show RequestMapping({"/currencies/new"})
	 */
	@RequestMapping(method = RequestMethod.POST, value = { "/countries/newOut" })
	public ModelAndView createCountryOut(@Valid Country country, BindingResult bindingResult) {

		ModelAndView modelAndView = new ModelAndView();

		if (bindingResult.hasErrors()) {
			modelAndView.setViewName("country/newCountry");
			modelAndView.addObject("country", country);
			modelAndView.addObject("currencies", currencyDAO.selectAll(Currency.class));
			return modelAndView;
		}
		
		country.setCurrency(currencyDAO.selectById(country.getCurrency().getId(), Currency.class));
		countryDAO.insert(country);

		// We return view name
		modelAndView.setViewName("country/created");
		modelAndView.addObject("country", country);
		logger.info("Saveview POST " + country.getId());
		return modelAndView;
	}

	/**
	 * Simply selects the update view for countries
	 */
	@RequestMapping(value = "/countries/update/{id}", method = RequestMethod.GET)
	public String updateCountry(@PathVariable(value = "id") Integer countryId, Model model) {
		logger.info("Showing update country view GET ");

		Country country = countryDAO.selectById(countryId, Country.class);

		model.addAttribute("country", country);
		model.addAttribute("currencies", currencyDAO.selectAll(Currency.class));

		return "country/update";
	}

	/**
	 * Handles the POST from the Custom.jsp page to update the Currency.
	 */
	@RequestMapping(method = RequestMethod.POST, value = "/countries/saveupdate")
	public ModelAndView saveUpdateCountry(@ModelAttribute("country") @Valid Country country,
			BindingResult bindingResult) {
		logger.info("Save update country " + country.getId());

		ModelAndView modelAndView = new ModelAndView();
		if (bindingResult.hasErrors()) {
			modelAndView.setViewName("country/update");
			modelAndView.addObject("country", country);
			modelAndView.addObject("currencies", currencyDAO.selectAll(Currency.class));
			return modelAndView;
		}

		countryDAO.update(country);

		// We pass the currency received through this object
		modelAndView.addObject("country", country);

		// The same as return "currency/saveUpdate"
		modelAndView.setViewName("country/saveUpdated");
		return modelAndView;
	}

	/**
	 * Delete the specific country
	 */
	@RequestMapping(value = "/countries/delete/{id}", method = RequestMethod.GET)
	public String deleteCountry(@PathVariable(value = "id") Integer countryId, Model model) {
		logger.info("Currency detail /delete country: " + countryId);

		// Store the concrete country to send it back before deleting to use it
		// in
		// the following view.
		Country country = countryDAO.selectById(countryId, Country.class);
		model.addAttribute("country", country);

		countryDAO.delete(country);

		return "country/deleted";
	}

	/**
	 * Delete all countries
	 */
	@RequestMapping(value = "/countries/deleteAll", method = RequestMethod.GET)
	public String deleteAllCountries(Map<String, Object> model) {

		countryDAO.deleteAll();
		List<Country> countries = countryDAO.selectAll(Country.class);
		model.put("countries", countries);
		return "country/countries";
	}

}
