DROP TABLE IF EXISTS em_quali;
DROP TABLE IF EXISTS em_team;
DROP SEQUENCE IF EXISTS em_quali_seq;

CREATE SEQUENCE em_quali_seq;

CREATE TABLE em_team(
    team_name VARCHAR NOT NULL PRIMARY KEY,
    group_name CHAR(1) NOT NULL
);

CREATE TABLE em_quali(
    id BIGINT NOT NULL DEFAULT nextval('em_quali_seq') PRIMARY KEY,
    game_date DATE NOT NULL,
    home_team VARCHAR NOT NULL,
    home_goals INTEGER NOT NULL,
    visitor_team VARCHAR NOT NULL,
    visitor_goals INTEGER NOT NULL,
    CONSTRAINT em_quali_home_team_fk FOREIGN KEY (home_team) REFERENCES em_team(team_name),
    CONSTRAINT em_quali_visitor_team_fk FOREIGN KEY (visitor_team) REFERENCES em_team(team_name)
);

INSERT INTO em_team(group_name, team_name) VALUES

('A', 'Kasachstan'),
('A', 'Tschechien'),
('A', 'Island'),
('A', 'Lettland'),
('A', 'Niederlande'),
('A', 'Türkei'),

('B', 'Andorra'),
('B', 'Bosnien und Herzegowina'),
('B', 'Wales'),
('B', 'Belgien'),
('B', 'Zypern'),
('B', 'Israel'),

('C', 'Luxemburg'),
('C', 'Spanien'),
('C', 'Ukraine'),
('C', 'Weißrussland'),
('C', 'Mazedonien'),
('C', 'Slowakei'),

('D', 'Georgien'),
('D', 'Deutschland'),
('D', 'Gibraltar'),
('D', 'Irland'),
('D', 'Schottland'),
('D', 'Polen'),

('E', 'Estland'),
('E', 'San Marino'),
('E', 'Schweiz'),
('E', 'England'),
('E', 'Litauen'),
('E', 'Slowenien'),

('F', 'Ungarn'),
('F', 'Färöer-Inseln'),
('F', 'Griechenland'),
('F', 'Rumänien'),
('F', 'Finnland'),
('F', 'Nordirland'),

('G', 'Russland'),
('G', 'Österreich'),
('G', 'Montenegro'),
('G', 'Liechtenstein'),
('G', 'Moldawien'),
('G', 'Schweden'),

('H', 'Aserbaidschan'),
('H', 'Kroatien'),
('H', 'Norwegen'),
('H', 'Bulgarien'),
('H', 'Italien'),
('H', 'Malta'),

('I', 'Dänemark'),
('I', 'Serbien'),
('I', 'Portugal'),
('I', 'Armenien'),
('I', 'Albanien');

INSERT INTO em_quali
(game_date, home_team, home_goals, visitor_team, visitor_goals) VALUES 

-- Gruppe A

('2014-09-09', 'Kasachstan',     0, 'Lettland',       0),
('2014-09-09', 'Tschechien',     2, 'Niederlande',    1),
('2014-09-09', 'Island',         3, 'Türkei',         0),

('2014-10-10', 'Lettland',     0, 'Island',    3),
('2014-10-10', 'Niederlande',  3, 'Kasachstan',     1),
('2014-10-10', 'Türkei',       1, 'Tschechien',  2),

('2014-10-13', 'Kasachstan',   2, 'Tschechien',       4),
('2014-10-13', 'Island',       2, 'Niederlande',   0),
('2014-10-13', 'Lettland',     1, 'Türkei',     1),

('2014-11-16', 'Niederlande',     6, 'Lettland',        0),
('2014-11-16', 'Tschechien',  2, 'Island',    1),
('2014-11-16', 'Türkei',   3, 'Kasachstan',       1),

('2015-03-28', 'Kasachstan',     0, 'Island',  3),
('2015-03-28', 'Tschechien',   1, 'Lettland',    1),
('2015-03-28', 'Niederlande',       1, 'Türkei',        1),

('2015-06-12', 'Kasachstan',        0, 'Türkei',     1),
('2015-06-12', 'Island',       2, 'Tschechien',   1),
('2015-06-12', 'Lettland',    0, 'Niederlande',  2),

('2015-09-03', 'Tschechien',     2, 'Kasachstan',   1),
('2015-09-03', 'Niederlande',  0, 'Island',        1),
('2015-09-03', 'Türkei',    1, 'Lettland',       1),

('2015-09-06', 'Lettland',        1, 'Tschechien',    2),
('2015-09-06', 'Türkei',       3, 'Niederlande',     0),
('2015-09-06', 'Island',   0, 'Kasachstan',  0),

