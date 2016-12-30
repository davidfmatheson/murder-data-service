package org.murderdata.service;

import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.StreamSupport;

import javax.annotation.Resource;

import org.murderdata.persistence.model.County;
import org.murderdata.persistence.model.State;
import org.murderdata.persistence.repositories.CountyRepository;
import org.murderdata.persistence.repositories.StateRepository;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/states")
public class StateController {
	@Resource
	private StateRepository stateRepository;
	
	@Resource
	private CountyRepository countyRepository;
	
	@RequestMapping(method = RequestMethod.GET)
	public List<State> getAll() {
		Iterable<State> statesIterable = this.stateRepository.findAll();
		
		return StreamSupport.stream(statesIterable.spliterator(), false)
                .collect(Collectors.toList());
	}

	@RequestMapping(value = "/{id}", method = RequestMethod.GET)
	public State getOne(@PathVariable Long id) {
		return this.stateRepository.findOne(id);
	}

	@RequestMapping(value = "/{id}/counties", method = RequestMethod.GET)
	public List<County> getCounties(State state) {
		return this.countyRepository.findByStateOrderByName(state);
	}
	
}
