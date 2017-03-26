package org.murderdata.persistence.repositories;

import java.util.List;

import org.murderdata.persistence.model.Agency;
import org.murderdata.persistence.model.CaseReport;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.CrudRepository;

public interface CaseReportRepository extends CrudRepository<CaseReport, Long>, JpaSpecificationExecutor<CaseReport> {
	List<CaseReport> findByAgencyOrderByYear(Agency agency);
}
