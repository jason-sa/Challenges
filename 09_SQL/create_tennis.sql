DROP DATABASE IF EXISTS tennis;
CREATE DATABASE tennis;

\connect tennis;

CREATE TABLE  aus_ladies_2013 (
      player1 VARCHAR(255),
      player2 VARCHAR(255),
      round INT,
      result INT,
      fnl1 DOUBLE PRECISION,
      fnl2 DOUBLE PRECISION,
      fsp_1 DOUBLE PRECISION,
      fsw_1 DOUBLE PRECISION,
      ssp_1 DOUBLE PRECISION,
      ssw_1 DOUBLE PRECISION,
      ace_1 INT,
      dbf_1 INT,
      wnr_1 INT,
      ufe_1 INT,
      bpc_1 INT,
      bpw_1 INT,
      npa_1 INT,
      npw_1 INT,
      tpw_1 INT,
      st1_1 INT,
      st2_1 INT,
      st3_1 INT,
      st4_1 INT,
      st5_1 INT,
      fsp_2 DOUBLE PRECISION,
      fsw_2 DOUBLE PRECISION,
      ssp_2 DOUBLE PRECISION,
      ssw_2 DOUBLE PRECISION,
      ace_2 INT,
      dbf_2 INT,
      wnr_2 INT,
      ufe_2 INT,
      bpc_2 INT,
      bpw_2 INT,
      npa_2 INT,
      npw_2 INT,
      tpw_2 INT,
      st1_2 INT,
      st2_2 INT,
      st3_2 INT,
      st4_2 INT,
      st5_2 INT);


CREATE TABLE 
      aus_men_2013 
(LIKE 
      aus_ladies_2013);

CREATE TABLE 
      us_men_2013 
(LIKE 
      aus_ladies_2013);

CREATE TABLE 
      french_men_2013 
(LIKE 
      aus_ladies_2013);

CREATE TABLE 
      wimbledon_men_2013 
(LIKE 
      aus_ladies_2013);

CREATE TABLE 
      us_ladies_2013 
(LIKE 
      aus_ladies_2013);

CREATE TABLE 
      french_ladies_2013 
(LIKE 
      aus_ladies_2013);

CREATE TABLE 
      wimbledon_ladies_2013 
(LIKE 
      aus_ladies_2013);

COPY 
      aus_ladies_2013
FROM 
      '/home/jason/tennis/data/AusOpen-women-2013.csv'
DELIMITER 
      ','
CSV HEADER;

COPY 
      aus_men_2013
FROM 
      '/home/jason/tennis/data/AusOpen-men-2013.csv'
DELIMITER 
      ','
CSV HEADER;


COPY 
      french_ladies_2013
FROM 
      '/home/jason/tennis/data/FrenchOpen-women-2013.csv'
DELIMITER 
      ','
CSV HEADER;

COPY 
      french_men_2013
FROM 
      '/home/jason/tennis/data/FrenchOpen-men-2013.csv'
DELIMITER 
      ','
CSV HEADER;

COPY 
      wimbledon_ladies_2013
FROM 
      '/home/jason/tennis/data/Wimbledon-women-2013.csv'
DELIMITER 
      ','
CSV HEADER;

COPY 
      wimbledon_men_2013
FROM 
      '/home/jason/tennis/data/Wimbledon-men-2013.csv'
DELIMITER 
      ','
CSV HEADER;

COPY 
      us_ladies_2013
FROM 
      '/home/jason/tennis/data/USOpen-women-2013.csv'
DELIMITER 
      ','
CSV HEADER;

COPY 
      us_men_2013
FROM 
      '/home/jason/tennis/data/USOpen-men-2013.csv'
DELIMITER 
      ','
CSV HEADER;

ALTER TABLE aus_ladies_2013 ADD match_id SERIAL; 
ALTER TABLE french_ladies_2013 ADD match_id SERIAL; 
ALTER TABLE wimbledon_ladies_2013 ADD match_id SERIAL; 
ALTER TABLE us_ladies_2013 ADD match_id SERIAL; 
ALTER TABLE aus_men_2013 ADD match_id SERIAL; 
ALTER TABLE french_men_2013 ADD match_id SERIAL; 
ALTER TABLE wimbledon_men_2013 ADD match_id SERIAL; 
ALTER TABLE US_men_2013 ADD match_id SERIAL;

 
CREATE TABLE  tournaments_2013 (
      tournament VARCHAR(50),
      gender VARCHAR(1),
      match_ID INT,
      player VARCHAR(255),
      round INT,
      result INT,
      fnl DOUBLE PRECISION,
      fsp DOUBLE PRECISION,
      fsw DOUBLE PRECISION,
      ssp DOUBLE PRECISION,
      ssw DOUBLE PRECISION,
      ace INT,
      dbf INT,
      wnr INT,
      ufe INT,
      bpc INT,
      bpw INT,
      npa INT,
      npw INT,
      tpw INT,
      st1 INT,
      st2 INT,
      st3 INT,
      st4 INT,
      st5 INT);

