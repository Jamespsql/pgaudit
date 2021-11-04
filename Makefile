# contrib/pg_audit/Makefile

MODULE_big = pgaudit
OBJS = pgaudit.o $(WIN32RES)

EXTENSION = pgaudit
DATA = pgaudit--1.0.9.sql pgaudit--1.0--1.0.6.sql pgaudit--1.0.6--1.0.7.sql pgaudit--1.0.7--1.0.8.sql pgaudit--1.0.8--1.0.9.sql
PGFILEDESC = "pgAudit - An audit logging extension for PostgreSQL"

REGRESS = pgaudit
REGRESS_OPTS = --temp-config=$(top_srcdir)/contrib/pgaudit/pgaudit.conf

ifdef USE_PGXS
PG_CONFIG = pg_config
PGXS := $(shell $(PG_CONFIG) --pgxs)
include $(PGXS)
else
subdir = contrib/pgaudit
top_builddir = ../..
include $(top_builddir)/src/Makefile.global
include $(top_srcdir)/contrib/contrib-global.mk
endif
