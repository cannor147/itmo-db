create table organizations
(
    organization_id      integer       not null
        constraint organizations_pk
            primary key,
    organization_name    varchar(1024) not null,
    organization_type    varchar(32)   not null,
    organization_country varchar(128),
    organization_address varchar(1024) not null,
    organization_latlong varchar(32)   not null
);

create table contacts
(
    contact_id           integer      not null
        constraint contacts_pk
            primary key,
    contact_name         varchar(128) not null,
    contact_phone_number varchar(32),
    contact_email        varchar(128) not null,
    contact_address      varchar(1024),
    contact_latlong      varchar(32),
    organization_id      integer      not null
        constraint contacts_organizations_organization_id_fk
            references organizations
);

create table studies
(
    study_id            integer       not null
        constraint studies_pk
            primary key,
    study_title         varchar(1024) not null,
    study_description   varchar(4096) not null,
    study_creation_date timestamp     not null,
    study_start_date    timestamp     not null,
    study_finish_date   timestamp,
    creator_id          integer       not null
        constraint studies_organizations_organization_id_fk
            references organizations
);

create table study_providers
(
    provider_id integer not null
        constraint study_providers_organizations_organization_id_fk
            references organizations,
    study_id    integer not null
        constraint study_providers_studies_study_id_fk
            references study,
    constraint study_providers_pk
        primary key (provider_id, study_id)
);

create table tags
(
    tag_id   integer      not null
        constraint tags_pk
            primary key,
    tag_name varchar(128) not null
);
create unique index tags_tag_name_uindex
    on tags (tag_name);

create table study_tags
(
    study_id integer not null
        constraint study_tags_studies_study_id_fk
            references study,
    tag_id   integer not null
        constraint study_tags_tags_tag_id_fk
            references tags,
    constraint study_tags_pk
        primary key (study_id, tag_id)
);

create table interventions
(
    intervention_id          integer       not null
        constraint interventions_pk
            primary key,
    intervention_name        varchar(1024) not null,
    intervention_description varchar(4096) not null,
    organization_id          integer
        constraint interventions_organizations_organization_id_fk
            references organizations
);

create table arms
(
    arm_id          integer       not null
        constraint arms_pk
            primary key,
    arm_name        varchar(1024) not null,
    arm_description varchar(4096) not null,
    study_id        integer       not null
        constraint arms_studies_study_id_fk
            references study
);

create table arm_interventions
(
    arm_id          integer not null
        constraint arm_interventions_arms_arm_id_fk
            references arms,
    intervention_id integer not null
        constraint arm_interventions_interventions_intervention_id_fk
            references interventions,
    constraint arm_interventions_pk
        primary key (arm_id, intervention_id)
);

create table criteria
(
    criterion_id          integer    not null
        constraint criteria_pk
            primary key,
    criterion_indicator   integer    not null,
    criterion_code        varchar(8) not null,
    criterion_value       varchar(256),
    criterion_unit        varchar(32),
    criterion_description varchar(4096),
    study_id              integer    not null
        constraint criteria_studies_study_id_fk
            references study
);

create table outcomes
(
    outcome_id          integer      not null
        constraint outcomes_pk
            primary key,
    outcome_name        varchar(256) not null,
    outcome_value       varchar(256),
    outcome_unit        varchar(32),
    outcome_description varchar(4096),
    outcome_timeframe   varchar(256),
    study_id            integer      not null
        constraint outcomes_studies_study_id_fk
            references study
);

-- | Identifier.
create unique index arms_arm_id_uindex
    on arms (arm_id);
-- | Identifier.
create unique index contacts_contact_id_uindex
    on contacts (contact_id);
-- | Common usage to search by email.
create index contacts_contact_email_index
    on contacts (contact_email);
-- | Common usage of names of people.
create index contacts_contact_name_index
    on contacts (contact_name);
-- | Identifier.
create unique index criteria_criterion_id_uindex
    on criteria (criterion_id);
-- | Common usage to search by code.
create index criteria_criterion_code_index
    on criteria (criterion_code);
create unique index interventions_intervention_id_uindex
    on interventions (intervention_id);
-- | Common usage of names of medications or devices.
create index interventions_intervention_name_index
    on interventions (intervention_name);
-- | Identifier.
create index organizations_organization_name_index
    on organizations (organization_id);
-- | Common usage of names of organizations.
create unique index organizations_organization_id_uindex
    on organizations (organization_name);
-- | Identifier.
create unique index outcomes_outcome_id_uindex
    on outcomes (outcome_id);
-- | Identifier.
create unique index studies_study_id_uindex
    on study (study_id);
-- | Common usage of study titles.
create index studies_study_title_index
    on study (study_title);
