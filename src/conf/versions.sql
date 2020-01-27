DROP VIEW IF EXISTS v_versions;

DROP TABLE IF EXISTS versions;
DROP TABLE IF EXISTS releases;
DROP TABLE IF EXISTS projects;
DROP TABLE IF EXISTS categories;
DROP TABLE IF EXISTS families;

CREATE TABLE families (
  family      INTEGER NOT NULL PRIMARY KEY,
  description TEXT,
  short_desc  TEXT,
  image       TEXT
);
INSERT INTO families VALUES (10, '_', '_', '_');
INSERT INTO families VALUES (20, 'Worlds Most Advanced Open Source RDBMS', 'Best RDBMS', 'postgres.png');
INSERT INTO families VALUES (30, 'Interoperability & Compatibility',       'Compatible', 'plug_compat.png');
INSERT INTO families VALUES (40, 'Security, Scalability & Availability',   'Capable',    'ability.png');
INSERT INTO families VALUES (50, 'Containers, Connectors & Applications',  'Useful',     'needle_thread.png');


CREATE TABLE categories (
  category    INTEGER NOT NULL PRIMARY KEY,
  family      INTEGER NOT NULL REFERENCES families(family),
  description TEXT    NOT NULL,
  short_desc  TEXT    NOT NULL
);
INSERT INTO categories VALUES (0, 10,  'Hidden',            'NotShown');
INSERT INTO categories VALUES (1, 20,  'PostgreSQL',        'Postgres');
INSERT INTO categories VALUES (2, 30,  'Interoperability',  'Interop');
INSERT INTO categories VALUES (3, 30,  'Compatibility',     'Compat');
INSERT INTO categories VALUES (4, 40,  'Security',          'Secure');
INSERT INTO categories VALUES (5, 40,  'Scalability',       'Scalable');
INSERT INTO categories VALUES (6, 40,  'Availability',      'Reliable');
INSERT INTO categories VALUES (7, 50,  'Containerization',  'Contain');
INSERT INTO categories VALUES (8, 50,  'Client Adapters',   'Connects');

CREATE TABLE projects (
  project   	 TEXT     NOT NULL PRIMARY KEY,
  category  	 INTEGER  NOT NULL,
  port      	 INTEGER  NOT NULL,
  depends   	 TEXT     NOT NULL,
  start_order    INTEGER  NOT NULL,
  sources_url    TEXT     NOT NULL,
  short_name     TEXT     NOT NULL,
  is_extension   SMALLINT NOT NULL,
  image_file     TEXT     NOT NULL,
  description    TEXT     NOT NULL,
  project_url    TEXT     NOT NULL,
  FOREIGN KEY (category) REFERENCES categories(category)
);

INSERT INTO projects VALUES ('hub',0, 0,    'hub', 0, 'https://github.com/','',0,'','','');
INSERT INTO projects VALUES ('pg', 1, 5432, 'hub', 1, 'https://postgresql.org/download', 'postgres', 0, 'postgres.png', 'Most Advanced RDBMS', 'https://postgresql.org');

INSERT INTO projects VALUES ('cassandra',     2, 0, 'hub', 0, 'https://cassandra.apache.org', 'cassandra', 0, 'cstar.png', 'Multi-Master Big Data', 'https://cassandra.apache.org');
INSERT INTO projects VALUES ('cassandra_fdw', 2, 0, 'hub', 0, 'https://github.com/bigsql/cassandra_fdw/releases', 'cstarfdw', 1, 'cstar.png', 'Cassandra Access from PG', 'https://github.com/bigsql/cassandra_fdw#cassandra_fdw');

INSERT INTO projects VALUES ('hive',     2, 0, 'hub', 0, 'https://github.com/hivedb/hive/releases', 'hive', 1, 'hive.png', 'Distributed SQL Queries', 'https://hiveapache.org');
INSERT INTO projects VALUES ('pghive', 2, 0, 'hub', 0, 'https://github.com/bigsql/pghive/releases', 'pghive', 1, 'pghive.png', 'Distributed Storage Access from PG', 'https://github.com/bigsql/pghivew#pghive');

