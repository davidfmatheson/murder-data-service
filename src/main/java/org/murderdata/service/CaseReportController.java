package org.murderdata.service;

import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.StreamSupport;

import javax.annotation.Resource;

import org.murderdata.persistence.model.CaseReport;
import org.murderdata.persistence.repositories.CaseReportRepository;
import org.murderdata.persistence.specifications.CaseReportSpecifications;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/casereports")
public class CaseReportController {
	@Resource
	private CaseReportRepository caseReportRepository;
	
	@RequestMapping(method = RequestMethod.GET)
	public List<CaseReport> getAll() {
		Iterable<CaseReport> modelsIterable = this.caseReportRepository.findAll(CaseReportSpecifications.yearIs(1978));
		List<CaseReport> models = StreamSupport.stream(modelsIterable.spliterator(), false)
		                .collect(Collectors.toList());	
		return models;
	}
	
	@RequestMapping(value = "/{id}", method = RequestMethod.GET)
	public CaseReport getById(@PathVariable Long id) {
		return this.caseReportRepository.findOne(id);
	}

}
