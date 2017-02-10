package org.sistema.springmvc.forms.models;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

/**
 * Represents a user.
 * 
 * @author Eugenia Pérez Martínez
 *
 */
@Entity
public class Currency {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@NotNull(message = "Please enter a name.")
	@Size(min = 1, max = 30, message = "Name must be between 1 and 30 characters long.")
	private String name;
	
	@NotNull(message = "Please enter an abbreviation.")
	@Size(min = 1, max = 3, message = "Abbreviation must be between and 1 and 3 characters long.")
	private String abbreviation;
	
	@NotNull(message = "Please enter a value.")
	@Size(min = 1, message = "Value must have a value.")
	@Pattern(regexp = "[0-9]+", message = "Must contain just numbers.")
	@Min(0)
	private String value;
	
	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER, mappedBy = "currency")
	private Set<Country> countries = new HashSet<Country>();

	/**
	 * default constructor
	 */
	public Currency() {
	}

	public Currency(int id, String name, String abbreviation, String value, Set<Country> currencies) {
		super();
		this.id = id;
		this.name = name;
		this.abbreviation = abbreviation;
		this.value = value;
		this.countries = currencies;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAbbreviation() {
		return abbreviation;
	}

	public void setAbbreviation(String abbreviation) {
		this.abbreviation = abbreviation;
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}

	public Set<Country> getCountries() {
		return countries;
	}

	public void setCountries(Set<Country> countries) {
		this.countries = countries;
	}

	/**
	 * 
	 * @param task
	 */
	public void addCountry(Country country) {
		this.countries.add(country);
		country.setCurrency(this);
	}

}