INSERT INTO projects VALUES ('mysql',      2, 0, 'hub', 0, 'https://dev.mysql.com/downloads/mysql', 'mysql', 0, 'mysql.png', 'MySQL Server CE', 'https://dev.mysql.com');
INSERT INTO projects VALUES ('mysql_fdw',  2, 0, 'hub', 0, 'https://github.com/EnterpriseDB/mysql_fdw/releases', 'mysql_fdw', 1, 'mysql.png', 'MySQL Access from PG', 'https://github.com/EnterpriseDb/mysql_fdw');

INSERT INTO projects VALUES ('sqlsvr',     2, 0, 'hub', 0, 'https://www.microsoft.com/en-us/sql-server/sql-server-2019', 'sqlsvr', 0, 'sqlsvr.png', 'SQL Server Express', 'https://www.microsoft.com/en-us/sql-server/sql-server-2019');
INSERT INTO projects VALUES ('sybase',     2, 0, 'hub', 0, 'https://sap.com/products/sybase-ase.html', 'sybase', 0, 'sybase.png', 'Sybase ASE Express', 'https://sap.com/products/sybase-ase.html');
INSERT INTO projects VALUES ('pgtsql',     3, 0, 'hub', 0, 'https://github.com/bigsql/pgtsql/releases', 'pgtsql', 1, 'tds.png', 'Transact-SQL Procedures', 'https://github.com/bigsql/pgtsql#pgtsql');
INSERT INTO projects VALUES ('tds_fdw',    2, 0, 'hub', 0, 'https://github.com/tds-fdw/tds_fdw/releases', 'tds_fdw', 1, 'tds.png', 'SQL Server & Sybase Access from PG', 'https://github.com/tds-fdw/tds_fdw/#tds-foreign-data-wrapper');

INSERT INTO projects VALUES ('plv8',       2, 0, 'hub', 0, 'https://github.com/plv8/plv8/releases', 'plv8',   1, 'v8.png', 'Javascript Stored Procedures', 'https://github.com/plv8/plv8');
INSERT INTO projects VALUES ('plpython',   2, 0, 'hub', 0, 'https://www.postgresql.org/docs/11/plpython.html', 'plpython', 1, 'python.png', 'Python3 Stored Procedures', 'https://www.postgresql.org/docs/11/plpython.html');
INSERT INTO projects VALUES ('plperl',     2, 0, 'hub', 0, 'https://www.postgresql.org/docs/11/plperl.html', 'plperl', 1, 'perl.png', 'Perl Stored Procedures', 'https://www.postgresql.org/docs/11/plperl.html');
INSERT INTO projects VALUES ('pljava',     2, 0, 'hub', 0, 'https://github.com/tada/pljava/releases', 'pljava', 1, 'java.png', 'Java Stored Procedures', 'https://github.com/tada/pljava');

INSERT INTO projects VALUES ('oracle',     2, 0, 'hub', 0, 'https://oracle.com', 'oracle', 0, 'oracle.png', 'Oracle Express', 'https://oracle.com');
INSERT INTO projects VALUES ('orafce',     3, 0, 'hub', 0, 'https://github.com/orafce/orafce/releases', 'orafce', 1, 'orafce.png', 'Ora Built-in Packages', 'https://github.com/orafce/orafce#orafce---oracles-compatibility-functions-and-packages');
INSERT INTO projects VALUES ('pgosql',     3, 0, 'hub', 0, 'https://github.com/bigsql/pgosql/releases', 'pgosql', 1, 'sailboat.png', 'PL/SQL Procedures', 'https://github.com/bigsql/pgosql#pgosql');
INSERT INTO projects VALUES ('oracle_fdw', 2, 0, 'hub', 0, 'https://github.com/laurenz/oracle_fdw/releases', 'oracle_fdw', 1, 'oracle.png', 'Oracle Access from PG', 'https://github.com/laurenz/oracle_fdw');

