PROGRAMS=C2F F2C MainMenu 

ifneq ($(MAKECMDGOALS),) 
	PROGRAMS=$(MAKECMDGOALS) 
endif 

all:$(PROGRAMS) 

$(PROGRAMS):%.o:%.s
	as -o $@ $<   






