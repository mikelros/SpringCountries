package org.sistema.springmvc.forms.models;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

/**
 * Represents a Task.
 * 
 * @author Eugenia Pérez Martínez
 *
 */
@Entity
public class Country {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String name;
	private String abbreviated;
	@ManyToOne
	@JoinColumn(name = "idcurrency")
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
