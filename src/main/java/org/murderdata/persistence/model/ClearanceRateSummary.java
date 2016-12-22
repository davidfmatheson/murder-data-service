package org.murderdata.persistence.model;

public class ClearanceRateSummary {
	private Integer year;

	private Integer murders;

	private Integer clearances;

	public Integer getYear() {
		return year;
	}

	public void setYear(Integer year) {
		this.year = year;
	}

	public Integer getMurders() {
		return murders;
	}

	public void setMurders(Integer murders) {
		this.murders = murders;
	}

	public Integer getClearances() {
		return clearances;
	}

	public void setClearances(Integer clearances) {
		this.clearances = clearances;
	}
}
