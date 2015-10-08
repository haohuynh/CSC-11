PROGRAMS=10a 12a 12b

ifneq ($(MAKECMDGOALS),) 
	PROGRAMS=$(MAKECMDGOALS) 
endif 

all:$(PROGRAMS) 

$(PROGRAMS):%:%.o 
	ld -o $@ $<   

clean: 
	rm-f*.o$(PROGRAMS)




