PROGRAMS=hello1 printf1 printf2

ifneq ($(MAKECMDGOALS),) 
	PROGRAMS=$(MAKECMDGOALS) 
endif 

all:$(PROGRAMS) 

$(PROGRAMS):%:%.o 
	gcc -o $@ $<   

clean: 
	rm-f*.o$(PROGRAMS)




