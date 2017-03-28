package org.murderdata.persistence.specifications;

import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.murderdata.persistence.model.Agency;
import org.murderdata.persistence.model.Agency_;
import org.murderdata.persistence.model.CaseReport;
import org.murderdata.persistence.model.CaseReport_;
import org.murderdata.persistence.model.County;
import org.murderdata.persistence.model.County_;
import org.murderdata.persistence.model.State;
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
				return builder.equal(root.get(CaseReport_.year), year);
			}
			
		};
	}

	public static Specification<CaseReport> agencyIs(Agency agency) {
		return new Specification<CaseReport>() {

			@Override
			public Predicate toPredicate(Root<CaseReport> root, CriteriaQuery<?> query, CriteriaBuilder builder) {
				return builder.equal(root.get(CaseReport_.agency), agency);
			}
			
		};
	}

	public static Specification<CaseReport> agencyIn(List<Agency> agencies) {
		return new Specification<CaseReport>() {

			@Override
			public Predicate toPredicate(Root<CaseReport> root, CriteriaQuery<?> query, CriteriaBuilder builder) {
				return root.get(CaseReport_.agency).in(agencies);
			}
			
		};
	}

	public static Specification<CaseReport> countyIs(County county) {
		return new Specification<CaseReport>() {

			@Override
			public Predicate toPredicate(Root<CaseReport> root, CriteriaQuery<?> query, CriteriaBuilder builder) {
				return builder.equal(root.join(CaseReport_.agency).get(Agency_.county), county);
			}
			
		};
	}

	public static Specification<CaseReport> stateIs(State state) {
		return new Specification<CaseReport>() {

			@Override
			public Predicate toPredicate(Root<CaseReport> root, CriteriaQuery<?> query, CriteriaBuilder builder) {
				return builder.equal(root.join(CaseReport_.agency).join(Agency_.county).get(County_.state), state);
			}
			
		};
	}

}