INSERT INTO projects VALUES ('plprofiler', 5, 0, 'hub', 0, 'https://github.com/bigsql/plprofiler/releases', 'plprofiler', 1, 'plprofiler.png', 'Stored Procedure Profiler', 'https://github.com/bigsql/plprofiler#plprofiler');
INSERT INTO projects VALUES ('pglogical',  5, 0, 'hub', 0, 'https://github.com/2ndQuadrant/pglogical/releases', 'pglogical', 1, 'spock.png', 'Logical Streaming Replication', 'https://github.com/2ndQuadrant/pglogical#pglogical-2');
INSERT INTO projects VALUES ('timescaledb',5, 0, 'hub', 0, 'https://github.com/timescale/timescaledb/releases', 'timescaledb', 1, 'timescaledb.png', 'Time Series Data', 'https://github.com/timescale/timescaledb/#timescaledb');
INSERT INTO projects VALUES ('hypopg',     5, 0, 'hub', 0, 'https://github.com/HypoPG/hypopg/releases', 'hypopg', 1, 'whatif.png', 'Hypothetical Indexes', 'https://hypopg.readthedocs.io/en/latest/');
INSERT INTO projects VALUES ('bouncer',    5, 0, 'hub', 0, 'https://pgbackrest.org/release.html', 'bouncer',  0, 'bouncer.png', 'Lightweight Connection Pooler', 'https://pgbackrest.org');
INSERT INTO projects VALUES ('badger',     5, 0, 'hub', 0, 'https://github.com/darold/pgbadger/releases', 'badger', 0, 'badger.png', 'Performance Reporting', 'https://pgbadger.darold.net');
INSERT INTO projects VALUES ('partman',    5, 0, 'hub', 0, 'https://github.com/pgpartman/pg_partman/releases', 'partman', 1, 'partman.png', 'Partition Managemnt', 'https://github.com/pgpartman/pg_partman#pg-partition-manager');
INSERT INTO projects VALUES ('bulkload',   5, 0, 'hub', 0, 'https://github.com/ossc-db/pg_bulkload/releases', 'bulkload', 1, 'bulkload.png', 'High Speed Data Loading', 'https://github.com/ossc-db/pg_bulkload');

INSERT INTO projects VALUES ('backrest',   4, 0, 'hub', 0, 'https://pgbackrest.org/release.html', 'backrest', 0, 'backrest.png', 'Backup & Restore', 'https://pgbackrest.org');
INSERT INTO projects VALUES ('audit',      4, 0, 'hub', 0, 'https://github.com/pgaudit/pgaudit/releases', 'audit', 1, 'audit.png', 'Audit Logging', 'https://github.com/pgaudit/pgaudit');
INSERT INTO projects VALUES ('anon',       4, 0, 'ddlx', 0, 'https://gitlab.com/dalibo/postgresql_anonymizer/releases', 'anon', 1, 'anon.png', 'Anonymization & Masking', 'https://gitlab.com/dalibo/postgresql_anonymizer/blob/master/README.md');

INSERT INTO projects VALUES ('psycopg',    8, 0, 'hub', 3, 'http://initd.org/psycopg', 'psycopg', 0, 'psycopg.png', 'Python Adapter', 'http://initd.org/psycopg');
INSERT INTO projects VALUES ('npgsql',     8, 0, 'hub', 2, 'https://github.com/', 'npgsql', 0, 'npgsql.png', '.NET Provider', 'https://www.npgsql.org');
INSERT INTO projects VALUES ('ruby',       8, 0, 'hub', 4, 'https://rubygems.org/gems/pg', 'ruby', 0, 'ruby.png', 'Ruby Interface', 'https://github.com');
INSERT INTO projects VALUES ('jdbc',       8, 0, 'hub', 1, 'https://jdbc.postgresql.org', 'jdbc', 0, 'java.png', 'JDBC Driver', 'https://jdbc.postgresql.org');
INSERT INTO projects VALUES ('odbc',       8, 0, 'hub', 5, 'https://www.postgresql.org/ftp/odbc/versions/msi/', 'odbc', 0, 'odbc.png', 'ODBC Driver', 'https://odbc.postgresql.org');
INSERT INTO projects VALUES ('http',       8, 0, 'hub', 6, 'https://github.com/pramsey/pgsql-http/releases', 'http',  1, 'http.png', 'Invoke Web Services', 'https://github.com/pramsey/pgsql-http');