('2015-10-10', 'Island',     2, 'Lettland',    2),
('2015-10-10', 'Kasachstan',       1, 'Niederlande',  2),
('2015-10-10', 'Tschechien',   0, 'Türkei',        2),

('2015-10-13', 'Lettland',  0, 'Kasachstan',     1),
('2015-10-13', 'Niederlande',    2, 'Tschechien',   3),
('2015-10-13', 'Türkei',        1, 'Island',       0),

-- Gruppe B

('2014-09-09', 'Andorra',     1, 'Wales',       2),
('2014-09-09', 'Bosnien und Herzegowina',  1, 'Zypern',   2),

('2014-10-10', 'Belgien',       6, 'Andorra',    0),
('2014-10-10', 'Zypern',   1, 'Israel',     2),
('2014-10-11', 'Wales',        0, 'Bosnien und Herzegowina',  0),

('2014-10-13', 'Andorra',  1, 'Israel',       4),
('2014-10-13', 'Bosnien und Herzegowina',        1, 'Belgien',   1),
('2014-10-13', 'Wales',    2, 'Zypern',     1),

('2014-11-16', 'Belgien',    0, 'Wales',        0),
('2014-11-16', 'Zypern',  5, 'Andorra',    0),
('2014-11-16', 'Israel',   3, 'Bosnien und Herzegowina',       0),

('2015-03-28', 'Israel',     0, 'Wales',  3),
('2015-03-28', 'Andorra',   0, 'Bosnien und Herzegowina',    3),
('2015-03-28', 'Belgien',       5, 'Zypern',        0),

('2015-03-31', 'Israel',        0, 'Belgien',     1),

('2015-06-12', 'Andorra',     1, 'Zypern',  3),
('2015-06-12', 'Bosnien und Herzegowina',   3, 'Israel',    1),
('2015-06-12', 'Wales',       1, 'Belgien',        0),

('2015-09-03', 'Belgien',     3, 'Bosnien und Herzegowina',   1),
('2015-09-03', 'Zypern',  0, 'Wales',        1),
('2015-09-03', 'Israel',    4, 'Andorra',       0),

('2015-09-06', 'Wales',        0, 'Israel',    0),
('2015-09-06', 'Bosnien und Herzegowina',       3, 'Andorra',     0),
('2015-09-06', 'Zypern',   0, 'Belgien',  1),

('2015-10-10', 'Andorra',     1, 'Belgien',    4),
('2015-10-10', 'Bosnien und Herzegowina',       2, 'Wales',  0),
('2015-10-10', 'Israel',   1, 'Zypern',        2),

('2015-10-13', 'Belgien',  3, 'Israel',     1),
('2015-10-13', 'Zypern',    2, 'Bosnien und Herzegowina',   3),
('2015-10-13', 'Wales',        2, 'Andorra',       0),

-- Gruppe C

('2014-09-08', 'Luxemburg',    1, 'Weißrussland',      1),
('2014-09-08', 'Spanien',      5, 'Mazedonien',   1),
('2014-09-08', 'Ukraine',      0, 'Slowakei',     1),

('2014-10-09', 'Weißrussland',      0, 'Ukraine',      2),
('2014-10-09', 'Mazedonien',   3, 'Luxemburg',    2),
('2014-10-09', 'Slowakei',     2, 'Spanien',      1),

('2014-10-12', 'Ukraine',      1, 'Mazedonien',   0),
('2014-10-12', 'Weißrussland',      1, 'Slowakei',     3),
('2014-10-12', 'Luxemburg',    0, 'Spanien',      4),

('2014-11-15', 'Luxemburg',    0, 'Ukraine',      3),
('2014-11-15', 'Mazedonien',   0, 'Slowakei',     2),
('2014-11-15', 'Spanien',      3, 'Weißrussland',      0),

('2015-03-27', 'Mazedonien',   1, 'Weißrussland',      2),
('2015-03-27', 'Slowakei',     3, 'Luxemburg',    0),
('2015-03-27', 'Spanien',      1, 'Ukraine',      0),

('2015-06-14', 'Ukraine',      3, 'Luxemburg',    0),
('2015-06-14', 'Weißrussland',      0, 'Spanien',      1),
('2015-06-14', 'Slowakei',     2, 'Mazedonien',   1),

('2015-09-05', 'Luxemburg',    1, 'Mazedonien',   0),
('2015-09-05', 'Ukraine',      3, 'Weißrussland',      1),
('2015-09-05', 'Spanien',      2, 'Slowakei',     0),

