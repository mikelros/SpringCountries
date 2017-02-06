package org.sistema.springmvc.forms.mappers;

import org.sistema.springmvc.forms.dtos.CountryDTO;
import org.sistema.springmvc.forms.models.Country;
import org.sistema.springmvc.forms.models.Currency;

public class CountryMapper {

	public static Country toCountry(CountryDTO countryDTO, Currency currency) {
		Country country = new Country();
		country.setId(countryDTO.getId());
		country.setAbbreviated(countryDTO.getAbbreviated());
		country.setName(countryDTO.getName());
		country.setCurrency(currency);
		return country;
	}

	public static CountryDTO toDTO(Country country) {
		CountryDTO countryDTO = new CountryDTO(country.getId(), country.getName(),
				country.getAbbreviated(), country.getCurrency().getId(), country.getCurrency()
						.getName());
		return countryDTO;
	}

}