INSERT INTO projects VALUES ('docker',     7, 0, 'hub', 1, 'https://github.com/docker/docker-ce/releases', 'docker', 0, 'docker.png', 'Container Runtime', 'https://github.com/docker/docker-ce/#docker-ce');
INSERT INTO projects VALUES ('minikube', 7, 0, 'hub', 2, 'https://github.com/kubernetes/minikube/releases', 'minikube', 0, 'minikube.png', 'Kubernetes (MiniKube)', 'https://minikube.sigs.k8s.io/');
INSERT INTO projects VALUES ('helm',       7, 0, 'hub', 3, 'https://github.com/helm/helm/releases', 'helm', 0, 'helm.png', 'K8s Package Manager', 'https://helm.sh');
INSERT INTO projects VALUES ('patroni',    7, 0, 'hub', 4, 'https://github.com/zalando/patroni/releases', 'patroni', 0, 'patroni.png', 'High Availability', 'https://github.com/zalando/patroni');

INSERT INTO projects VALUES ('pgrest',     2, 0, 'hub', 3, 'https://github.com/pgrest/pgrest/releases', 'pgrest', 0, 'restapi.png', 'RESTFUL API', 'https://github.com/pgrest/pgrest');
INSERT INTO projects VALUES ('ddlx',       2, 0, 'hub', 4, 'https://github.com/lacanoid/pgddl/releases', 'ddlx',  1, 'ddlx.png', 'DDL Extractor', 'https://github.com/lacanoid/pgddl#ddl-extractor-functions--for-postgresql');
INSERT INTO projects VALUES ('omnidb',     7, 8000, 'docker', 2, 'https://github.com/omnidb/omnidb/releases', 'omnidb', 0, 'omnidb.png', 'RDBMS Web Admin', 'https://github.com/omnidb/omnidb/#omnidb');
INSERT INTO projects VALUES ('pgadmin4',   7, 1234, 'docker', 1, 'https://pgadmin.org', 'pgadmin4', 0, 'pgadmin4.png', 'PG Web Admin', 'https://pgadmin.org');


CREATE TABLE releases (
  component  TEXT     NOT NULL PRIMARY KEY,
  sort_order SMALLINT NOT NULL,
  project    TEXT     NOT NULL,
  disp_name  TEXT     NOT NULL,
  doc_url    TEXT     NOT NULL,
  stage      TEXT     NOT NULL,
  is_open    SMALLINT NOT NULL DEFAULT 1,
  FOREIGN KEY (project) REFERENCES projects(project)
);
-- Hidden
INSERT INTO releases VALUES ('hub', 1, 'hub', '', '', 'hidden', 1);

-- PostgreSQL
INSERT INTO releases VALUES ('pg11', 4, 'pg', 'PG 11',   '', 'prod',       1);
INSERT INTO releases VALUES ('pg12', 4, 'pg', 'PG 12',   '', 'prod',       1);

-- Compatibility & Integration
INSERT INTO releases VALUES ('sqlsvr',              1, 'sqlsvr',        'SQL Server', '', 'dev',  0);
INSERT INTO releases VALUES ('sybase',              2, 'sybase',        'Sybase ASE', '', 'dev',  0);
INSERT INTO releases VALUES ('pgtsql-pg11',         3, 'pgtsql',        'TransactSQL','', 'test', 1);
INSERT INTO releases VALUES ('tds_fdw-pg11',        4, 'tds_fdw',       'TDS FDW',    '', 'test', 1);

