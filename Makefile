BIN = bin
OBJ = .obj

RECIPE=112 13 119 # 32 bit int, 32 bit pointer
TNOS=101 2 103 104 105 111 122 123 24 125 32 133 41 42 150 151 152 153 154 155 161 $(RECIPE)
TERRS=/dev/tty

FPC = fpc -g -gl -vi- -l- -Miso -Sm -dLONG:=LongWord

$(BIN)/tailor: a68s/util/tailor.p
	@mkdir -p $(dir $@)
	$(FPC) -FE$(dir $@) -o$@ $<

$(BIN)/cmpdum: a68s/aem/cmpdum.p $(BIN)/tailor
	@mkdir -p $(dir $@) $(OBJ)
	echo $(TNOS) 300 | $(BIN)/tailor $< $(TERRS) > $(OBJ)/cmpdum.p
	$(FPC) -FE$(dir $@) -o$@ $(OBJ)/cmpdum.p

