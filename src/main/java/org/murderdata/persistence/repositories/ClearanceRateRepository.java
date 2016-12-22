package org.murderdata.persistence.repositories;

import java.util.List;

import org.murderdata.persistence.model.Agency;
import org.murderdata.persistence.model.ClearanceRate;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

public interface ClearanceRateRepository extends CrudRepository<ClearanceRate, Long> {
	List<ClearanceRate> findByAgency(Agency agency);
	List<ClearanceRate> findByAgencyNameAndAgencyCountyNameAndAgencyCountyStateAbbreviation(
			String agencyName,
			String countyName,
			String stateAbbreviation);
	List<ClearanceRate> findByAgencyCountyNameAndAgencyCountyStateAbbreviation(String countyName, String stateAbbreviation);
	List<ClearanceRate> findByAgencyCountyStateAbbreviation(String abbreviation);
	@Query(value = ""
			+ "SELECT clearance_rate.year"
			+ "     , SUM(clearance_rate.murders)"
			+ "     , SUM(clearance_rate.clearances)"
			+ "  FROM clearance_rate"
			+ "     , agency"
			+ "     , county"
			+ "     , state"
			+ " WHERE clearance_rate.agency_id = agency.id"
			+ "   AND agency.county_id = county.id"
			+ "   AND county.state_id = state.id"
			+ " GROUP BY year", nativeQuery = true)
	List<Object[]> findSummary();

	@Query(value = ""
			+ "SELECT clearance_rate.year"
			+ "     , SUM(clearance_rate.murders)"
			+ "     , SUM(clearance_rate.clearances)"
			+ "  FROM clearance_rate"
			+ "     , agency"
			+ "     , county"
			+ "     , state"
			+ " WHERE clearance_rate.agency_id = agency.id"
			+ "   AND agency.county_id = county.id"
			+ "   AND county.state_id = state.id"
			+ "   AND state.abbreviation = :stateAbbreviation"
			+ " GROUP BY year", nativeQuery = true)
	List<Object[]> findSummaryByStateAbbreviation(@Param("stateAbbreviation") String stateAbbreviation);

	@Query(value = ""
			+ "SELECT clearance_rate.year"
			+ "     , SUM(clearance_rate.murders)"
			+ "     , SUM(clearance_rate.clearances)"
			+ "  FROM clearance_rate"
			+ "     , agency"
			+ "     , county"
			+ "     , state"
			+ " WHERE clearance_rate.agency_id = agency.id"
			+ "   AND agency.county_id = county.id"
			+ "   AND county.state_id = state.id"
			+ "   AND state.abbreviation = :stateAbbreviation"
			+ "   AND county.name = :countyName"
			+ " GROUP BY year", nativeQuery = true)
	List<Object[]> findSummaryByStateAbbreviationAndCountyName(@Param("stateAbbreviation") String stateAbbreviation, @Param("countyName") String countyName);

	@Query(value = ""
			+ "SELECT clearance_rate.year"
			+ "     , SUM(clearance_rate.murders)"
			+ "     , SUM(clearance_rate.clearances)"
			+ "  FROM clearance_rate"
			+ "     , agency"
			+ "     , county"
			+ "     , state"
			+ " WHERE clearance_rate.agency_id = agency.id"
			+ "   AND agency.county_id = county.id"
			+ "   AND county.state_id = state.id"
			+ "   AND state.abbreviation = :stateAbbreviation"
			+ "   AND county.name = :countyName"
			+ "   AND agency.name = :agencyName"
			+ " GROUP BY year", nativeQuery = true)
	List<Object[]> findSummaryByStateAbbreviationAndCountyNameAndAgencyName(@Param("stateAbbreviation") String stateAbbreviation, @Param("countyName") String countyName, @Param("agencyName") String agencyName);
	
}