INSERT INTO releases VALUES ('oracle',              5, 'oracle',        'Oracle',     '', 'dev',  0);
INSERT INTO releases VALUES ('orafce-pg11',         6, 'orafce',        'OraFCE',     '', 'prod', 1);
INSERT INTO releases VALUES ('oracle_fdw-pg11',     7, 'oracle_fdw',    'Oracle FDW', '', 'prod', 1);
INSERT INTO releases VALUES ('pgosql-pg11',         8, 'pgosql',        'OSQL',       '', 'test', 1);

INSERT INTO releases VALUES ('plpython-pg11',      15, 'plpython',      'PL/Python',  '', 'prod', 1);
INSERT INTO releases VALUES ('plperl-pg11',        16, 'plperl',        'PL/Perl',    '', 'prod', 1);
INSERT INTO releases VALUES ('plv8-pg11',          17, 'plv8',          'PL/V8',      '', 'prod', 1);
INSERT INTO releases VALUES ('pljava-pg11',        18, 'pljava',        'PL/Java',    '', 'prod', 1);

INSERT INTO releases VALUES ('mysql',               9, 'mysql',         'MySQL',      '', 'dev',  1);
INSERT INTO releases VALUES ('mysql_fdw-pg11',     10, 'mysql_fdw',     'MySQL FDW',  '', 'prod', 1);

INSERT INTO releases VALUES ('cassandra',          11, 'cassandra',     'Cassandra',  '', 'prod', 1);
INSERT INTO releases VALUES ('cassandra_fdw-pg11', 12, 'cassandra_fdw', 'CassandraFDW','','prod', 1);

INSERT INTO releases VALUES ('hive',               13, 'hive',          'Hive',       '', 'prod', 1);
INSERT INTO releases VALUES ('pghive-pg11',        14, 'pghive',        'pgHive',     '', 'prod', 1);

-- Performance, Scalability, Availability, & Security
INSERT INTO releases VALUES ('postgis25-pg11',     1, 'postgis25',     'PostGIS',     '', 'prod', 1);
INSERT INTO releases VALUES ('timescaledb-pg11',   2, 'timescaledb',   'TimescaleDB', '', 'prod', 1);
INSERT INTO releases VALUES ('pglogical-pg11',     3, 'pglogical',     'pgLogical',   '', 'prod', 1);
INSERT INTO releases VALUES ('backrest',           4, 'backrest',      'pgBackRest',  '', 'prod', 1);
INSERT INTO releases VALUES ('badger',             5, 'badger',        'pgBadger',    '', 'prod', 1);
INSERT INTO releases VALUES ('bulkload-pg11',      6, 'bulkload',      'pgBulkLoad',  '', 'prod', 1);
INSERT INTO releases VALUES ('partman-pg11',       7, 'partman',       'pgPartman',   '', 'prod', 1);
INSERT INTO releases VALUES ('hypopg-pg11',        8, 'hypopg',        'HypoPG',      '', 'prod', 1);
INSERT INTO releases VALUES ('plprofiler-pg11',    9, 'plprofiler',    'plProfiler',  '', 'prod', 1);
INSERT INTO releases VALUES ('audit-pg11',        10, 'audit',         'pgAudit',     '', 'prod', 1);
INSERT INTO releases VALUES ('anon-pg11',         11, 'anon',          'Anonymizer',  '', 'prod', 1);

