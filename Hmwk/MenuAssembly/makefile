PROGRAMS=MainMenu

ifneq ($(MAKECMDGOALS),) 
	PROGRAMS=$(MAKECMDGOALS) 
endif 

all:$(PROGRAMS) 

$(PROGRAMS):%:%.o 
	gcc -o $@ $<   






