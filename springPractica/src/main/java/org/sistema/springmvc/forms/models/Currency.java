package org.sistema.springmvc.forms.models;

import java.io.Serializable;
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

import com.google.gson.annotations.Expose;

/**
 * Represents a user.
 * 
 * @author Mikel Ros
 *
 */
@Entity
public class Currency {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Expose
	private int id;

	@Expose
	@NotNull(message = "Please enter a name.")
	@Size(min = 1, max = 30, message = "Name must be between 1 and 30 characters long.")
	private String name;

	@Expose
	@NotNull(message = "Please enter an abbreviation.")
	@Size(min = 1, max = 3, message = "Abbreviation must be between and 1 and 3 characters long.")
	private String abbreviation;

	@Expose
	@NotNull(message = "Please enter a value.")
	@Min(value = 0, message = "must be >=0")
	private Integer value;

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER, mappedBy = "currency")
	private Set<Country> countries = new HashSet<Country>();

	/**
	 * default constructor
	 */
	public Currency() {
	}

	public Currency(int id, String name, String abbreviation, Integer value, Set<Country> currencies) {
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

	public Integer getValue() {
		return value;
	}

	public void setValue(Integer value) {
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
	 * @param country
	 */
	public void addCountry(Country country) {
		this.countries.add(country);
		country.setCurrency(this);
	}

	@Override
	public String toString() {
		return "Currency [id=" + id + ", name=" + name + ", abbreviation=" + abbreviation + ", value=" + value
				+ ", countries=" + countries + "]";
	}
	
	

}
