AS = riscv64-linux-gnu-as
LD = riscv64-linux-gnu-ld
OBJS = hello_world.o

ifdef DEBUG
ASFLAGS = -g
else
ASFLAGS =
endif

%.o: %.S
	$(AS) $(ASFLAGS) $< -o $@

hello_world: $(OBJS)
	$(LD) -o $@ $(OBJS)

clean:
	rm -f $(OBJS) hello_world
