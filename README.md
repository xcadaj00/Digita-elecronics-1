# Digital-elecronics-1

## Labs

_this is italic_

__this is bold__

[This is link to Google's IPv6 only site](https://ipv6.google.com/)

**Source code**

```vhdl
library ieee;
use ieee.std_logic_1164.all;
entity MUX2to1 is port(
 A, B: in std_logic_vector(7 downto 0);
 Sel: in std_logic;
 Y: out std_logic_vector(7 downto 0));
end MUX2to1;
architecture behavior of MUX2to1 is
begin
 process (Sel, A, B) -- rerun process if any changes, sensitivity list, all inputs
 begin
 if (Sel = '1') then
 Y <= B;
 else
 Y <= A;
 end if; -- note that *end if* is two words
 end process;
end behavior;
```
