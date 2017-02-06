package org.sistema.springmvc.forms.controllers;

import java.util.List;
import java.util.Map;

import org.sistema.springmvc.forms.dao.CountryDAO;
import org.sistema.springmvc.forms.dao.CurrencyDAO;
import org.sistema.springmvc.forms.dao.impl.CountryDAOHibernate;
import org.sistema.springmvc.forms.dao.impl.CurrencyDAOHibernate;
import org.sistema.springmvc.forms.dao.impl.GenericDAOHibernate;
import org.sistema.springmvc.forms.dtos.CountryDTO;
import org.sistema.springmvc.forms.mappers.CountryMapper;
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
 * Controller for countries.
 * 
 * @author Eugenia Pérez Martínez
 *
 */
@Controller
public class CountryController {
	private static final Logger logger = LoggerFactory.getLogger(CountryController.class);

	@Autowired
	private GenericDAOHibernate<Country> countryDAO;

	@Autowired
	private CurrencyDAOHibernate currencyDAO;

	/**
	 * handles default /countries
	 * 
	 * @param model
	 * @return the name of the view to show RequestMapping({"/countries"})
	 */

	@RequestMapping(method = RequestMethod.GET, value = {"/countries" })
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
		CountryDTO countryDTO = CountryMapper.toDTO(c);
		
		model.put("countryDTO", countryDTO);
		model.put("currencies", currencyDAO.selectAll(Currency.class));
		
		return "country/newCountry";
	}

	/**
	 * handles /currencies/country/new by POST
	 * 
	 * @return the name of the view to show RequestMapping({"/currencies/new"})
	 */
	@RequestMapping(method = RequestMethod.POST, value = { "/countries/new" })
	public ModelAndView createCountry(Country country) {

		ModelAndView modelAndView = new ModelAndView();

		countryDAO.insert(country);
		// We return view name
		modelAndView.setViewName("country/created");
		modelAndView.addObject("country", country);
		logger.info("Saveview POST " + country.getId());
		return modelAndView;
	}

	/**
	 * handles /currencies/country/new by POST
	 * 
	 * @return the name of the view to show RequestMapping({"/currencies/new"})
	 */
	@RequestMapping(method = RequestMethod.POST, value = { "/countries/newOut" })
	public ModelAndView createCountryOut(CountryDTO countryDTO) {

		ModelAndView modelAndView = new ModelAndView();
		Country country = CountryMapper.toCountry(countryDTO,
				currencyDAO.selectById(countryDTO.getCurrencyId(), Currency.class));
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

		CountryDTO countryDTO = CountryMapper.toDTO(country);

		model.addAttribute("country", countryDTO);
		model.addAttribute("currencies", currencyDAO.selectAll(Currency.class));

		return "country/update";
	}

	/**
	 * Handles the POST from the Custom.jsp page to update the Currency.
	 */
	@RequestMapping(value = "/countries/saveupdate", method = RequestMethod.POST)
	public ModelAndView saveUpdateCountry(CountryDTO countryDTO) {
		logger.info("Save update country " + countryDTO.getId());

		
		Country country = CountryMapper.toCountry(countryDTO,
				currencyDAO.selectById(countryDTO.getCurrencyId(), Currency.class));

		countryDAO.update(country);

		ModelAndView modelAndView = new ModelAndView();

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

}
