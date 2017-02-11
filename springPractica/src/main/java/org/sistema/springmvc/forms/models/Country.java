package org.sistema.springmvc.forms.models;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

/**
 * Represents a Task.
 * 
 * @author Mikel Ros
 *
 */
@Entity
public class Country {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@NotNull(message = "Please enter a name.")
	@Size(min = 1, max = 50, message = "Name must be between 1 and 30 characters long.")
	private String name;

	@NotNull(message = "Please enter an abbreviated name.")
	@Size(min = 2, max = 2, message = "Abbreviated name must be 2 characters long.")
	private String abbreviated;

	@ManyToOne
	@JoinColumn(name = "currency_id")
	private Currency currency;

	/**
	 * default constructor
	 */
	public Country() {

	}

	public Country(int id, String name, String abbreviated, Currency currency) {
		super();
		this.id = id;
		this.name = name;
		this.abbreviated = abbreviated;
		this.currency = currency;
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

	public String getAbbreviated() {
		return abbreviated;
	}

	public void setAbbreviated(String abbreviated) {
		this.abbreviated = abbreviated;
	}

	public Currency getCurrency() {
		return currency;
	}

	public void setCurrency(Currency currency) {
		this.currency = currency;
	}

}
