LIBRARY=ipv6pref.so
MANPAGE=ipv6pref.1

VERSION:=$(shell cat version.inc)

all: $(LIBRARY) $(MANPAGE)

$(LIBRARY): ipv6pref.c
	$(CC) $(CFLAGS) $< $(LDFLAGS) -ldl -shared -o $@

%.1: %.pod
	pod2man \
		--center="ipv6pref" \
		--section=1 \
		--release="$(VERSION)" \
		$< > $@

clean:
	-rm $(LIBRARY) $(MANPAGE)
