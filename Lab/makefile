PROGRAMS=hello1 printf1 printf2 mul5func mul5main

ifneq ($(MAKECMDGOALS),) 
	PROGRAMS=$(MAKECMDGOALS) 
endif 

all:$(PROGRAMS) 

$(PROGRAMS):%:%.o 
	gcc -o $@ $<   

clean: 
	rm-f*.o$(PROGRAMS)




