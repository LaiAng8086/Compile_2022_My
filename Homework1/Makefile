INCLUDE := -I./src/

all: clean 1.ready 2.ready 3.ready 4.ready 5.ready

.PHONY: clean

clean:
	rm -rf *~ *.out output/ bin/ *.ready *.zip

%.ready:
	mkdir -p output bin
	sed '1,2d' src/testfile$*.c > output/testfile$.txt
	gcc src/testfile$*.c -g $(INCLUDE) -o bin/$*.out
	bin/$*.out < input/input$*.txt > output/output$*.txt
	cp input/input$*.txt output/input$*.txt
	touch $@

pack: all
	rm -f submit.zip
	cd output && zip -r ../submit.zip ./*