('2015-09-08', 'Weißrussland',      2, 'Luxemburg',    0),
('2015-09-08', 'Mazedonien',   0, 'Spanien',      1),
('2015-09-08', 'Slowakei',     0, 'Ukraine',      0),

('2015-10-09', 'Mazedonien',   0, 'Ukraine',      2),
('2015-10-09', 'Slowakei',     0, 'Weißrussland',      1),
('2015-10-09', 'Spanien',      4, 'Luxemburg',    0),

('2015-10-12', 'Weißrussland',      0, 'Mazedonien',   0),
('2015-10-12', 'Luxemburg',    2, 'Slowakei',     4),
('2015-10-12', 'Ukraine',      0, 'Spanien',      1),

-- Gruppe D

('2014-09-07', 'Georgien',     1, 'Irland',       2),
('2014-09-07', 'Deutschland',  2, 'Schottland',   1),
('2014-09-07', 'Gibraltar',    0, 'Polen',   	7),

('2014-10-11', 'Irland',       7, 'Gibraltar',    0),
('2014-10-11', 'Schottland',   1, 'Georgien',     0),
('2014-10-11', 'Polen',        2, 'Deutschland',  0),

('2014-10-14', 'Deutschland',  1, 'Irland',       1),
('2014-10-14', 'Polen',        2, 'Schottland',   2),
('2014-10-14', 'Gibraltar',    0, 'Georgien',     3),

('2014-11-14', 'Georgien',     0, 'Polen',        4),
('2014-11-14', 'Deutschland',  4, 'Gibraltar',    0),
('2014-11-14', 'Schottland',   1, 'Irland',       0),

('2015-03-29', 'Georgien',     0, 'Deutschland',  2),
('2015-03-29', 'Schottland',   6, 'Gibraltar',    1),
('2015-03-29', 'Irland',       1, 'Polen',        1),

('2015-06-13', 'Polen',        4, 'Georgien',     0),
('2015-06-13', 'Irland',       1, 'Schottland',   1),
('2015-06-13', 'Gibraltar',    0, 'Deutschland',  7),

('2015-09-04', 'Georgien',     1, 'Schottland',   0),
('2015-09-04', 'Deutschland',  3, 'Polen',        1),
('2015-09-04', 'Gibraltar',    0, 'Irland',       4),

('2015-09-07', 'Polen',        8, 'Gibraltar',    1),
('2015-09-07', 'Irland',       1, 'Georgien',     0),
('2015-09-07', 'Schottland',   2, 'Deutschland',  3),

('2015-10-08', 'Georgien',     4, 'Gibraltar',    0),
('2015-10-08', 'Irland',       1, 'Deutschland',  0),
('2015-10-08', 'Schottland',   2, 'Polen',        2),

('2015-10-11', 'Deutschland',  2, 'Georgien',     1),
('2015-10-11', 'Gibraltar',    0, 'Schottland',   6),
('2015-10-11', 'Polen',        2, 'Irland',       1),

-- Gruppe E

('2014-09-08', 'Estland',     1, 'Slowenien',  	0),
('2014-09-08', 'San Marino',  0, 'Litauen',   	2),
('2014-09-08', 'Schweiz',   	 0, 'England',   	2),

('2014-10-09', 'England',      5, 'San Marino',   0),
('2014-10-09', 'Litauen',   	  1, 'Estland',   	0),
('2014-10-09', 'Slowenien',    1, 'Schweiz',  	0),

('2014-10-12', 'Estland',  	  0, 'England',      1),
('2014-10-12', 'Litauen',      0, 'Slowenien',  	2),

('2014-10-14', 'San Marino',   0, 'Schweiz',      4),

('2014-11-15', 'England',      3, 'Slowenien',    1),
('2014-11-15', 'San Marino',   0, 'Estland',  	0),
('2014-11-15', 'Schweiz',      4, 'Litauen',      0),

('2015-03-27', 'England',      4, 'Litauen',  	0),
('2015-03-27', 'Slowenien',    6, 'San Marino',   0),
('2015-03-27', 'Schweiz',      3, 'Estland',      0),

('2015-06-14', 'Estland',      2, 'San Marino',   0),
('2015-06-14', 'Slowenien',    2, 'England',   	3),
('2015-06-14', 'Litauen', 	  1, 'Schweiz',  	2),

('2015-09-05', 'Estland',      1, 'Litauen',   	0),
('2015-09-05', 'San Marino',   0, 'England',      6),
('2015-09-05', 'Schweiz', 	  3, 'Slowenien',    2),

