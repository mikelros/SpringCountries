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
	private String name;
	private String abbreviation;
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

	public Set<Country> getCurrencies() {
		return countries;
	}

	public void setCurrencies(Set<Country> currencies) {
		this.countries = currencies;
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
