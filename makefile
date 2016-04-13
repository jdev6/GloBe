ROM := "sml.gb"

run:
	love . $(ROM)

love:
	mkdir lovetmp
	cp *.lua lib src ./lovetmp -r
	cd lovetmp && zip -9 -q -r ../builds/globe.love .
	rm -rf ./lovetmp

linux: love
	cat /usr/bin/love builds/globe.love > builds/globe
	chmod +x builds/globe

clean:
	rm builds/* -i
	
