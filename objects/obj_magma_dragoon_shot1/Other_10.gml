var t = timer++;
if (t mod 7 == 0)
	v_speed *= -1;
if (t > 200) {
	persist = false;
}