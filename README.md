# Nexys3_Ethernet 
The project is still in development!)

The project implements Ethernet based on the Nexus 3 Spartan 6. Half-duplex mode of connecting the board and laptop via an RJ-45 cable. The LAN8710A chip is on the side of the board. The chip configuration modes were enabled via the SPI interface (MDIO, MDC) and the PHY-address was set. MIDI interface and 100BASE-TX speed are enabled with auto negotiation enabled, advertising half-duplex, with CROSS active during reception. 
The project submitted on 02/24/2024 has data transmission **collisions**.
The *microblaze* project from the Digilent website is connected as a guide for implementation already in the VHDL language.
