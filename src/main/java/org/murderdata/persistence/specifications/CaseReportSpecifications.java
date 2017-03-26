package org.murderdata.persistence.specifications;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.murderdata.persistence.model.Agency;
import org.murderdata.persistence.model.CaseReport;
import org.springframework.data.jpa.domain.Specification;

public class CaseReportSpecifications {
	public static Specification<CaseReport> identity() {
		return new Specification<CaseReport>() {

			@Override
			public Predicate toPredicate(Root<CaseReport> root, CriteriaQuery<?> query, CriteriaBuilder builder) {
				return builder.and();
			}
			
		};
	}

	public static Specification<CaseReport> yearIs(Integer year) {
		return new Specification<CaseReport>() {

			@Override
			public Predicate toPredicate(Root<CaseReport> root, CriteriaQuery<?> query, CriteriaBuilder builder) {
				return builder.equal(root.get("year"), year);
			}
			
		};
	}

	public static Specification<CaseReport> agencyIs(Agency agency) {
		return new Specification<CaseReport>() {

			@Override
			public Predicate toPredicate(Root<CaseReport> root, CriteriaQuery<?> query, CriteriaBuilder builder) {
				return builder.equal(root.get("agency"), agency);
			}
			
		};
	}

}
