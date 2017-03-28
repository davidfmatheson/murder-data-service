package org.murderdata.service;

import static org.murderdata.persistence.specifications.CaseReportSpecifications.agencyIs;
import static org.murderdata.persistence.specifications.CaseReportSpecifications.countyIs;
import static org.murderdata.persistence.specifications.CaseReportSpecifications.identity;
import static org.murderdata.persistence.specifications.CaseReportSpecifications.yearIs;
import static org.springframework.data.jpa.domain.Specifications.where;

import java.util.List;

import javax.annotation.Resource;

import org.murderdata.persistence.model.Agency;
import org.murderdata.persistence.model.CaseReport;
import org.murderdata.persistence.model.County;
import org.murderdata.persistence.repositories.CaseReportRepository;
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
			@RequestParam(name = "agencyId", required = false) Long agencyId,
			@RequestParam(name = "countyId", required = false) Long countyId
			) {
		Specification<CaseReport> specification = where(identity());
		
		if (year != null) {
			specification = where(specification).and(yearIs(year));
		}
		
		if (agencyId != null) {
			specification = where(specification).and(agencyIs(new Agency(agencyId.longValue())));
		}
		
		if (countyId != null) {
			specification = where(specification).and(countyIs(new County(countyId.longValue())));
		}

		return this.caseReportRepository.findAll(specification);
	}
	
	@RequestMapping(value = "/{id}", method = RequestMethod.GET)
	public CaseReport getById(@PathVariable Long id) {
		return this.caseReportRepository.findOne(id);
	}

}
