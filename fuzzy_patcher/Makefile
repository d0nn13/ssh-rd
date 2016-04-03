BOOST=../_3rd/boost_1_48_0
CFLAGS=-force_cpusubtype_ALL -mmacosx-version-min=10.6 -arch x86_64 -I$(BOOST)
TOOL=fuzzy_patcher
LIB=fuzzy_patcher.a

$(LIB):
	g++ -c $(CFLAGS) patcher.cpp
	libtool -static -o $(LIB) patcher.o

$(TOOL): $(LIB)
	g++ $(CFLAGS) -o $(TOOL) main.cpp $(LIB) ../_3rd/boost_1_48_0/stage/lib/libboost_iostreams.a ../_3rd/boost_1_48_0/stage/lib/libboost_program_options.a

all: $(TOOL) $(LIB)

