package org.sistema.springmvc.forms.dtos;

/**
 * Represents a Task.
 * 
 * @author Eugenia Pérez Martínez
 *
 */
public class CountryDTO {

	private int id;
	private String name;
	private String abbreviated;
	// Adding new fields
	private int currencyId;
	private String currencyName;

	/**
	 * default constructor
	 */
	public CountryDTO() {

	}

	public CountryDTO(int id, String name, String abbreviated, int currencyId, String currencyName) {
		super();
		this.id = id;
		this.name = name;
		this.abbreviated = abbreviated;
		this.currencyId = currencyId;
		this.currencyName = currencyName;
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

	public int getCurrencyId() {
		return currencyId;
	}

	public void setCurrencyId(int currencyId) {
		this.currencyId = currencyId;
	}

	public String getCurrencyName() {
		return currencyName;
	}

	public void setCurrencyName(String currencyName) {
		this.currencyName = currencyName;
	}


}
