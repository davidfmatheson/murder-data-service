package org.murderdata.persistence.repositories;

import java.util.List;

import org.murderdata.persistence.model.Agency;
import org.murderdata.persistence.model.County;
import org.springframework.data.repository.CrudRepository;

public interface AgencyRepository extends CrudRepository<Agency, Long> {
	List<Agency> findByCountyNameAndCountyStateAbbreviation(String countyName, String stateAbbreviation);
	List<Agency> findByCountyStateAbbreviation(String stateAbbreviation);
	List<Agency> findByCounty(County county);
}
