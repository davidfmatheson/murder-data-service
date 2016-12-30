package org.murderdata.persistence.repositories;

import java.util.List;

import org.murderdata.persistence.model.County;
import org.murderdata.persistence.model.State;
import org.springframework.data.repository.CrudRepository;

public interface CountyRepository extends CrudRepository<County, Long> {
	List<County> findByStateAbbreviation(String abbreviation);
	List<County> findByStateOrderByName(State state);
}
