package org.murderdata.service;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.murderdata.persistence.model.ClearanceRate;
import org.murderdata.persistence.repositories.ClearanceRateRepository;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/clearancerates")
public class ClearanceRateController {
	@Resource
	private ClearanceRateRepository repository;
	
	@RequestMapping(method = RequestMethod.GET)
	public List<ClearanceRate> getAll() {
		List<ClearanceRate> models = new ArrayList<>();

		this.repository.findSummary().stream()
				.forEach(result -> {
					ClearanceRate clearanceRate = getClearanceRate(result);
					
					models.add(clearanceRate);
				});
		
		return models;
	}
	
	@RequestMapping(value = "/{stateAbbreviation}", method = RequestMethod.GET)
	public List<ClearanceRate> getByState(@PathVariable String stateAbbreviation) {
		List<ClearanceRate> models = new ArrayList<>();

		this.repository.findSummaryByStateAbbreviation(stateAbbreviation).stream()
				.forEach(result -> {
					ClearanceRate clearanceRate = getClearanceRate(result);
					
					models.add(clearanceRate);
				});
		
		return models;
	}

	@RequestMapping(value = "/{stateAbbreviation}/{countyName}", method = RequestMethod.GET)
	public List<ClearanceRate> getByStateAndCounty(@PathVariable String stateAbbreviation, @PathVariable String countyName) {
		List<ClearanceRate> models = new ArrayList<>();

		this.repository.findSummaryByStateAbbreviationAndCountyName(stateAbbreviation, countyName).stream()
				.forEach(result -> {
					ClearanceRate clearanceRate = getClearanceRate(result);
					
					models.add(clearanceRate);
				});
		
		return models;
	}

	@RequestMapping(value = "/{stateAbbreviation}/{countyName}/{agencyName}", method = RequestMethod.GET)
	public List<ClearanceRate> getByStateAndCountyAndAgency(
			@PathVariable String stateAbbreviation,
			@PathVariable String countyName,
			@PathVariable String agencyName) {
		List<ClearanceRate> models = new ArrayList<>();

		this.repository.findSummaryByStateAbbreviationAndCountyNameAndAgencyName(stateAbbreviation, countyName, agencyName).stream()
				.forEach(result -> {
					ClearanceRate clearanceRate = getClearanceRate(result);
					
					models.add(clearanceRate);
				});
		
		return models;
	}
	
	private ClearanceRate getClearanceRate(Object[] result) {
		ClearanceRate clearanceRate = new ClearanceRate();
		clearanceRate.setYear((Integer) result[0]);
		clearanceRate.setMurders(((BigDecimal) result[1]).intValue());
		clearanceRate.setClearances(((BigDecimal) result[2]).intValue());

		return clearanceRate;
	}
}
