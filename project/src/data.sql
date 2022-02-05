insert into organizations (organization_id, organization_name, organization_type, organization_country, organization_address, organization_latlong) values (1, 'H. Lee Moffitt Cancer Center & Research Institute', 'medical', 'United States of America', '3011 Holly Dr, Tampa, FL 33612, USA', '28.06413, -82.42106');
insert into organizations (organization_id, organization_name, organization_type, organization_country, organization_address, organization_latlong) values (2, 'КГБУЗ КДЦ "Вивея"', 'medical', 'Russian Federation', 'Ulitsa Zaparina, 83, Khabarovsk, Khabarovsk Krai, 680000', '48.47787, 135.06306');
insert into organizations (organization_id, organization_name, organization_type, organization_country, organization_address, organization_latlong) values (4, 'World Health Organization', 'other', null, 'Av. Appia 20, 1202 Genève, Switzerland', '46.23283, 6.13406');
insert into organizations (organization_id, organization_name, organization_type, organization_country, organization_address, organization_latlong) values (5, 'Pfizer Inc.', 'company', 'United States of America', '235 E 42nd St, New York, NY 10017, United States', '40.75043, -73.97275');
insert into organizations (organization_id, organization_name, organization_type, organization_country, organization_address, organization_latlong) values (3, 'Herzliya Medical Center', 'medical', 'Israel', 'Ramat Yam St 7, Herzliya, Israel, 4685107', '32.17744, 34.80313');
insert into organizations (organization_id, organization_name, organization_type, organization_country, organization_address, organization_latlong) values (6, 'НИЦ эпидемиологии и микробиологии имени Н.Ф. Гамалеи', 'research', 'Russian Federation', 'Ulitsa Gamalei, 18, Moscow, 123098', '55.80149, 37.45725');
insert into organizations (organization_id, organization_name, organization_type, organization_country, organization_address, organization_latlong) values (8, 'Сімферопольський кардіологічний центр ім. Святого Володимира', 'medical', 'Ukraine', 'Vulitsa Shevchenka, 45, Simferopol, 123456', '44.95546, 34.10906');
insert into organizations (organization_id, organization_name, organization_type, organization_country, organization_address, organization_latlong) values (9, 'Симферопольский кардиологический научно-исследовательский центр', 'medical', 'Russian Federation', 'Ulitsa Shevchenko, 45, Simferopol, 123456', '44.95546, 34.10906');
insert into organizations (organization_id, organization_name, organization_type, organization_country, organization_address, organization_latlong) values (7, 'ФСБ России', 'government', 'Russian Federation', 'Lubyanka Square, 2, Moscow, 109012', '55.75972, 37.62566');
insert into organizations (organization_id, organization_name, organization_type, organization_country, organization_address, organization_latlong) values (10, 'Государственный научно-исследовательский институт органической химии и технологии', 'research', 'Russian Federation', 'Shosse Entuziastov, 23, Moscow, 111024', '55.75457, 37.72962');
insert into organizations (organization_id, organization_name, organization_type, organization_country, organization_address, organization_latlong) values (11, 'Medical University of South Carolina', 'medical', 'United States of America', '171 Ashley Ave, Charleston, SC 29425, United States', '32.78475, -79.94743');

insert into contacts (contact_id, contact_name, contact_phone_number, contact_email, contact_address, contact_latlong, organization_id) values (1, 'Александр Бортников', null, 'fsb@fsb.ru', 'Lubyanka Square, 2, Moscow, 109012', '55.75972, 37.62566', 7);
insert into contacts (contact_id, contact_name, contact_phone_number, contact_email, contact_address, contact_latlong, organization_id) values (2, 'Jamie Harrington', '(813) 745-0589', 'jamie.harrington@moffitt.org', null, null, 1);
insert into contacts (contact_id, contact_name, contact_phone_number, contact_email, contact_address, contact_latlong, organization_id) values (3, 'John Smith', '(843) 792-9700', 'johnsmith83@adfs.musc.edu', '171 Ashley Ave, Charleston, SC 29425, United States', '32.78475, -79.94743', 11);
insert into contacts (contact_id, contact_name, contact_phone_number, contact_email, contact_address, contact_latlong, organization_id) values (4, 'Mike Wazowski', '(843) 792-9701', 'mikewazowski71@adfs.musc.edu', '171 Ashley Ave, Charleston, SC 29425, United States', '32.78475, -79.94743', 11);
insert into contacts (contact_id, contact_name, contact_phone_number, contact_email, contact_address, contact_latlong, organization_id) values (5, 'Ерофей Башунов', null, 'cannor147@gmail.com', 'Ulitsa Frunze, 58, Khabarovsk, 680000', '48.47490, 135.06509', 2);
insert into contacts (contact_id, contact_name, contact_phone_number, contact_email, contact_address, contact_latlong, organization_id) values (6, 'Сергей Фургал', null, 'furgal@adm.khv.ru', null, null, 2);

