all: compile

doc:
	./rebar3 as doc edown

clean-devel: clean
	-rm -rf _build

clean:
	-rm -f .build_date
	./rebar3 clean

compile:
	./rebar3 compile

test:
	./rebar3 do xref, eunit, cover
	./covertool \
		-cover _build/test/cover/eunit.coverdata \
		-appname sapper \
		-output cobertura.xml > /dev/null

shell:
	./rebar3 as dev shell

.PHONY: doc test compile all shell