INSERT INTO tournaments_2013
(

SELECT
     'aus',
     'F',
     match_ID, 
      player1 ,
      round ,
      result ,
      fnl1 ,
      fsp_1,
      fsw_1,
      ssp_1,
      ssw_1,
      ace_1,
      dbf_1,
      wnr_1,
      ufe_1,
      bpc_1,
      bpw_1,
      npa_1,
      npw_1,
      tpw_1,
      st1_1,
      st2_1,
      st3_1,
      st4_1,
      st5_1
FROM aus_ladies_2013
UNION ALL
SELECT 
      'aus',
      'F',
      match_ID,
      player2 ,
      round ,
      1 - result ,
      fnl2 ,
      fsp_2,
      fsw_2,
      ssp_2,
      ssw_2,
      ace_2,
      dbf_2,
      wnr_2,
      ufe_2,
      bpc_2,
      bpw_2,
      npa_2,
      npw_2,
      tpw_2,
      st1_2,
      st2_2,
      st3_2,
      st4_2,
      st5_2
FROM aus_ladies_2013
UNION ALL
SELECT
     'aus',
     'M',
     match_ID, 
      player1 ,
      round ,
      result ,
      fnl1 ,
      fsp_1,
      fsw_1,
      ssp_1,
      ssw_1,
      ace_1,
      dbf_1,
      wnr_1,
      ufe_1,
      bpc_1,
      bpw_1,
      npa_1,
      npw_1,
      tpw_1,
      st1_1,
      st2_1,
      st3_1,
      st4_1,
      st5_1
FROM aus_men_2013
UNION ALL
SELECT 
      'aus',
      'M',
      match_ID,
      player2 ,
      round ,
      1 - result ,
      fnl2 ,
      fsp_2,
      fsw_2,
      ssp_2,
      ssw_2,
      ace_2,
      dbf_2,
      wnr_2,
      ufe_2,
      bpc_2,
      bpw_2,
      npa_2,
      npw_2,
      tpw_2,
      st1_2,
      st2_2,
      st3_2,
      st4_2,
      st5_2
FROM aus_men_2013
UNION ALL
SELECT
     'french',
     'F',
     match_ID, 
      player1 ,
      round ,
      result ,
      fnl1 ,
      fsp_1,
      fsw_1,
      ssp_1,
      ssw_1,
      ace_1,
      dbf_1,
      wnr_1,
      ufe_1,
      bpc_1,
      bpw_1,
      npa_1,
      npw_1,
      tpw_1,
      st1_1,
      st2_1,
      st3_1,
      st4_1,
      st5_1
FROM french_ladies_2013
UNION ALL
SELECT 
      'french',
      'F',
      match_ID,
      player2 ,
      round ,
      1 - result ,
      fnl2 ,
      fsp_2,
      fsw_2,
      ssp_2,
      ssw_2,
      ace_2,
      dbf_2,
      wnr_2,
      ufe_2,
      bpc_2,
      bpw_2,
      npa_2,
      npw_2,
      tpw_2,
      st1_2,
      st2_2,
      st3_2,
      st4_2,
      st5_2
FROM french_ladies_2013
UNION ALL
SELECT
     'french',
     'M',
     match_ID, 
      player1 ,
      round ,
      result ,
      fnl1 ,
      fsp_1,
      fsw_1,
      ssp_1,
      ssw_1,
      ace_1,
      dbf_1,
      wnr_1,
      ufe_1,
      bpc_1,
      bpw_1,
      npa_1,
      npw_1,
      tpw_1,
      st1_1,
      st2_1,
      st3_1,
      st4_1,
      st5_1
FROM french_men_2013
UNION ALL
SELECT 
      'french',
      'M',
      match_ID,
      player2 ,
      round ,
      1 - result ,
      fnl2 ,
      fsp_2,
      fsw_2,
      ssp_2,
      ssw_2,
      ace_2,
      dbf_2,
      wnr_2,
      ufe_2,
      bpc_2,
      bpw_2,
      npa_2,
      npw_2,
      tpw_2,
      st1_2,
      st2_2,
      st3_2,
      st4_2,
      st5_2
FROM french_men_2013
UNION ALL
SELECT
     'wim',
     'F',
     match_ID, 
      player1 ,
      round ,
      result ,
      fnl1 ,
      fsp_1,
      fsw_1,
      ssp_1,
      ssw_1,
      ace_1,
      dbf_1,
      wnr_1,
      ufe_1,
      bpc_1,
      bpw_1,
      npa_1,
      npw_1,
      tpw_1,
      st1_1,
      st2_1,
      st3_1,
      st4_1,
      st5_1
FROM wimbledon_ladies_2013
UNION ALL
SELECT 
      'wim',
      'F',
      match_ID,
      player2 ,
      round ,
      1 - result ,
      fnl2 ,
      fsp_2,
      fsw_2,
      ssp_2,
      ssw_2,
      ace_2,
      dbf_2,
      wnr_2,
      ufe_2,
      bpc_2,
      bpw_2,
      npa_2,
      npw_2,
      tpw_2,
      st1_2,
      st2_2,
      st3_2,
      st4_2,
      st5_2
FROM wimbledon_ladies_2013
UNION ALL
SELECT
     'wim',
     'M',
     match_ID, 
      player1 ,
      round ,
      result ,
      fnl1 ,
      fsp_1,
      fsw_1,
      ssp_1,
      ssw_1,
      ace_1,
      dbf_1,
      wnr_1,
      ufe_1,
      bpc_1,
      bpw_1,
      npa_1,
      npw_1,
      tpw_1,
      st1_1,
      st2_1,
      st3_1,
      st4_1,
      st5_1
FROM wimbledon_men_2013
UNION ALL
SELECT 
      'wim',
      'M',
      match_ID,
      player2 ,
      round ,
      1 - result ,
      fnl2 ,
      fsp_2,
      fsw_2,
      ssp_2,
      ssw_2,
      ace_2,
      dbf_2,
      wnr_2,
      ufe_2,
      bpc_2,
      bpw_2,
      npa_2,
      npw_2,
      tpw_2,
      st1_2,
      st2_2,
      st3_2,
      st4_2,
      st5_2
FROM wimbledon_men_2013
UNION ALL
SELECT
     'us',
     'F',
     match_ID, 
      player1 ,
      round ,
      result ,
      fnl1 ,
      fsp_1,
      fsw_1,
      ssp_1,
      ssw_1,
      ace_1,
      dbf_1,
      wnr_1,
      ufe_1,
      bpc_1,
      bpw_1,
      npa_1,
      npw_1,
      tpw_1,
      st1_1,
      st2_1,
      st3_1,
      st4_1,
      st5_1
FROM us_ladies_2013
UNION ALL
SELECT 
      'us',
      'F',
      match_ID,
      player2 ,
      round ,
      1 - result ,
      fnl2 ,
      fsp_2,
      fsw_2,
      ssp_2,
      ssw_2,
      ace_2,
      dbf_2,
      wnr_2,
      ufe_2,
      bpc_2,
      bpw_2,
      npa_2,
      npw_2,
      tpw_2,
      st1_2,
      st2_2,
      st3_2,
      st4_2,
      st5_2
FROM us_ladies_2013
UNION ALL
SELECT
     'us',
     'M',
     match_ID, 
      player1 ,
      round ,
      result ,
      fnl1 ,
      fsp_1,
      fsw_1,
      ssp_1,
      ssw_1,
      ace_1,
      dbf_1,
      wnr_1,
      ufe_1,
      bpc_1,
      bpw_1,
      npa_1,
      npw_1,
      tpw_1,
      st1_1,
      st2_1,
      st3_1,
      st4_1,
      st5_1
FROM us_men_2013
UNION ALL
SELECT 
      'us',
      'M',
      match_ID,
      player2 ,
      round ,
      1 - result ,
      fnl2 ,
      fsp_2,
      fsw_2,
      ssp_2,
      ssw_2,
      ace_2,
      dbf_2,
      wnr_2,
      ufe_2,
      bpc_2,
      bpw_2,
      npa_2,
      npw_2,
      tpw_2,
      st1_2,
      st2_2,
      st3_2,
      st4_2,
      st5_2
FROM us_men_2013
);

SELECT * FROM tournaments_2013 WHERE match_id = 1;
