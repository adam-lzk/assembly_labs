AS=nasm
ASFLAGS=-g -f elf -F dwarf
LD=ld
LDFLAGS=-m elf_i386
SRC_ASM=$(wildcard ./*.asm)
OBJ_ASM=$(SRC_ASM:.asm=.o)
# SOURCES=$(wildcard ./*.asm)
# OBJECTS=$(SOURCES:.asm=.o)
NAME=test

all: $(NAME)

clean:
	rm -rf *o $(NAME)

%.o: %.asm
	$(AS) $(ASFLAGS) -o $@ $<

$(NAME): $(OBJ_ASM)
	$(LD) $(LDFLAGS) $(OBJECTS) -o $@ $(OBJ_ASM)