('2015-09-08', 'England',      2, 'Schweiz', 		0),
('2015-09-08', 'Litauen',  	  2, 'San Marino',    1),
('2015-09-08', 'Slowenien',    1, 'Estland',   	0),

('2015-10-09', 'England',      4, 'Estland',      0),
('2015-10-09', 'Slowenien',    1, 'Litauen',  	1),
('2015-10-09', 'Schweiz', 	  7, 'San Marino', 	0),

('2015-10-12', 'Estland',  	  0, 'Schweiz',      1),
('2015-10-12', 'Litauen',      0, 'England',   	3),
('2015-10-12', 'San Marino',    0, 'Slowenien',    2),

-- Gruppe F

('2014-09-07', 'Ungarn',     1, 'Nordirland',       2),
('2014-09-07', 'Färöer-Inseln',  1, 'Finnland',   3),
('2014-09-07', 'Griechenland',    1, 'Rumänien',   	3),

('2014-10-11', 'Rumänien',       1, 'Ungarn',    1),
('2014-10-11', 'Finnland',   1, 'Griechenland',     1),
('2014-10-11', 'Nordirland',        2, 'Färöer-Inseln',  0),

('2014-10-14', 'Färöer-Inseln',  0, 'Ungarn',       1),
('2014-10-14', 'Finnland',        0, 'Rumänien',   2),
('2014-10-14', 'Griechenland',    0, 'Nordirland',     2),

('2014-11-14', 'Griechenland',     0, 'Färöer-Inseln',        1),
('2014-11-14', 'Ungarn',  1, 'Finnland',    0),
('2014-11-14', 'Rumänien',   2, 'Nordirland',       0),

('2015-03-29', 'Nordirland',     2, 'Finnland',  1),
('2015-03-29', 'Rumänien',   1, 'Färöer-Inseln',    0),
('2015-03-29', 'Ungarn',       0, 'Griechenland',        0),

('2015-06-13', 'Finnland',        0, 'Ungarn',     1),
('2015-06-13', 'Nordirland',       0, 'Rumänien',   0),
('2015-06-13', 'Färöer-Inseln',    2, 'Griechenland',  1),

('2015-09-04', 'Färöer-Inseln',     1, 'Nordirland',   3),
('2015-09-04', 'Griechenland',  0, 'Finnland',        1),
('2015-09-04', 'Ungarn',    0, 'Rumänien',       0),

('2015-09-07', 'Finnland',        1, 'Färöer-Inseln',    0),
('2015-09-07', 'Nordirland',       1, 'Ungarn',     1),
('2015-09-07', 'Rumänien',   0, 'Griechenland',  0),

('2015-10-08', 'Ungarn',     2, 'Färöer-Inseln',    1),
('2015-10-08', 'Nordirland',       3, 'Griechenland',  1),
('2015-10-08', 'Rumänien',   1, 'Finnland',        1),

('2015-10-11', 'Färöer-Inseln',  0, 'Rumänien',     3),
('2015-10-11', 'Finnland',    1, 'Nordirland',   1),
('2015-10-11', 'Griechenland',        4, 'Ungarn',       3),

-- Gruppe G

('2014-09-08', 'Russland',     4, 'Liechtenstein',  0),
('2014-09-08', 'Österreich',  1, 'Schweden',   1),
('2014-09-08', 'Montenegro',    2, 'Moldawien',  0),

('2014-10-09', 'Liechtenstein',  0, 'Montenegro',    0),
('2014-10-09', 'Moldawien',   1, 'Österreich',     2),
('2014-10-09', 'Schweden',        1, 'Russland',  1),

('2014-10-12', 'Österreich',  1, 'Montenegro',       0),
('2014-10-12', 'Russland',        1, 'Moldawien',   1),
('2014-10-12', 'Schweden',    2, 'Liechtenstein',     0),

('2014-11-15', 'Österreich',     1, 'Russland',        0),
('2014-11-15', 'Moldawien',  0, 'Liechtenstein',    1),
('2014-11-15', 'Montenegro',   1, 'Schweden',       1),

('2015-03-27', 'Liechtenstein',     0, 'Österreich',  5),
('2015-03-27', 'Moldawien',   0, 'Schweden',    2),
('2015-03-27', 'Montenegro',       0, 'Russland',        3),

('2015-06-14', 'Liechtenstein',        1, 'Moldawien',     1),
('2015-06-14', 'Russland',       0, 'Österreich',   1),
('2015-06-14', 'Schweden',    3, 'Montenegro',  1),

('2015-09-05', 'Russland',     1, 'Schweden',   0),
('2015-09-05', 'Österreich',  1, 'Moldawien',        0),
('2015-09-05', 'Montenegro',    2, 'Liechtenstein',       0),

