PROGRAMS=if ifelse switch for while do

ifneq ($(MAKECMDGOALS),) 
	PROGRAMS=$(MAKECMDGOALS) 
endif 

all:$(PROGRAMS) 

$(PROGRAMS):%:%.o 
	ld -o $@ $<   

clean: 
	rm-f*.o$(PROGRAMS)