-- Applications & Administration
INSERT INTO releases VALUES ('ddlx-pg11',         14, 'ddlx',          'DDLeXtact',   '', 'prod', 1);
INSERT INTO releases VALUES ('http-pg11',         13, 'http',          'HTTP Client', '', 'prod', 1);
INSERT INTO releases VALUES ('docker',             1, 'docker',        'Docker',      '', 'test', 1);
INSERT INTO releases VALUES ('minikube',           2, 'minikube',      'K8s App Dev', '', 'test', 1);
INSERT INTO releases VALUES ('helm',               3, 'helm',          'Helm',        '', 'test', 1);
INSERT INTO releases VALUES ('patroni',            4, 'patroni',       'Patroni',     '', 'test', 1);
INSERT INTO releases VALUES ('pgrest',             9, 'pgrest',        'Data API',    '', 'prod', 1);
INSERT INTO releases VALUES ('bouncer',            5, 'bouncer',       'pgBouncer',   '', 'prod', 1);
INSERT INTO releases VALUES ('psycopg',            6, 'psycopg',       'psycopg',     '', 'prod', 1);
INSERT INTO releases VALUES ('ruby',               1, 'ruby',          'ruby',        '', 'prod', 1);
INSERT INTO releases VALUES ('npgsql',            10, 'npgsql',        '.net PG',     '', 'prod', 1);
INSERT INTO releases VALUES ('jdbc',               7, 'jdbc',          'JDBC',        '', 'prod', 1);
INSERT INTO releases VALUES ('odbc',               8, 'odbc',          'ODBC',        '', 'prod', 1);
INSERT INTO releases VALUES ('omnidb',            11, 'omnidb',        'OmniDB',      '', 'prod', 1);
INSERT INTO releases VALUES ('pgadmin4',          12, 'pgadmin4',      'pgAdmin 4',   '', 'prod', 1);

CREATE TABLE versions (
  component     TEXT    NOT NULL,
  version       TEXT    NOT NULL,
  platform      TEXT    NOT NULL,
  is_current    INTEGER NOT NULL,
  release_date  DATE    NOT NULL,
  parent        TEXT    NOT NULL,
  PRIMARY KEY (component, version),
  FOREIGN KEY (component) REFERENCES releases(component)
);

INSERT INTO versions VALUES ('hub',     '6.0',    '',              1, '20200201', '');

INSERT INTO versions VALUES ('pg11',    '11.6-7', 'amd, arm', 1, '20191114', '');
INSERT INTO versions VALUES ('pg12',    '12.1-7', 'amd, arm', 1, '20191114', '');

INSERT INTO versions VALUES ('bulkload-pg11',      '3.1.16-1', 'arm',            1, '20200121', 'pg11');
INSERT INTO versions VALUES ('partman-pg11',       '4.2.2-1',  'arm',            1, '20191016', 'pg11');
INSERT INTO versions VALUES ('hypopg-pg11',        '1.1.3-1',  'arm',            1, '20191123', 'pg11');
INSERT INTO versions VALUES ('pglogical-pg11',     '2.2.2-1',  'arm',            1, '20190725', 'pg11');

INSERT INTO versions VALUES ('sqlsvr',             '2019',     'amd',            1, '20191010', '');
INSERT INTO versions VALUES ('sybase',             '2019',     'amd',            1, '20191010', '');
INSERT INTO versions VALUES ('pgtsql-pg11',        '3.0-1',    'arm',            1, '20191119', 'pg11');
INSERT INTO versions VALUES ('tds_fdw-pg11',       '2.1.0-1',  'arm',            1, '20191202', 'pg11');


INSERT INTO versions VALUES ('plv8-pg11',          '2.3.14-1', 'arm',            1, '20200109', 'pg11');
INSERT INTO versions VALUES ('plpython-pg11',      '3',        'arm',            1, '20191114', 'pg11');
INSERT INTO versions VALUES ('plperl-pg11',        '5',        'arm',            1, '20191114', 'pg11');
INSERT INTO versions VALUES ('pljava-pg11',        '1.5.5-1',  'arm',            1, '20191104', 'pg11');

