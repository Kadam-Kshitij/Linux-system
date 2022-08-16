CXX=g++-10

CXXFLAGS += -std=c++20 -Wall -Wextra -Werror -fPIC -pthread

INC=-I.

CPP_FILES := $(wildcard *.cpp)

OBJS := $(addprefix obj/,$(notdir $(CPP_FILES:.cpp=.o)))

TARGET=libFactory.so

$(shell mkdir -p obj)

all : ${TARGET}

${TARGET} : ${OBJS}
	$(CXX) -shared $(OBJS) -o $@


obj/%.o: %.cpp
	$(CXX) -c $(CXXFLAGS) ${INC} -o $@ $<

clean:
	rm -rf obj
	rm -rf ${TARGET}

install:
	cp ${TARGET} ..
	cp ${TARGET} /usr/lib

uninstall:
	rm -rf ../${TARGET}
	rm -rf /usr/lib/${TARGET}

.PHONY: all clean install uninstall
// PHONY targets are targets which will be considered out of date irrespective of file system state

static : ${OBJS}
        ar rcs libStaticKMath.a ${OBJS}
