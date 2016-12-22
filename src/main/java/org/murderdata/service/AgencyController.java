package org.murderdata.service;

import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.StreamSupport;

import javax.annotation.Resource;

import org.murderdata.persistence.model.Agency;
import org.murderdata.persistence.model.ClearanceRate;
import org.murderdata.persistence.repositories.AgencyRepository;
import org.murderdata.persistence.repositories.ClearanceRateRepository;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/agencies")
public class AgencyController {
	@Resource
	private AgencyRepository agencyRepository;
	
	@Resource
	private ClearanceRateRepository clearanceRateRepository;
	
	@RequestMapping(method = RequestMethod.GET)
	public List<Agency> getAll() {
		Iterable<Agency> modelsIterable = this.agencyRepository.findAll();
		List<Agency> models = StreamSupport.stream(modelsIterable.spliterator(), false)
		                .collect(Collectors.toList());	
		return models;
	}
	
	@RequestMapping(value = "/{id}", method = RequestMethod.GET)
	public Agency getAgency(@PathVariable Long id) {
		return this.agencyRepository.findOne(id);
	}

	@RequestMapping(value = "/{id}/clearancerates", method = RequestMethod.GET)
	public List<ClearanceRate> getClearanceRates(Agency agency) {
		return this.clearanceRateRepository.findByAgency(agency);
	}

}