('2015-09-08', 'Liechtenstein',        0, 'Russland',    7),
('2015-09-08', 'Moldawien',       0, 'Montenegro',     2),
('2015-09-08', 'Schweden',   1, 'Österreich',  4),

('2015-10-09', 'Liechtenstein',     0, 'Schweden',    2),
('2015-10-09', 'Moldawien',       1, 'Russland',  2),
('2015-10-09', 'Montenegro',   2, 'Österreich',        3),

('2015-10-12', 'Österreich',  3, 'Liechtenstein',     0),
('2015-10-12', 'Russland',    2, 'Montenegro',   0),
('2015-10-12', 'Schweden',        2, 'Moldawien',       0),

-- Gruppe H

('2014-09-09', 'Aserbaidschan', 1, 'Bulgarien',    2),
('2014-09-09', 'Kroatien',  2, 'Malta',     0),
('2014-09-09', 'Norwegen',  0, 'Italien',     2),

('2014-10-10', 'Bulgarien', 0, 'Kroatien',     1),
('2014-10-10', 'Italien',  2, 'Aserbaidschan',    1),
('2014-10-10', 'Malta',  0, 'Norwegen',     3),

('2014-10-13', 'Kroatien',  6, 'Aserbaidschan',    0),
('2014-10-13', 'Malta',  0, 'Italien',     1),
('2014-10-13', 'Norwegen',  2, 'Bulgarien',    1),

('2014-11-16', 'Aserbaidschan', 0, 'Norwegen',     1),
('2014-11-16', 'Bulgarien', 1, 'Malta',     1),
('2014-11-16', 'Italien',  1, 'Kroatien',     1),

('2015-03-28', 'Aserbaidschan', 2, 'Malta',     0),
('2015-03-28', 'Kroatien',  5, 'Norwegen',     1),
('2015-03-28', 'Bulgarien', 2, 'Italien',     2),

('2015-06-12', 'Kroatien',  1, 'Italien',     1),
('2015-06-12', 'Malta',  0, 'Bulgarien',    1),
('2015-06-12', 'Norwegen',  0, 'Aserbaidschan',    0),

('2015-09-03', 'Aserbaidschan', 0, 'Kroatien',     0),
('2015-09-03', 'Bulgarien', 0, 'Norwegen',     1),
('2015-09-03', 'Italien',  1, 'Malta',     0),

('2015-06-06', 'Malta',  2, 'Aserbaidschan',    2),
('2015-06-06', 'Norwegen',  2, 'Kroatien',     0),
('2015-06-06', 'Italien',  1, 'Bulgarien',    0),

('2015-10-10', 'Aserbaidschan', 1, 'Italien',     3),
('2015-10-10', 'Norwegen',  2, 'Malta',     0),
('2015-10-10', 'Kroatien',  3, 'Bulgarien',    0),

('2015-10-13', 'Bulgarien', 2, 'Aserbaidschan',    0),
('2015-10-13', 'Italien',  2, 'Norwegen',     1),
('2015-10-13', 'Malta',  0, 'Kroatien',     1),

-- Gruppe I

('2014-09-07', 'Dänemark',  2, 'Armenien',   1),
('2014-09-07', 'Portugal',   0, 'Albanien',   1),

('2014-10-11', 'Armenien',   1, 'Serbien',    1),
('2014-10-11', 'Albanien',   1, 'Dänemark',  1),

('2014-10-14', 'Dänemark',  0, 'Portugal',   1),
('2014-10-14', 'Serbien',    0, 'Albanien',   3),

('2014-11-14', 'Portugal',   1, 'Armenien',   0),
('2014-11-14', 'Serbien',    1, 'Dänemark',  3),

('2015-03-29', 'Albanien',   2, 'Armenien',   1),
('2015-03-29', 'Portugal',   2, 'Serbien',    1),

('2015-06-13', 'Armenien',   2, 'Portugal',   3),
('2015-06-13', 'Dänemark',  2, 'Serbien',    0),

('2015-09-04', 'Dänemark',  0, 'Albanien',   0),
('2015-09-04', 'Serbien',    2, 'Armenien',   0),


('2015-09-07', 'Armenien',   0, 'Dänemark',  0),
('2015-09-07', 'Albanien',   0, 'Portugal',   1),


('2015-10-08', 'Albanien',   0, 'Serbien',    2),
('2015-10-08', 'Portugal',   1, 'Dänemark',  0),

('2015-10-11', 'Armenien',   0, 'Albanien',   3),
('2015-10-11', 'Serbien',    1, 'Portugal',   2);
