-- | Find contacts and locations by providers of study.
-- | Isolation level: read committed
select organization_name
     , organization_country
     , organization_address
     , contact_name
     , contact_phone_number
     , contact_email
from study_providers
         inner join organizations on study_providers.provider_id = organizations.organization_id
         left join contacts on study_providers.provider_id = contacts.organization_id
where study_id = 3;

-- | Find available studies for females.
-- | Isolation level: read committed
select distinct study_id
              , study_title
from (select study_id
      from criteria
      where criterion_indicator = 1
        and criterion_code = 'C1522384'
        and criterion_value = 'Female'
      union
      (
          select study_id
          from criteria
          except
          select study_id
          from criteria
          where criterion_indicator = 1
            and criterion_code = 'C1522384'
            and criterion_value <> 'Female')) female_studies
         natural join study;

-- | Find all studies related to organization.
-- | Isolation level: read committed
select distinct study_id
              , study_title
from (select study_id
      from study
      where creator_id = 7
      union
      select study_id
      from study_providers
      where provider_id = 7) organization_studies
         natural join study;

-- | Find all interventions in study.
-- | Isolation level: read committed
select distinct intervention_id
              , intervention_name
              , intervention_description
from arms
         natural join arm_interventions
         natural join interventions
where study_id = 3;

create or replace view current_studies as
select study_id
     , study_title
     , study_description
     , study_creation_date
     , study_start_date
     , study_finish_date
     , creator_id
from study
where (study.study_start_date < now())
  and (study_finish_date is null or study_finish_date > now());

-- | Find all currently available studies.
-- | Isolation level: read committed
select study_id
     , study_title
from current_studies;

-- | Get all studies that use concrete intervention.
-- | Isolation level: read committed
select distinct study_id
              , study_title
from interventions
         natural join arm_interventions
         natural join arms
         natural join study
where intervention_name = 'Sputnik V';

-- | Find contacts of study creator if it also is the study provider.
-- | Isolation level: read committed
select organization_name
     , organization_country
     , organization_address
     , contact_name
     , contact_phone_number
     , contact_email
from study
         inner join study_providers on study.study_id = study_providers.study_id
    and study.creator_id = study_providers.provider_id
         inner join organizations on study.creator_id = organizations.organization_id
         left join contacts on study.creator_id = contacts.organization_id
where study.study_id = 2;

-- | Calculate number of inclusion and exclusion criteria.
-- | Isolation level: read committed
select study.study_id
     , coalesce(inclusion_criteria.criteria_count, 0) as inclusion_criteria
     , coalesce(exclusion_criteria.criteria_count, 0) as exclusion_criteria
from study
         left join (select study_id
                         , count(criterion_id) as criteria_count
                    from criteria
                    where criterion_indicator = 1
                    group by study_id) inclusion_criteria on study.study_id = inclusion_criteria.study_id
         left join (select study_id
                         , count(criterion_id) as criteria_count
                    from criteria
                    where criterion_indicator = 2
                    group by study_id) exclusion_criteria on study.study_id = exclusion_criteria.study_id;

create or replace view inclusion_criteria as
select criterion_id
     , criterion_code
     , criterion_value
     , criterion_unit
     , criterion_description
     , study_id
from criteria
where criterion_indicator = 1;

-- | Find all inclusion criteria of study.
-- | Isolation level: read committed
select criterion_id
     , criterion_code
     , criterion_value
     , criterion_unit
     , criterion_description
from inclusion_criteria
where study_id = 2;

create or replace view exclusion_criteria as
select criterion_id
     , criterion_code
     , criterion_value
     , criterion_unit
     , criterion_description
     , study_id
from criteria
where criterion_indicator = 2;

-- | Find all exclusion criteria of study.
-- | Isolation level: read committed
select criterion_id
     , criterion_code
     , criterion_value
     , criterion_unit
     , criterion_description
from exclusion_criteria
where study_id = 2;

alter table study
    add mem boolean not null default(false);
