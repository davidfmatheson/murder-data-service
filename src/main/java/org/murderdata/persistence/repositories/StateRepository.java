package org.murderdata.persistence.repositories;

import java.util.List;

import org.murderdata.persistence.model.State;
import org.springframework.data.repository.CrudRepository;

public interface StateRepository extends CrudRepository<State, Long> {
	List<State> findByAbbreviation(String abbreviation);
}
