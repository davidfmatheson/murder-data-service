package org.murderdata.persistence.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "clearance_rate")
public class ClearanceRate {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private long id;

	@Column(name = "year")
	private Integer year;

	@Column(name = "murders")
	private Integer murders;

	@Column(name = "clearances")
	private Integer clearances;

	@ManyToOne
	private Agency agency;

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

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

	public Agency getAgency() {
		return agency;
	}

	public void setAgency(Agency agency) {
		this.agency = agency;
	}

}
