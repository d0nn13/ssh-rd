BOOST=../_3rd/boost_1_48_0
BOOST_LIB_PATH=$(BOOST)/stage/lib
BOOST_LIBS=$(BOOST_LIB_PATH)/libboost_program_options.a $(BOOST_LIB_PATH)/libboost_iostreams.a
UNIVERSAL_FLAGS=-force_cpusubtype_ALL -mmacosx-version-min=10.6 -arch x86_64
SDK_ROOT=`xcrun --show-sdk-path`
FRAMEWORK_PATH=$(SDK_ROOT)/System/Library/Frameworks
CFLAGS=-Iinclude -I.. -I../syringe/include -I../xpwn/includes -I../xpwn/dll -F$(FRAMEWORK_PATH) -I$(FRAMEWORK_PATH)/JavaVM.framework/Headers -DMUX_BUILD=1 $(UNIVERSAL_FLAGS) -fvisibility=hidden 
TOOL=fuzzy_patcher
DYLIB=jsyringeapi.jnilib
LIBS=bz2 system curl z crypto objc
LIB_FILES=../syringe/syringe/libsyringe.a ../fuzzy_patcher/fuzzy_patcher.a ../xpwn/dmglib.a ../mux_redux/mux_redux.jnilib /usr/local/lib/libusb-1.0.a /usr/local/Cellar/gcc/5.3.0/lib/gcc/5/libstdc++.a
# builtin libusb not universal
LINK_FLAGS=-framework IOKit -framework CoreFoundation -L$(SDK_ROOT)/usr/lib -L/usr/local/lib/ -L. $(LD_FLAGS)
SOURCES=jsyringeapi.c jsyringeapi2.c jsyringeapi3.c

$(DYLIB): $(SOURCES)
	gcc -dynamiclib -o $(DYLIB) $(CFLAGS) $(LINK_FLAGS) $(SOURCES) $(LIB_FILES) $(patsubst %,-l%,$(LIBS)) $(BOOST_LIBS)
	#gcc -c $(CFLAGS) $(SOURCES)
	#libtool -dynamic -o $(DYLIB) -Wl,-mmin=1 $(LINK_FLAGS) $(patsubst %.c,%.o, $(SOURCES)) $(LIB_FILES) $(patsubst %,-l%,$(LIBS)) $(BOOST_LIBS)

otherDylib:
	cp ../mux_redux/mux_redux.jnilib .

all: $(DYLIB) otherDylib

clean:
	rm *.o *.jnilib