insert into study (study_id, study_title, study_description, study_creation_date, study_start_date, study_finish_date, creator_id) values (1, 'Poisoning of Alexei Navalny', 'Vladimir Putin is the best president in the world.', '2020-01-04 03:03:43.000000', '2020-08-20 00:00:00.000000', '2020-08-21 23:59:59.999999', 7);
insert into study (study_id, study_title, study_description, study_creation_date, study_start_date, study_finish_date, creator_id) values (2, 'A "Window Trial" on Curcumin for Invasive Breast Cancer Primary Tumors', 'The purpose of this study is to determine whether oral administration of Curcuma longa extract causes biological changes related to apoptosis (DNA fragmentation) and cell proliferation (Ki67) in primary tumors of breast cancer patients.', '2020-01-25 16:28:45.000000', '2020-01-29 00:00:00.000000', '2022-12-30 23:59:59.999999', 11);
insert into study (study_id, study_title, study_description, study_creation_date, study_start_date, study_finish_date, creator_id) values (3, 'Sputnik V Anti-Covid-19 testing', 'Phase 1 and 2 clinical trials of the vaccine have been completed on August 1, 2020. All the volunteers are feeling well, no unforeseen or unwanted side effects were observed. The vaccine induced strong antibody and cellular immune response. Not a single participant of the current clinical trials got infected with COVID-19 after being administered with the vaccine. The high efficacy of the vaccine was confirmed by high precision tests for antibodies in the blood serum of volunteers (including an analysis for antibodies that neutralize the coronavirus), as well as the ability of the immune cells of the volunteers to activate in response to the spike S protein of the coronavirus, which indicates the formation of both antibody and cellular immune vaccine response.

Post-registration clinical trials involving more than 31,000 people in Russia and Belarus were launched on August 25, 2020. A number of countries, such as UAE, India and Venezuela joined the clinical trials of Sputnik V locally. The vaccine has received a registration certificate from the Russian Ministry of Health on August 11 and under emergency rules adopted during the COVID-19 pandemic can be used to vaccinate the population in Russia.

In Phase III clinical trials, Sputnik V showed strong efficacy, immunogenicity and safety results.', '2020-06-25 21:19:40.000000', '2020-06-18 00:00:00.000000', null, 4);
insert into study (study_id, study_title, study_description, study_creation_date, study_start_date, study_finish_date, creator_id) values (4, 'Pfizer Testing', 'The primary objective of this study is to determine the vaccine effectiveness (VE) of 2-doses of Pfizer''s BNT162b2 vaccine against COVID-19-associated hospitalization. In addition, VE of 1 dose and at least one dose will be determined. Other outcomes in addition to hospitalization to be assessed include COVID-19-associated ED admissions, ICU admissions, outpatient visits and death. To assess VE, we propose a large retrospective database study using two parallel study designs: a test-negative case-control design and a retrospective cohort design. The test-negative design (TND) will assess VE against COVID-19 hospitalization (primary endpoint) and emergency department (ED) admission. The retrospective cohort analysis will assess VE against COVID-19 hospitalization (primary), ICU admission, death, ED admission, and outpatient disease (with no subsequent hospitalization within 14 days). We will further conduct exploratory analyses of VE estimates by strain type.', '2021-01-17 18:54:00.000000', '2021-05-15 00:00:00.000000', null, 4);

insert into study_providers (provider_id, study_id) values (7, 1);
insert into study_providers (provider_id, study_id) values (11, 2);
insert into study_providers (provider_id, study_id) values (2, 3);
insert into study_providers (provider_id, study_id) values (6, 3);
insert into study_providers (provider_id, study_id) values (9, 3);
insert into study_providers (provider_id, study_id) values (10, 3);
insert into study_providers (provider_id, study_id) values (3, 4);
insert into study_providers (provider_id, study_id) values (11, 4);

insert into tags (tag_id, tag_name) values (1, 'covid-19');
insert into tags (tag_id, tag_name) values (2, 'coronavirus');
insert into tags (tag_id, tag_name) values (3, 'novichok');
insert into tags (tag_id, tag_name) values (4, 'breast cancer');
insert into tags (tag_id, tag_name) values (5, 'breast neoplasms');
insert into tags (tag_id, tag_name) values (6, 'pfizer');

insert into study_tags (study_id, tag_id) values (1, 3);
insert into study_tags (study_id, tag_id) values (2, 4);
insert into study_tags (study_id, tag_id) values (2, 5);
insert into study_tags (study_id, tag_id) values (3, 1);
insert into study_tags (study_id, tag_id) values (3, 2);
insert into study_tags (study_id, tag_id) values (4, 1);
insert into study_tags (study_id, tag_id) values (4, 2);
insert into study_tags (study_id, tag_id) values (4, 6);

insert into interventions (intervention_id, intervention_name, intervention_description, organization_id) values (1, 'Sputnik V', 'Adenovirus viral vector vaccine for COVID-19', 6);
insert into interventions (intervention_id, intervention_name, intervention_description, organization_id) values (2, 'Novichok agent', 'Group of nerve agents, some of which are binary chemical weapons', 10);
insert into interventions (intervention_id, intervention_name, intervention_description, organization_id) values (3, 'Tozinameran', 'Pfizer–BioNTech COVID-19 vaccine', 5);
insert into interventions (intervention_id, intervention_name, intervention_description, organization_id) values (4, 'Eugenozhelenskiardin', 'Vaccine from any disease.', 8);
insert into interventions (intervention_id, intervention_name, intervention_description, organization_id) values (5, 'KHC-234 ', 'Device, developed by Moffit Cancer Center in 2027.', 1);
insert into interventions (intervention_id, intervention_name, intervention_description, organization_id) values (6, 'Curcumin', 'Curcumin is an extract from turmeric', null);

insert into arms (arm_id, arm_name, arm_description, study_id) values (1, 'Alexey Navalny', 'Opposition politics in Russia', 1);
insert into arms (arm_id, arm_name, arm_description, study_id) values (2, 'Yulia Navalnaya', 'Relatives of opposition politics in Russia', 1);
insert into arms (arm_id, arm_name, arm_description, study_id) values (3, 'Experimental: Curcumin', 'Curcumin will be given at 500mg by mouth twice a day', 2);
insert into arms (arm_id, arm_name, arm_description, study_id) values (4, 'Fully vaccinated', '2 doses of Sputnik V received with ≥7 days between receipt of the 2nd dose and the index date. This group will serve as the ''exposed'' group evaluated in the primary objective.', 3);
insert into arms (arm_id, arm_name, arm_description, study_id) values (5, 'Partially vaccinated', '1 dose (only) of Sputnik V received with ≥14 days between receipt of the 1st dose and the index date.', 3);
insert into arms (arm_id, arm_name, arm_description, study_id) values (6, 'Ever vaccinated', '≥1 dose of Sputnik V received with ≥14 days between index date and receipt of the 1st dose', 3);
insert into arms (arm_id, arm_name, arm_description, study_id) values (7, 'Never vaccinated', 'never received Sputnik V. This group will serve as the reference exposure group (i.e., ''unexposed'' group) in all VE analyses', 3);
insert into arms (arm_id, arm_name, arm_description, study_id) values (8, 'Fully vaccinated', '2 doses of BNT162b2 received with ≥7 days between receipt of the 2nd dose and the index date. This group will serve as the ''exposed'' group evaluated in the primary objective.', 4);
insert into arms (arm_id, arm_name, arm_description, study_id) values (9, 'Partially vaccinated', '1 dose (only) of BNT162b2 received with ≥14 days between receipt of the 1st dose and the index date.', 4);
insert into arms (arm_id, arm_name, arm_description, study_id) values (10, 'Ever vaccinated', '≥1 dose of BNT162b2 received with ≥14 days between index date and receipt of the 1st dose', 4);
insert into arms (arm_id, arm_name, arm_description, study_id) values (11, 'Never vaccinated', 'never received BNT162b2. This group will serve as the reference exposure group (i.e., ''unexposed'' group) in all VE analyses', 4);

insert into arm_interventions (arm_id, intervention_id) values (1, 2);
insert into arm_interventions (arm_id, intervention_id) values (3, 6);
insert into arm_interventions (arm_id, intervention_id) values (4, 1);
insert into arm_interventions (arm_id, intervention_id) values (5, 1);
insert into arm_interventions (arm_id, intervention_id) values (6, 1);
insert into arm_interventions (arm_id, intervention_id) values (7, 1);
insert into arm_interventions (arm_id, intervention_id) values (8, 3);
insert into arm_interventions (arm_id, intervention_id) values (9, 3);
insert into arm_interventions (arm_id, intervention_id) values (10, 3);
insert into arm_interventions (arm_id, intervention_id) values (11, 3);

insert into criteria (criterion_id, criterion_indicator, criterion_code, criterion_value, criterion_unit, criterion_description, study_id) values (1, 1, 'C0001779', '18', '#', '18 years of age or older', 1);
insert into criteria (criterion_id, criterion_indicator, criterion_code, criterion_value, criterion_unit, criterion_description, study_id) values (2, 1, 'C0001779', '18', '#', '18 years of age or older', 2);
insert into criteria (criterion_id, criterion_indicator, criterion_code, criterion_value, criterion_unit, criterion_description, study_id) values (3, 1, 'C0001779', '18', '#', '18 years of age or older', 3);
insert into criteria (criterion_id, criterion_indicator, criterion_code, criterion_value, criterion_unit, criterion_description, study_id) values (4, 1, 'C0001779', '18', '#', '18 years of age or older', 4);
insert into criteria (criterion_id, criterion_indicator, criterion_code, criterion_value, criterion_unit, criterion_description, study_id) values (5, 1, 'C1520224', '0 or 1', '{text}', 'Eastern Cooperative Oncology Group (ECOG) performance status of 0 or 1', 2);
insert into criteria (criterion_id, criterion_indicator, criterion_code, criterion_value, criterion_unit, criterion_description, study_id) values (6, 2, 'C0032961', null, null, 'Subjects who are pregnant or are lactating.', 2);
insert into criteria (criterion_id, criterion_indicator, criterion_code, criterion_value, criterion_unit, criterion_description, study_id) values (7, 2, 'C0242643', null, null, 'Subjects taking drugs that interact with P-glycoprotein (P-gp)', 2);

insert into outcomes (outcome_id, outcome_name, outcome_value, outcome_unit, outcome_description, outcome_timeframe, study_id) values (1, 'Change in tumor proliferation rate', 'Yes', '{text}', 'Change in tumor proliferation rate will be based on apoptosis (DNA fragmentation) and cell proliferation (Ki67) assays in biopsies pre and post treatment with curcumin', 'Up to 56 days', 2);
insert into outcomes (outcome_id, outcome_name, outcome_value, outcome_unit, outcome_description, outcome_timeframe, study_id) values (2, 'Number of adverse events reported', '19', '#', 'Safety data will be tabulated by type and grade of adverse event and will use CTCAE v. 4.0', 'Up to 84 days', 2);
insert into outcomes (outcome_id, outcome_name, outcome_value, outcome_unit, outcome_description, outcome_timeframe, study_id) values (3, 'Number of deaths', '0', '#', 'Deaths count of novichok', 'Up to 90 days', 1);
insert into outcomes (outcome_id, outcome_name, outcome_value, outcome_unit, outcome_description, outcome_timeframe, study_id) values (4, 'Tolerated dose', '1', 'mg', 'Maximal tolerated dose of novichok', 'Up to 90 days', 1);
