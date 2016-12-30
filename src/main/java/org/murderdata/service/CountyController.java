package org.murderdata.service;

import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.StreamSupport;

import javax.annotation.Resource;

import org.murderdata.persistence.model.Agency;
import org.murderdata.persistence.model.County;
import org.murderdata.persistence.repositories.AgencyRepository;
import org.murderdata.persistence.repositories.CountyRepository;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/counties")
public class CountyController {
	@Resource
	private CountyRepository countyRepository;
	
	@Resource
	private AgencyRepository agencyRepository;
	
	@RequestMapping(method = RequestMethod.GET)
	public List<County> getAll(@RequestParam(name = "abbreviation", required = false) String abbreviation) {
		Iterable<County> modelsIterable = this.countyRepository.findAll();
		List<County> models = StreamSupport.stream(modelsIterable.spliterator(), false)
		                .collect(Collectors.toList());	
		return models;
	}

	@RequestMapping(value = "/{id}", method = RequestMethod.GET)
	public County getCounty(@PathVariable Long id) {
		return this.countyRepository.findOne(id);
	}

	@RequestMapping(value = "/{id}/agencies", method = RequestMethod.GET)
	public List<Agency> getAgencies(County county) {
		return this.agencyRepository.findByCountyOrderByName(county);
	}

}
