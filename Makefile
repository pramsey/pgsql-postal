
MODULE_big = postal
OBJS = postal.o
EXTENSION = postal
DATA = postal--1.1.sql postal--1.0--1.1.sql
REGRESS = postal
EXTRA_CLEAN =

PG_CONFIG = pg_config

POSTAL_INCLUDE = /usr/local/include
POSTAL_LIBS = /usr/local/lib

CFLAGS += -I$(POSTAL_INCLUDE)
LIBS += -L$(POSTAL_LIBS) -lpostal
SHLIB_LINK := $(LIBS)

PGXS := $(shell $(PG_CONFIG) --pgxs)
include $(PGXS)
