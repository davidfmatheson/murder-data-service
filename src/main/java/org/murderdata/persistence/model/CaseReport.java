package org.murderdata.persistence.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "case_report")
public class CaseReport {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private long id;
	
	@ManyToOne
	private Agency agency;

	@Column(name = "solved")
	private Boolean solved;
	
	@Column(name = "year")
	private Integer year;

	@ManyToOne
	@JoinColumn(name = "victim_sex_id")
	private Sex victimSex;
	
	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public Agency getAgency() {
		return agency;
	}

	public void setAgency(Agency agency) {
		this.agency = agency;
	}

	public Boolean getSolved() {
		return solved;
	}

	public void setSolved(Boolean solved) {
		this.solved = solved;
	}

	public Integer getYear() {
		return year;
	}

	public void setYear(Integer year) {
		this.year = year;
	}

	public Sex getVictimSex() {
		return victimSex;
	}

	public void setVictimSex(Sex victimSex) {
		this.victimSex = victimSex;
	}

}
