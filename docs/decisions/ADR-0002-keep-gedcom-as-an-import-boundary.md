# ADR-0002 — Keep GEDCOM as an import boundary

## Status

Accepted

## Context

Chronomusica imports initial data from Gramps through GEDCOM files.
GEDCOM is not the domain model of the application and may not remain
the only source of data.

## Decision

Chronomusica will use a minimal internal GEDCOM tree only during import.

The GEDCOM parser will extract the information required by Chronomusica,
but it will not attempt to implement or persist the complete GEDCOM model.

GEDCOM nodes will never be exposed to the application domain or to the
web interface. Dedicated mappers will convert them into
Chronomusica-oriented import objects.

## Consequences

- The domain model remains independent of Gramps and GEDCOM.
- Other import formats can be added later.
- The parser stays deliberately small.
- Unsupported GEDCOM constructs are reported as import issues.
- Some GEDCOM information may be ignored when it has no value for
  Chronomusica.
