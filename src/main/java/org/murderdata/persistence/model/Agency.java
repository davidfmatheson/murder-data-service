package org.murderdata.persistence.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "agency")
public class Agency {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private long id;

	@Column(name = "name")
	private String name;

	@Column(name = "originating_agency_id")
	private String originatingAgencyId;
	
	@ManyToOne
	private County county;
	
	public Agency() {
		
	}
	
	public Agency(long id) {
		this();
		this.id = id;
	}
	
	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public County getCounty() {
		return county;
	}

	public void setCounty(County county) {
		this.county = county;
	}

	public String getOriginatingAgencyId() {
		return originatingAgencyId;
	}

	public void setOriginatingAgencyId(String originatingAgencyId) {
		this.originatingAgencyId = originatingAgencyId;
	}

}