INSERT INTO versions VALUES ('oracle',             '11.2.0',   'amd',            1, '20191010', '');
INSERT INTO versions VALUES ('oracle_fdw-pg11',    '2.2.0-1',  'amd',            1, '20191010', 'pg11');
INSERT INTO versions VALUES ('orafce-pg11',        '3.8.0-1',  'arm',            1, '20190522', 'pg11');
INSERT INTO versions VALUES ('pgosql-pg11',        '2.0-1',    'arm',            1, '20191211', 'pg11');

INSERT INTO versions VALUES ('mysql',              '8.0.18',   'arm',            1, '20191014', '');
INSERT INTO versions VALUES ('mysql_fdw-pg11',     '2.5.3-1',  'arm',            1, '20190927', 'pg11');

INSERT INTO versions VALUES ('plprofiler-pg11',    '4.1-1',    'arm',       1, '20190823', 'pg11');
INSERT INTO versions VALUES ('ddlx-pg11',          '0.15-1',   'arm',       1, '20191024', 'pg11');
INSERT INTO versions VALUES ('audit-pg11',         '1.3.1-1',  'arm',       1, '20191225', 'pg11');
INSERT INTO versions VALUES ('http-pg11',          '1.3.1-1',  'arm',       1, '20191225', 'pg11');
INSERT INTO versions VALUES ('anon-pg11',          '0.5.0-1',  'arm',       1, '20191109', 'pg11');
INSERT INTO versions VALUES ('timescaledb-pg11',   '1.5.1-1',  'arm',       1, '20191112', 'pg11');

INSERT INTO versions VALUES ('cassandra',          '3.11.5',   '',               1, '20191029', '');
INSERT INTO versions VALUES ('cassandra_fdw-pg11', '3.1.5-1',  'arm',            1, '20191230', 'pg11');

INSERT INTO versions VALUES ('hive',             '0.229',    '',               1, '20191115', '');
INSERT INTO versions VALUES ('pghive-pg11',      '3.2-1',    'arm',            1, '20191230', 'pg11');

INSERT INTO versions VALUES ('badger',             '11.1-1',   '',               1, '20190916', '');
INSERT INTO versions VALUES ('pgrest',             '0.0.7-1',  'arm',            1, '20130813', '');
INSERT INTO versions VALUES ('bouncer',            '1.12.0-1', 'arm, amd',       1, '20191017', '');

INSERT INTO versions VALUES ('psycopg',            '2.8.4',    '',               1, '20191020', '');
INSERT INTO versions VALUES ('ruby',               '1.2.0',    '',               1, '20191224', '');
INSERT INTO versions VALUES ('npgsql',             '3.1.0',    '',               1, '20191201', '');
INSERT INTO versions VALUES ('jdbc',               '42.2.9',   '',               1, '20191206', '');
INSERT INTO versions VALUES ('odbc',               '12.01-1',  'arm, amd',       1, '20200107', '');

INSERT INTO versions VALUES ('backrest',           '2.22-1',   'arm, amd',       1, '20200121', '');
INSERT INTO versions VALUES ('helm',               '3.0.2',    'arm',            1, '20191218', '');
INSERT INTO versions VALUES ('minikube',           '1.6.2',    'arm',            1, '20191220', '');
INSERT INTO versions VALUES ('docker',             '19.03.5',  'arm',            1, '20191113', '');

INSERT INTO versions VALUES ('patroni',            '1.6.3',    '',               1, '20191205', '');

INSERT INTO versions VALUES ('omnidb',             '2.17-1',   'docker',         1, '20191205', '');
INSERT INTO versions VALUES ('pgadmin4',           '4.17',     'docker',         1, '20200109', '');

CREATE VIEW v_versions AS
  SELECT p.category as cat, r.sort_order, c.description as cat_desc, c.short_desc as cat_short_desc,
         p.image_file, r.component, r.project, r.stage, r.disp_name as release_name,
         v.version, p.sources_url, p.project_url, v.platform, 
         v.is_current, v.release_date, p.description as proj_desc
    FROM categories c, projects p, releases r, versions v
   WHERE c.category = p.category
     AND p.project = r.project
     AND r.component = v.component;
