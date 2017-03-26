package org.murderdata.service;

import static org.springframework.data.jpa.domain.Specifications.where;

import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.StreamSupport;

import javax.annotation.Resource;

import org.murderdata.persistence.model.Agency;
import org.murderdata.persistence.model.CaseReport;
import org.murderdata.persistence.repositories.CaseReportRepository;
import org.murderdata.persistence.specifications.CaseReportSpecifications;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/casereports")
public class CaseReportController {
	@Resource
	private CaseReportRepository caseReportRepository;
	
	@RequestMapping(method = RequestMethod.GET)
	public List<CaseReport> getAll(
			@RequestParam(name = "year", required = false) Integer year,
			@RequestParam(name = "agencyId", required = false) Long agencyId
			) {
		Specification<CaseReport> specification = where(CaseReportSpecifications.identity());
		
		if (year != null) {
			specification = where(specification).and(CaseReportSpecifications.yearIs(year));
		}
		
		if (agencyId != null) {
			Agency agency = new Agency();
			agency.setId(agencyId.longValue());
			specification = where(specification).and(CaseReportSpecifications.agencyIs(agency));
		}
		
		Iterable<CaseReport> modelsIterable = this.caseReportRepository.findAll(specification);
		List<CaseReport> models = StreamSupport.stream(modelsIterable.spliterator(), false)
		                .collect(Collectors.toList());	
		return models;
	}
	
	@RequestMapping(value = "/{id}", method = RequestMethod.GET)
	public CaseReport getById(@PathVariable Long id) {
		return this.caseReportRepository.findOne(id);
	}

}
